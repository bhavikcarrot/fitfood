<?php  
class ControllerModuleTMFilter extends Controller {
	
	private function _keysByAttribs( $attributes ) {
		$keys = array();
		
		foreach( $attributes as $key => $attribute ) {
			$keys[$attribute['seo_name']] = $key;
		}
		
		return $keys;
	}
	
	private function _setCache( $name, $value ) {
		if( ! is_dir( DIR_SYSTEM . 'cache_mfp' ) || ! is_writable( DIR_SYSTEM . 'cache_mfp' ) ) return false;
		
		file_put_contents( DIR_SYSTEM . 'cache_mfp/' . $name, serialize( $value ) );
		file_put_contents( DIR_SYSTEM . 'cache_mfp/' . $name . '.time', time() + 60 * 60 * 24 );
		
		return true;
	}
	
	private function _getCache( $name ) {
		$dir		= DIR_SYSTEM . 'cache_mfp/';
		$file		= $dir . $name;
		$file_time	= $file . '.time';
		
		if( ! file_exists( $file ) ) {
			return NULL;
		}
		
		if( ! file_exists( $file_time ) ) {
			return NULL;
		}
		
		$time = (float) file_get_contents( $file_time );
		
		if( $time < time() ) {
			@ unlink( $file );
			@ unlink( $file_time );
			
			return false;
		}
		
		return unserialize( file_get_contents( $file ) );
	}
	
