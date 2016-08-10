<?php echo $header; ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/theme651/stylesheet/facebox.css" />
		<script src="catalog/view/javascript/facebox.js?12345" type="text/javascript"></script>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php //echo $column_left; ?>
    <?php /*if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else {*/ ?>
    <?php $class = 'col-sm-12'; ?>
    <?php //} ?>
    <div id="content" class="<?php echo $class; ?> product_page"><?php echo $content_top; ?>
      <div class="row product-content-columns">
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-5'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-5'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?> col-lg-7 product_page-left">
        <?
        if($product_id==53)
        $meal_type=1;
        else if($product_id==54)
        $meal_type=2;
        else
        $meal_type=3;
        ?>
        <input type="hidden" id="mealType" value="<?=$meal_type?>" />
        <div class="input-group date">
        	<input type="text" class="form-control" id="input-option42" data-date-format="YYYY-MM-DD" value="" name="option[42]">
			<span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span>
		</div>
        
         
               
          <div class="<?php //echo $content_left; ?> product_page-left">
                    <!-- product image -->
                    <div id="default_gallery" class="product-gallery">
                        <?php if ($thumb || $images) { ?>
                            <?php if ($images || $thumb) { ?>
                                <div class="image-thumb">
                                    <ul id="image-additional" class="image-additional">

                                        <?php if (!empty($thumb)) { ?>
                                            <li>
                                                <a href="#" data-image="<?php echo $thumb; ?>">
                                                    <img src="<?php echo $thumb; ?>" alt=""/>
                                                </a>
                                            </li>
                                        <?php } ?>
                                        <?php foreach ($images as $image) { ?>
                                            <li>
                                                <a href="#" data-image="<?php echo $image['popup']; ?>">
                                                    <img src="<?php echo $image['thumb']; ?>" alt=""/></a>
                                            </li>
                                        <?php } ?>

                                    </ul>
                                </div>
                            <?php } ?>
                            <?php if ($thumb) { ?>
                                <div id="product-image" class="product-image">

                                    <div class="magnificent-wrap">
                                        <div class="magnificent" data-magnificent="product-image">
                                            <div class="polaroid">
                                                <div class="inner">
                                                    <img src="<?php echo $popup; ?>" alt="<?php echo $heading_title; ?>"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="magnificent-viewport-wrap">
                                        <div data-magnificent-viewport="product-image">
                                            <div class="inner">
                                                <img src="<?php echo $popup; ?>" alt="<?php echo $heading_title; ?>"/>
                                            </div>
                                        </div>
                                    </div>

                                    <script class="source">
                                        $(function () {
                                            $('#product-image [data-magnificent]').magnificent();
                                        });
                                    </script>
                                </div>
                            <?php } ?>
                        <?php } ?>
                    </div>



                    <?php $i = 0;
                    if ($thumb || $images) {
                        $i++ ?>
                        <script type="text/javascript">
                            jQuery(document).ready(function () {
                                var myPhotoSwipe = $("#gallery a").photoSwipe({
                                    enableMouseWheel: false,
                                    enableKeyboard: false,
                                    captionAndToolbarAutoHideDelay: 0
                                });
                            });
                        </script>
                        <div id="full_gallery">
                            <ul id="gallery">
                                <?php if (!empty($thumb)) { ?>
                                    <li>
                                    <a href="<?php echo $popup; ?>" data-something="something"
                                       data-another-thing="anotherthing"><img src="<?php echo $popup; ?>"
                                                                              title="<?php echo $heading_title; ?>"
                                                                              alt="<?php echo $heading_title; ?>"/></a>
                                    </li><?php } ?>
                                <?php foreach ($images as $image) { ?>
                                    <li>
                                        <a href="<?php echo $image['popup']; ?>"
                                           data-something="something<?php echo $i ?>"
                                           data-another-thing="anotherthing<?php echo $i ?>"><img
                                                src="<?php echo $image['popup']; ?>"
                                                alt="<?php echo $heading_title; ?>"/></a>
                                    </li>
                                <?php } ?>
                            </ul>
                        </div>
                    <?php } ?>
                </div>
		
		
		
		
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>
            <?php if ($attribute_groups) { ?>
            <li><a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
            <?php } ?>
            <?php if ($review_status) { ?>
            <li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
            <?php } ?>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-description"><?php echo $description; ?></div>
            <?php if ($attribute_groups) { ?>
            <div class="tab-pane" id="tab-specification">
              <table class="table table-bordered">
                <?php foreach ($attribute_groups as $attribute_group) { ?>
                <thead>
                  <tr>
                    <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                  <tr>
                    <td><?php echo $attribute['name']; ?></td>
                    <td><?php echo $attribute['text']; ?></td>
                  </tr>
                  <?php } ?>
                </tbody>
                <?php } ?>
              </table>
            </div>
            <?php } ?>
            <?php if ($review_status) { ?>
            <div class="tab-pane" id="tab-review">
              <form class="form-horizontal" id="form-review">
                <div id="review"></div>
                <h2><?php echo $text_write; ?></h2>
                <?php if ($review_guest) { ?>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                    <input type="text" name="name" value="" id="input-name" class="form-control" />
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                    <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                    <div class="help-block"><?php echo $text_note; ?></div>
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label"><?php echo $entry_rating; ?></label>
                    &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                    <input type="radio" name="rating" value="1" />
                    &nbsp;
                    <input type="radio" name="rating" value="2" />
                    &nbsp;
                    <input type="radio" name="rating" value="3" />
                    &nbsp;
                    <input type="radio" name="rating" value="4" />
                    &nbsp;
                    <input type="radio" name="rating" value="5" />
                    &nbsp;<?php echo $entry_good; ?></div>
                </div>
                <?php if (isset($site_key)) { ?>
                  <div class="form-group">
                    <div class="col-sm-12">
                      <div class="g-recaptcha" data-sitekey="<?php echo $site_key; ?>"></div>
                    </div>
                  </div>
                <?php } ?>
                <div class="buttons clearfix">
                  <div class="pull-right">
                    <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
                  </div>
                </div>
                <?php } else { ?>
                <?php echo $text_login; ?>
                <?php } ?>
              </form>
            </div>
            <?php } ?>
          </div>
        </div>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-7'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-7'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?> col-lg-5 product_page-right">
          <div class="btn-group">
            <button type="button" data-toggle="tooltip" class="btn btn-default" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');"><i class="fa fa-heart"></i></button>
            <button type="button" data-toggle="tooltip" class="btn btn-default" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product_id; ?>');"><i class="fa fa-exchange"></i></button>
          </div>
          <h1><?php echo $heading_title; ?></h1>
          <ul class="list-unstyled">
            <?php if ($manufacturer) { ?>
            <li><?php echo $text_manufacturer; ?> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></li>
            <?php } ?>
            <li><?php echo $text_model; ?> <?php echo $model; ?></li>
            <?php if ($reward) { ?>
            <li><?php echo $text_reward; ?> <?php echo $reward; ?></li>
            <?php } ?>
            <li><?php echo $text_stock; ?> <?php echo $stock; ?></li>
          </ul>
          <?php if ($price) { ?>
          <ul class="list-unstyled">
            <?php if (!$special) { ?>
            <li>
              <h2><?php echo $price; ?></h2>
            </li>
            <?php } else { ?>
            <li><span style="text-decoration: line-through;"><?php echo $price; ?></span></li>
            <li>
              <h2><?php echo $special; ?></h2>
            </li>
            <?php } ?>
            <?php if ($tax) { ?>
            <li><?php echo $text_tax; ?> <?php echo $tax; ?></li>
            <?php } ?>
            <?php if ($points) { ?>
            <li><?php echo $text_points; ?> <?php echo $points; ?></li>
            <?php } ?>
            <?php if ($discounts) { ?>
            <li>
              <hr>
            </li>
            <?php foreach ($discounts as $discount) { ?>
            <li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></li>
            <?php } ?>
            <?php } ?>
          </ul>
          <?php } ?>
          
          <?php if ($review_status) { ?>
          <div class="rating">
            <p>
              <?php for ($i = 1; $i <= 5; $i++) { ?>
              <?php if ($rating < $i) { ?>
              <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
              <?php } else { ?>
              <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
              <?php } ?>
              <?php } ?>
              <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $reviews; ?></a> / <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $text_write; ?></a></p>
            <hr>
            <!-- AddThis Button BEGIN -->
            <div class="addthis_toolbox addthis_default_style"><a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a class="addthis_counter addthis_pill_style"></a></div>
            <!--<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>-->
            <!-- AddThis Button END -->
          </div>
          <?php } ?>
        </div>
      </div>
      <?php if ($products) { ?>
      <h3><?php echo $text_related; ?></h3>
      <div class="row">
        <?php $i = 0; ?>
        <?php foreach ($products as $product) { ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-lg-6 col-md-6 col-sm-12 col-xs-12'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-lg-4 col-md-4 col-sm-6 col-xs-12'; ?>
        <?php } else { ?>
        <?php $class = 'col-lg-3 col-md-3 col-sm-6 col-xs-12'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?>">
          <div class="product-thumb transition">
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
            <div class="caption">
              <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
              <p><?php echo $product['description']; ?></p>
              <?php if ($product['rating']) { ?>
              <div class="rating">
                <?php for ($i = 1; $i <= 5; $i++) { ?>
                <?php if ($product['rating'] < $i) { ?>
                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                <?php } else { ?>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
                <?php } ?>
                <?php } ?>
              </div>
              <?php } ?>
              <?php if ($product['price']) { ?>
              <p class="price">
                <?php if (!$product['special']) { ?>
                <?php echo $product['price']; ?>
                <?php } else { ?>
                <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                <?php } ?>
                <?php if ($product['tax']) { ?>
                <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                <?php } ?>
              </p>
              <?php } ?>
            </div>
            <div class="button-group">
              <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span> <i class="fa fa-shopping-cart"></i></button>
              <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
              <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
            </div>
          </div>
        </div>
        <?php if (($column_left && $column_right) && ($i % 2 == 0)) { ?>
        <div class="clearfix visible-md visible-sm"></div>
        <?php } elseif (($column_left || $column_right) && ($i % 3 == 0)) { ?>
        <div class="clearfix visible-md"></div>
        <?php } elseif ($i % 4 == 0) { ?>
        <div class="clearfix visible-md"></div>
        <?php } ?>
        <?php $i++; ?>
        <?php } ?>
      </div>
      <?php } ?>
      <?php if ($tags) { ?>
      <p><?php echo $text_tags; ?>
        <?php for ($i = 0; $i < count($tags); $i++) { ?>
        <?php if ($i < (count($tags) - 1)) { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
        <?php } else { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
        <?php } ?>
        <?php } ?>
      </p>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php 
	/*$date = date('Y-m-d', strtotime(date('Y-m-d').' +1 Weekday'));
	$dateArr = array();
	for($i=1;$i<=7;$i++){
		$dateArr[] = date('Y-m-d', strtotime(date('Y-m-d')." +1 Weekday"));	
	}*/
	?>
<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});  
//--></script>
<script type="text/javascript"><!--
$(document).on('click','.7days-addCart',function(){
	var product = $(this).attr('id').substr(8);
	//console.log(divId);
	var divId = 'div-'+product;
	console.log(divId);
	
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#'+divId+' input[type=\'text\'], #'+divId+' input[type=\'hidden\'], #'+divId+' input[type=\'radio\']:checked, #'+divId+' input[type=\'checkbox\']:checked, #'+divId+' select, #'+divId+' textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-cart1').button('loading');
		},
		complete: function() {
			$('#button-cart1').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');
//alert(json);
			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));

						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}

				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
				if (json['error']['text']) {
					$('.breadcrumb').after('<div class="alert alert-danger">' + json['error']['text'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}
			}

			if (json['success']) {
				
				$('#content').parent().before('<div class="alert alert-success"><i class="material-design-verification24"></i> ' + json['success'] + '<button type="button" class="close material-design-close47"></button></div>');

				$('#cart-total').html(json['total']);
				$('#cart-total2').html(json['total2']);

				$('#cart > ul').load('index.php?route=common/cart/info ul li');
				timer = setTimeout(function () {
					$('.alert').addClass('fadeOut');
				}, 4000)
				
				/*$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				$('#cart > button').html('<i class="fa fa-shopping-cart"></i> ' + json['total']);

				$('html, body').animate({ scrollTop: 0 }, 'slow');

				$('#cart > ul').load('index.php?route=common/cart/info ul li');*/
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--



$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').attr('value', json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
  e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#form-review").serialize(),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
			}
		}
	});
});





$(document).ready(function() {
	$('.thumbnails').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery: {
			enabled:true
		}
	});

    $('a[rel*=facebox]').facebox({
        loadingImage : 'catalog/view/theme/theme651/image/camera-loader.gif',
        closeImage   : 'catalog/view/theme/theme651/image/closelabel.png'
      })
	
});
//--></script>
<?php //echo $theme_path; ?>
<?php echo $footer; ?>