<?php

class ControllerModuleTmMegaMenu extends Controller
{
	private $error = array();

	public function index()
	{
		$this->load->language('module/tm_megamenu');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/module');
		$this->load->model('catalog/category');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('tm_megamenu', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_type_custom'] = $this->language->get('text_type_custom');
		$data['text_type_category'] = $this->language->get('text_type_category');
		$data['text_type_megamenu'] = $this->language->get('text_type_megamenu');
		$data['text_type_multilevel'] = $this->language->get('text_type_multilevel');
		$data['text_column'] = $this->language->get('text_column');
		$data['text_type_sub_with_sub'] = $this->language->get('text_type_sub_with_sub');
		$data['text_type_sub_with_prod'] = $this->language->get('text_type_sub_with_prod');
		$data['text_type_subcategories'] = $this->language->get('text_type_subcategories');
		$data['text_type_module'] = $this->language->get('text_type_module');
		$data['text_menu_item'] = $this->language->get('text_menu_item');
		$data['text_add_item'] = $this->language->get('text_add_item');
		$data['text_remove_item'] = $this->language->get('text_remove_item');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_type_products'] = $this->language->get('text_type_products');

		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_menu_item_type'] = $this->language->get('entry_menu_item_type');
		$data['entry_menu_item_submenu_type'] = $this->language->get('entry_menu_item_submenu_type');
		$data['entry_columns'] = $this->language->get('entry_columns');
		$data['entry_columns_per_row'] = $this->language->get('entry_columns_per_row');
		$data['entry_column_width'] = $this->language->get('entry_column_width');
		$data['entry_menu_item_column_content'] = $this->language->get('entry_menu_item_column_content');
		$data['entry_module'] = $this->language->get('entry_module');
		$data['entry_menu_link'] = $this->language->get('entry_menu_link');
		$data['entry_menu_title'] = $this->language->get('entry_menu_title');
		$data['entry_menu_item_submenu_show'] = $this->language->get('entry_menu_item_submenu_show');
		$data['entry_category'] = $this->language->get('entry_category');
		$data['entry_list_limit'] = $this->language->get('entry_list_limit');
		$data['entry_product_limit'] = $this->language->get('entry_product_limit');
		$data['entry_menu_item_category_name_show'] = $this->language->get('entry_menu_item_category_name_show');
		$data['entry_background_image'] = $this->language->get('entry_background_image');
		$data['entry_background_image_width'] = $this->language->get('entry_background_image_width');
		$data['entry_background_image_height'] = $this->language->get('entry_background_image_height');


		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		if (isset($this->error['columns'])) {
			$data['error_columns'] = $this->error['columns'];
		} else {
			$data['error_columns'] = '';
		}

		if (isset($this->error['columns-per-row'])) {
			$data['error_columns_per_row'] = $this->error['columns-per-row'];
		} else {
			$data['error_columns_per_row'] = '';
		}

		if (isset($this->error['image_size'])) {
			$data['error_image_size'] = $this->error['image_size'];
		} else {
			$data['error_image_size'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
			);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], true)
			);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('module/tm_megamenu', 'token=' . $this->session->data['token'], true)
			);

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('module/tm_megamenu', 'token=' . $this->session->data['token'], true);
		} else {
			$data['action'] = $this->url->link('module/tm_megamenu', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true);
		}

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], true);

		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info['status'])) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info['name'])) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}

		$this->load->model('localisation/language');
		$this->load->model('tool/image');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['menu_item'])) {
			$data['menu_item'] = $this->request->post['menu_item'];
		} elseif (!empty($module_info['menu_item'])) {
			$data['menu_item'] = $module_info['menu_item'];
		} else {
			$data['menu_item'] = '';
		}

		if (!empty($module_info) && isset($module_info['menu_item'])) {
			foreach ($module_info['menu_item'] as $menu_item) {
				if (is_file(DIR_IMAGE . $menu_item['image'])) {
					$image_thumb = $this->model_tool_image->resize($menu_item['image'], 100, 100);
				} else {
					$image_thumb = $this->model_tool_image->resize('no_image.png', 100, 100);
				}
				$data['image_thumb'][] = $image_thumb;
			}
		}

		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

		$data['modules'] = $this->model_extension_module->getModules();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $key => $value) {
			if ($categories[$key]['parent_id'] != 0) {
				unset($categories[$key]);
			}
		}
		$data['categories'] = $categories;


		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/tm_megamenu', $data));
	}

	protected function validate()
	{
		if (!$this->user->hasPermission('modify', 'module/tm_megamenu')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		if (isset($this->request->post['menu_item'])) {
			foreach ($this->request->post['menu_item'] as $menu_item) {
				if (isset($menu_item['columns'])) {

					if (!is_numeric($menu_item['columns']) || $menu_item['columns'] < 0 || $menu_item['columns'] > 12) {
						$this->error['columns'] = $this->language->get('error_columns');
					}

					if (!is_numeric($menu_item['columns-per-row']) || $menu_item['columns-per-row'] < 0 || $menu_item['columns-per-row'] > 12) {
						$this->error['columns-per-row'] = $this->language->get('error_columns-per-row');
					}

					if (!empty($menu_item['image']) && (empty($menu_item['image_width']) || empty($menu_item['image_height']) || !is_numeric($menu_item['image_width']) || !is_numeric($menu_item['image_height']))) {
						$this->error['image_size'] = $this->language->get('error_image_size');
					}
				}
			}

		}


		return !$this->error;
	}
}