	public function index( $setting ) {

	$data['_idx']			= $setting['_idx'];
		
		if( empty( $setting[$setting['_idx']]['status'] ) ) {
			return;
		}
		
		if( empty( $setting['base_attribs'] ) ) {
			$setting['base_attribs'] = empty( $setting[$setting['_idx']]['base_attribs'] ) ? array() : $setting[$setting['_idx']]['base_attribs'];
		}
		
		if( empty( $setting['attribs'] ) ) {
			$setting['attribs'] = empty( $setting[$setting['_idx']]['attribs'] ) ? array() : $setting[$setting['_idx']]['attribs'];
		}
		
		if( empty( $setting['options'] ) ) {
			$setting['options'] = empty( $setting[$setting['_idx']]['options'] ) ? array() : $setting[$setting['_idx']]['options'];
		}
		
		if( empty( $setting['filters'] ) ) {
			$setting['filters'] = empty( $setting[$setting['_idx']]['filters'] ) ? array() : $setting[$setting['_idx']]['filters'];
		}
		
		$settings	= $this->config->get('tm_filter_settings');
		

		if( isset( $setting[$setting['_idx']]['store_id'] ) && is_array( $setting[$setting['_idx']]['store_id'] ) && ! in_array( $this->config->get('config_store_id'), $setting[$setting['_idx']]['store_id'] ) ) {
			return;
		}
		

		$data = $this->language->load('module/tm_filter');
		

		if( isset( $setting[$setting['_idx']]['title'][$this->config->get('config_language_id')] ) ) {
			$data['heading_title'] = $setting[$setting['_idx']]['title'][$this->config->get('config_language_id')];
		}

		$this->load->model('module/tm_filter');
		$core = TMFilterCore::newInstance( $this, NULL );
		$cache = NULL;
		
		if( ! empty( $settings['cache_enabled'] ) ) {
			$cache = 'idx.' . $setting['_idx'] . '.' . $core->cacheName();
		}
		

		if( ! $cache || NULL == ( $attributes = $this->_getCache( $cache ) ) ) {
			$attributes	= $this->model_module_tm_filter->getAttributes( 
				$core,
				$setting['_idx'],
				$setting['base_attribs'], 
				$setting['attribs'], 
				$setting['options'], 
				$setting['filters']
			);
			
			if( ! empty( $settings['cache_enabled'] ) ) {
				$this->_setCache( $cache, $attributes );
			}
		}

		$keys		= $this->_keysByAttribs( $attributes );
		

		$route		= isset( $this->request->get['route'] ) ? $this->request->get['route'] : NULL;

		if( in_array( $route, array( 'product/manufacturer', 'product/manufacturer/info' ) ) && isset( $keys['manufacturers'] ) ) {
			unset( $attributes[$keys['manufacturers']] );
		}
		
		if( in_array( $route, array( 'product/search' ) ) && empty( $this->request->get['search'] ) && empty( $this->request->get['tag'] ) ) {
			$attributes = array();
		}
		
		if( ! $attributes ) {
			return;
		}
		
		$mijo_shop = false;
		
		$data['ajaxInfoUrl']		= $this->url->link( 'module/tm_filter/ajaxinfo', '', 'SSL' );
		$data['ajaxResultsUrl']		= $this->url->link( 'module/tm_filter/results', '', 'SSL' );
		$data['ajaxCategoryUrl']	= $this->url->link( 'module/tm_filter/categories', '', 'SSL' );
		
		$scheme_find = isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on' ? 'http://' : 'https://';
		$scheme_replace = $scheme_find == 'https://' ? 'http://' : 'https://';
			
		$data['ajaxInfoUrl'] = str_replace( $scheme_find, $scheme_replace, $data['ajaxInfoUrl'] );
		$data['ajaxResultsUrl'] = str_replace( $scheme_find, $scheme_replace, $data['ajaxResultsUrl'] );
		$data['ajaxCategoryUrl'] = str_replace( $scheme_find, $scheme_replace, $data['ajaxCategoryUrl'] );
		
		$data['mijo_shop']		= $mijo_shop;
		$data['filters']		= $attributes;
		$data['settings']		= $settings;
		$data['params']			= $core->getParseParams();
		$data['price']			= $core->getMinMaxPrice();
		$data['_idx']			= $setting['_idx'];
		$data['_route']			= base64_encode( $core->route() );
		$data['_routeProduct']	= base64_encode( 'product/product' );
		$data['_routeHome']		= base64_encode( 'common/home' );
		$data['_position']		= $setting['position'];
		$data['getSymbolLeft']	= $this->currency->getSymbolLeft($this->config->get('config_currency'));
		$data['getSymbolRight']	= $this->currency->getSymbolRight($this->config->get('config_currency'));
		$data['requestGet']		= $this->request->get;
		$data['_horizontalInline']	= $setting['position'] == 'content_top' && ! empty( $setting['inline_horizontal'] ) ? true : false;
		$data['smp']				= array(
			'isInstalled'			=> $this->config->get( 'smp_is_install' ),
			'disableConvertUrls'	=> $this->config->get( 'smp_disable_convert_urls' )
		);		
		$data['_v'] = $this->config->get('mfilter_version') ? $this->config->get('mfilter_version') : '1';
		
		if( $mijo_shop ) {
			MijoShop::getClass('base')->addHeader(JPATH_MIJOSHOP_OC . '/catalog/view/javascript/tmfilter/iscroll.js', false);
			MijoShop::getClass('base')->addHeader(JPATH_MIJOSHOP_OC . '/catalog/view/javascript/tmfilter/tm_filter.js', false);

			if( file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/stylesheet/tmfilter/style.css') ) {
				MijoShop::get()->addHeader(JPATH_MIJOSHOP_OC.'/catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/tmfilter/style.css');
			} else {
				MijoShop::get()->addHeader(JPATH_MIJOSHOP_OC.'/catalog/view/theme/default/stylesheet/tmfilter/style.css');
			}
			
			MijoShop::get()->addHeader(JPATH_MIJOSHOP_OC.'/catalog/view/theme/default/stylesheet/tmfilter/style-2.css');
		} else {

			$this->document->addScript('catalog/view/javascript/tmfilter/iscroll.js?v'.$data['_v']);
			$this->document->addScript('catalog/view/javascript/tmfilter/tm_filter.js?v'.$data['_v']);

			$this->document->addStyle('catalog/view/theme/default/stylesheet/tmfilter/jquery-ui.min.css?v'.$data['_v']);
			
			if( file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/stylesheet/tmfilter/style.css') ) {
				$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/tmfilter/style.css?v'.$data['_v']);
			} else {
				$this->document->addStyle('catalog/view/theme/default/stylesheet/tmfilter/style.css?v'.$data['_v']);
			}
			
			$this->document->addStyle('catalog/view/theme/default/stylesheet/tmfilter/style-2.css?v'.$data['_v']);
		}

	
		if( file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/tm_filter.tpl') ) {
			return $this->load->view($this->config->get('config_template') . '/template/module/tm_filter.tpl', $data);
		} else {
			return $this->load->view('module/tm_filter.tpl', $data);
		}
	}
	
	public function ajaxinfo() {
		$this->load->model('module/tm_filter');
		
		$idx = 0;
		
		if( isset( $this->request->get['mfilterIdx'] ) )
			$idx = (int) $this->request->get['mfilterIdx'];
		
		$baseTypes = array( 'stock_status', 'manufacturers', 'rating', 'attributes', 'options', 'filters' );
		
		if( isset( $this->request->get['mfilterBTypes'] ) ) {
			$baseTypes = explode( ',', $this->request->get['mfilterBTypes'] );
		}
		
		echo json_encode( TMFilterCore::newInstance( $this, NULL )->getJsonData($baseTypes, $idx) );
	}
	
	public function results() {
		$data = array();
    	$data = $this->language->load('product/search');
			
		$this->load->model('catalog/product');		
		$this->load->model('tool/image');
		
		$keys	= array( 'sort' => 'p.sort_order', 'order' => 'ASC', 'page' => 1, 'limit' => $this->config->get('config_catalog_limit') );
		
		$url = '';

				if( ! empty( $this->request->get['mfp'] ) ) {
					$url .= '&mfp=' . $this->request->get['mfp'];
				}
			
		
		foreach( $keys as $key => $keyDef ) {
			${$key} = isset( $this->request->get[$key] ) ? $this->request->get[$key] : $keyDef;
			
			if( isset( $this->request->get[$key] ) ) {
				$url .= '&' . $key . '=' . $this->request->get[$key];
			}
			
		}
		
		$this->document->setTitle($this->language->get('heading_title'));
		$this->document->addScript('catalog/view/javascript/jquery/jquery.total-storage.min.js');						

		/**
		 * Breadcrumb 
		 */
		$data['breadcrumbs'] = array();
   		$data['breadcrumbs'][] = array( 
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
      		'separator' => false
   		);
		
   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/tm_filter/results', $url),
      		'separator' => $this->language->get('text_separator')
   		);
		
		$data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
		$data['compare'] = $this->url->link('product/compare');
		
		$data['products'] = array();

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'p.sort_order';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		if (isset($this->request->get['limit'])) {
			$limit = $this->request->get['limit'];
		} else {
			$limit = $this->config->get('config_product_limit');
		}
		
		$d = array(
			'sort'                => $sort,
			'order'               => $order,
			'start'               => ($page - 1) * $limit,
			'limit'               => $limit
		);
		
		if( empty( $this->request->get['path'] ) && ! empty( $this->request->get['mfilterPath'] ) ) {
			$this->request->get['path'] = $this->request->get['mfilterPath'];
		}
		
					
		$product_total = $this->model_catalog_product->getTotalProducts($d);								
		$results = $this->model_catalog_product->getProducts($d);
		
		foreach ($results as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
			} else {
				$image = false;
			}
				
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$price = false;
			}
				
			if ((float)$result['special']) {
				$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$special = false;
			}	
				
			if ($this->config->get('config_tax')) {
				$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
			} else {
				$tax = false;
			}				
				
			if ($this->config->get('config_review_status')) {
				$rating = (int)$result['rating'];
			} else {
				$rating = false;
			}
			
			$data['products'][] = array(
				'product_id'  => $result['product_id'],
				'thumb'       => $image,
				'name'        => $result['name'],
				'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..',
				'price'       => $price,
				'special'     => $special,
				'tax'         => $tax,
				'rating'      => $result['rating'],
				'reviews'     => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
				'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'] . $url)
			);
		}
					
		$url = '';

				if( ! empty( $this->request->get['mfp'] ) ) {
					$url .= '&mfp=' . $this->request->get['mfp'];
				}
			
			
		if( ! empty( $this->request->get['mfp'] ) ) {
			$url .= '&mfp=' . $this->request->get['mfp'];
		}
						
		$data['sorts'] = array();
			
		$data['sorts'][] = array(
			'text'  => $this->language->get('text_default'),
			'value' => 'p.sort_order-ASC',
			'href'  => $this->url->link('module/tm_filter/results', 'sort=p.sort_order&order=ASC' . $url)
		);
			
		$data['sorts'][] = array(
			'text'  => $this->language->get('text_name_asc'),
			'value' => 'pd.name-ASC',
			'href'  => $this->url->link('module/tm_filter/results', 'sort=pd.name&order=ASC' . $url)
		); 
	
		$data['sorts'][] = array(
			'text'  => $this->language->get('text_name_desc'),
			'value' => 'pd.name-DESC',
			'href'  => $this->url->link('module/tm_filter/results', 'sort=pd.name&order=DESC' . $url)
		);
	
		$data['sorts'][] = array(
			'text'  => $this->language->get('text_price_asc'),
			'value' => 'p.price-ASC',
			'href'  => $this->url->link('module/tm_filter/results', 'sort=p.price&order=ASC' . $url)
		); 
	
		$data['sorts'][] = array(
			'text'  => $this->language->get('text_price_desc'),
			'value' => 'p.price-DESC',
			'href'  => $this->url->link('module/tm_filter/results', 'sort=p.price&order=DESC' . $url)
		); 
			
		if ($this->config->get('config_review_status')) {
			$data['sorts'][] = array(
				'text'  => $this->language->get('text_rating_desc'),
				'value' => 'rating-DESC',
				'href'  => $this->url->link('module/tm_filter/results', 'sort=rating&order=DESC' . $url)
			); 
				
			$data['sorts'][] = array(
				'text'  => $this->language->get('text_rating_asc'),
				'value' => 'rating-ASC',
				'href'  => $this->url->link('module/tm_filter/results', 'sort=rating&order=ASC' . $url)
			);
		}
			
		$data['sorts'][] = array(
			'text'  => $this->language->get('text_model_asc'),
			'value' => 'p.model-ASC',
			'href'  => $this->url->link('module/tm_filter/results', 'sort=p.model&order=ASC' . $url)
		); 
	
		$data['sorts'][] = array(
			'text'  => $this->language->get('text_model_desc'),
			'value' => 'p.model-DESC',
			'href'  => $this->url->link('module/tm_filter/results', 'sort=p.model&order=DESC' . $url)
		);
	
		$url = '';

				if( ! empty( $this->request->get['mfp'] ) ) {
					$url .= '&mfp=' . $this->request->get['mfp'];
				}
			
			
		if( ! empty( $this->request->get['mfp'] ) ) {
			$url .= '&mfp=' . $this->request->get['mfp'];
		}
						
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}	
	
		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
			
		$data['limits'] = array();
	
		$limits = array_unique(array($this->config->get('config_catalog_limit'), 25, 50, 75, 100));
			
		sort($limits);
	
		foreach($limits as $limits){
			$data['limits'][] = array(
				'text'  => $limits,
				'value' => $limits,
				'href'  => $this->url->link('module/tm_filter/results', $url . '&limit=' . $limits)
			);
		}
					
		$url = '';

				if( ! empty( $this->request->get['mfp'] ) ) {
					$url .= '&mfp=' . $this->request->get['mfp'];
				}
			
										
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}	
	
		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
			
		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}		

		$pagination = new Pagination();
		$pagination->total = $product_total;
		$pagination->page = $page;
		$pagination->limit = $limit;
		$pagination->url = $this->url->link('module/tm_filter/results', $url . '&page={page}');

		$data['pagination'] = $pagination->render();

		$this->document->addLink($this->url->link('module/tm_filter/results', $url . '&page=' . $pagination->page), 'canonical');

		if ($pagination->limit && ceil($pagination->total / $pagination->limit) > $pagination->page) {
			$this->document->addLink($this->url->link('module/tm_filter/results', $url . '&page=' . ($pagination->page + 1)), 'next');
		}

		if ($pagination->page > 1) {
			$this->document->addLink($this->url->link('module/tm_filter/results', $url . '&page=' . ($pagination->page - 1)), 'prev');
		}
		
		$data['results'] = sprintf(
			$this->language->get('text_pagination'), 
			($product_total) ? 
				(($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : 
				((($page - 1) * $limit) + $limit), 
			$product_total, 
			ceil($product_total / $limit)
		);

		$data['sort'] = $sort;
		$data['order'] = $order;
		$data['limit'] = $limit;

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		

		if( file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/special.tpl') ) {

				if( isset( $this->request->get['mfilterAjax'] ) ) {
					$settings	= $this->config->get('tm_filter_settings');
					$baseTypes	= array( 'stock_status', 'manufacturers', 'rating', 'attributes', 'price', 'options', 'filters' );
		
					if( isset( $this->request->get['mfilterBTypes'] ) ) {
						$baseTypes = explode( ',', $this->request->get['mfilterBTypes'] );
					}
					
					if( ! empty( $settings['calculate_number_of_products'] ) || in_array( 'categories:tree', $baseTypes ) ) {
						if( empty( $settings['calculate_number_of_products'] ) ) {
							$baseTypes = array( 'categories:tree' );
						}
				
						$this->load->model( 'module/tm_filter' );

						$idx = 0;
		
						if( isset( $this->request->get['mfilterIdx'] ) )
							$idx = (int) $this->request->get['mfilterIdx'];
						
						$data['mfilter_json'] = json_encode( TMFilterCore::newInstance( $this, NULL )->getJsonData($baseTypes, $idx) );
					}
				
					$data['header'] = $data['column_left'] = $data['column_right'] = $data['content_top'] = $data['content_bottom'] = $data['footer'] = '';
				}
				
				if( ! empty( $data['breadcrumbs'] ) && ! empty( $this->request->get['mfp'] ) ) {
					foreach( $data['breadcrumbs'] as $mfK => $mfBreadcrumb ) {
						$mfReplace = preg_replace( '/path\[[^\]]+\],?/', '', $this->request->get['mfp'] );
						$mfFind = ( mb_strpos( $mfBreadcrumb['href'], '?mfp=', 0, 'utf-8' ) !== false ? '?mfp=' : '&mfp=' );
						
						$data['breadcrumbs'][$mfK]['href'] = str_replace(array(
							$mfFind . $this->request->get['mfp'],
							'&amp;mfp=' . $this->request->get['mfp'],
							$mfFind . urlencode( $this->request->get['mfp'] ),
							'&amp;mfp=' . urlencode( $this->request->get['mfp'] )
						), $mfReplace ? $mfFind . $mfReplace : '', $mfBreadcrumb['href'] );
					}
				}
			
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/product/special.tpl', $data));
		} else {

				if( isset( $this->request->get['mfilterAjax'] ) ) {
					$settings	= $this->config->get('tm_filter_settings');
					$baseTypes	= array( 'stock_status', 'manufacturers', 'rating', 'attributes', 'price', 'options', 'filters' );
		
					if( isset( $this->request->get['mfilterBTypes'] ) ) {
						$baseTypes = explode( ',', $this->request->get['mfilterBTypes'] );
					}
					
					if( ! empty( $settings['calculate_number_of_products'] ) || in_array( 'categories:tree', $baseTypes ) ) {
						if( empty( $settings['calculate_number_of_products'] ) ) {
							$baseTypes = array( 'categories:tree' );
						}
				
						$this->load->model( 'module/tm_filter' );

						$idx = 0;
		
						if( isset( $this->request->get['mfilterIdx'] ) )
							$idx = (int) $this->request->get['mfilterIdx'];
						
						$data['mfilter_json'] = json_encode( TMFilterCore::newInstance( $this, NULL )->getJsonData($baseTypes, $idx) );
					}
				
					$data['header'] = $data['column_left'] = $data['column_right'] = $data['content_top'] = $data['content_bottom'] = $data['footer'] = '';
				}
				
				if( ! empty( $data['breadcrumbs'] ) && ! empty( $this->request->get['mfp'] ) ) {
					foreach( $data['breadcrumbs'] as $mfK => $mfBreadcrumb ) {
						$mfReplace = preg_replace( '/path\[[^\]]+\],?/', '', $this->request->get['mfp'] );
						$mfFind = ( mb_strpos( $mfBreadcrumb['href'], '?mfp=', 0, 'utf-8' ) !== false ? '?mfp=' : '&mfp=' );
						
						$data['breadcrumbs'][$mfK]['href'] = str_replace(array(
							$mfFind . $this->request->get['mfp'],
							'&amp;mfp=' . $this->request->get['mfp'],
							$mfFind . urlencode( $this->request->get['mfp'] ),
							'&amp;mfp=' . urlencode( $this->request->get['mfp'] )
						), $mfReplace ? $mfFind . $mfReplace : '', $mfBreadcrumb['href'] );
					}
				}
			
			$this->response->setOutput($this->load->view('product/special.tpl', $data));
		}
	}
}
?>