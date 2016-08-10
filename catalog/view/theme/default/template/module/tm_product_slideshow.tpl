<div id="tm_product_slideshow-<?php echo $module_counter; ?>" class="tm_product_slideshow">
	<?php foreach ($products as $product) { ?>
	<div class="slideshow-product product-thumb transition <?php if ($product['options']) echo 'options';?>">
		<?php if ($product['options']) { ?>
		<!-- Product options -->
		<div class="product-option-wrap">
			<div class="product-options form-horizontal">
				<div class="options">
					<a class="ajax-overlay_close" href='#'></a>
					<h3><?php echo $text_option; ?></h3>
					<div class="form-group hidden">
						<div class="col-sm-8">
							<input type="text" name="product_id" value="<?php echo $product['product_id'] ?>" class="form-control"/>
						</div>
					</div>
					<?php foreach ($product['options'] as $option) { ?>
					<?php if ($option['type'] == 'select') { ?>
					<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
						<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id'] . $module . $b; ?>">
							<?php echo $option['name']; ?>
						</label>
						<div class="col-sm-12">
							<select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id'] . $module . $b; ?>" class="form-control">
								<option value=""><?php echo $text_select; ?></option>
								<?php foreach ($option['product_option_value'] as $option_value) { ?>
								<option value="<?php echo $option_value['product_option_value_id']; ?>">
									<?php echo $option_value['name']; ?>
									<?php if ($option_value['price']) { ?>(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)<?php } ?>
								</option>
								<?php } ?>
							</select>
						</div>
					</div>
					<?php } ?>
					<?php if ($option['type'] == 'radio') { ?>
					<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
						<label class="control-label col-sm-12">
							<?php echo $option['name']; ?>
						</label>
						<div class="col-sm-12">
							<div id="input-option<?php echo $option['product_option_id'] . $module . $b; ?>">
								<?php foreach ($option['product_option_value'] as $option_value) { ?>
								<div class="radio">
									<label for="option[<?php echo $option['product_option_id'] . $option_value['product_option_value_id'] . $module . $b; ?>]">
										<input type="radio" hidden name="option[<?php echo $option['product_option_id']; ?>]" id="option[<?php echo $option['product_option_id'] . $option_value['product_option_value_id'] . $module . $b; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>"/>
										<?php echo $option_value['name']; ?>
										<?php if ($option_value['price']) { ?>(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)<?php } ?>
									</label>
								</div>
								<?php } ?>
							</div>
						</div>
					</div>
					<?php } ?>
					<?php if ($option['type'] == 'checkbox') { ?>
					<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
						<label class="control-label col-sm-12">
							<?php echo $option['name']; ?>
						</label>
						<div class="col-sm-12">
							<div id="input-option<?php echo $option['product_option_id'] . $module . $b; ?>">
								<?php foreach ($option['product_option_value'] as $option_value) { ?>
								<div class="checkbox">
									<label>
										<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>"/>
										<?php echo $option_value['name']; ?>
										<?php if ($option_value['price']) { ?>(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)<?php } ?>
									</label>
								</div>
								<?php } ?>
							</div>
						</div>
					</div>
					<?php } ?>
					<?php if ($option['type'] == 'image') { ?>
					<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
						<label class="control-label col-sm-12">
							<?php echo $option['name']; ?>
						</label>
						<div class="col-sm-12">
							<div id="input-option<?php echo $option['product_option_id'] . $module . $b; ?>">
								<?php foreach ($option['product_option_value'] as $option_value) { ?>
								<div class="radio">
									<label>
										<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>"/>
										<img width="50" height="50" src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail"/> <?php echo $option_value['name']; ?>
										<?php if ($option_value['price']) { ?>(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)<?php } ?>
									</label>
								</div>
								<?php } ?>
							</div>
						</div>
					</div>
					<?php } ?>
					<?php if ($option['type'] == 'text') { ?>
					<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
						<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id'] . $module . $b; ?>">
							<?php echo $option['name']; ?>
						</label>
						<div class="col-sm-12">
							<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id'] . $module . $b; ?>" class="form-control"/>
						</div>
					</div>
					<?php } ?>
					<?php if ($option['type'] == 'textarea') { ?>
					<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
						<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id'] . $module . $b; ?>">
							<?php echo $option['name']; ?>
						</label>
						<div class="col-sm-12">
							<textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id'] . $module . $b; ?>" class="form-control"><?php echo $option['value']; ?>
							</textarea>
						</div>
					</div>
					<?php } ?>
					<?php if ($option['type'] == 'file') { ?>
					<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
						<label class="control-label col-sm-12">
							<?php echo $option['name']; ?>
						</label>
						<div class="col-sm-12">
							<button type="button" id="button-upload<?php echo $option['product_option_id'] . $module . $b; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-block btn-default">
								<i class="fa fa-upload"></i>
								<?php echo $button_upload; ?>
							</button>
							<input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id'] . $module . $b; ?>"/>
						</div>
					</div>
					<?php } ?>
					<?php if ($option['type'] == 'date') { ?>
					<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
						<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id'] . $module . $b; ?>">
							<?php echo $option['name']; ?>
						</label>
						<div class="col-sm-12">
							<div class="input-group date">
								<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id'] . $module . $b; ?>" class="form-control"/>
								<span class="input-group-btn">
									<button class="btn btn-default" type="button">
										<i class="fa fa-calendar"></i>
									</button>
								</span>
							</div>
						</div>
					</div>
					<?php } ?>
					<?php if ($option['type'] == 'datetime') { ?>
					<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
						<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id'] . $module . $b; ?>"><?php echo $option['name']; ?></label>
						<div class="col-sm-12">
							<div class="input-group datetime">
								<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id'] . $module . $b; ?>" class="form-control"/>
								<span class="input-group-btn">
									<button type="button" class="btn btn-default">
										<i class="fa fa-calendar"></i>
									</button>
								</span>
							</div>
						</div>
					</div>
					<?php } ?>
					<?php if ($option['type'] == 'time') { ?>
					<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
						<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id'] . $module . $b; ?>">
							<?php echo $option['name']; ?>
						</label>
						<div class="col-sm-12">
							<div class="input-group time">
								<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id'] . $module . $b; ?>" class="form-control"/>
								<span class="input-group-btn">
									<button type="button" class="btn btn-default">
										<i class="fa fa-calendar"></i>
									</button>
								</span>
							</div>
						</div>
					</div>
					<?php } ?>
					<?php } ?>
					<button class="product-btn-add" type="button" onclick="cart.addPopup($(this),'<?php echo $product['product_id']; ?>');">
						<span><?php echo $button_cart; ?></span>
					</button>
				</div>
			</div>
		</div>
		<?php } ?>
		<?php if ($product['special']) { ?>
		<?php if ($label_sale) { ?>
		<div class="sale">
			<span><?php echo $text_sale; ?></span>
		</div>
		<?php } ?>
		<?php if ($label_discount) { ?>
		<div class="discount">
			<span><?php echo $product['label_discount']; ?></span>
		</div>
		<?php } ?>
		<?php } ?>
		<?php if ($product['label_new']) { ?>
		<div class="new-pr"><span><?php echo $text_new; ?></span></div>
		<?php } ?>
		<div class="image" style="width: <?php echo $product['img-width']; ?>px">
			<a class="lazy" style="padding-bottom: <?php echo($product['img-height'] / $product['img-width'] * 100); ?>%" href="<?php echo $product['href']; ?>">
				<img width="<?php echo $product['img-width']; ?>" height="<?php echo $product['img-height']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" data-src="<?php echo $product['thumb']; ?>" src="#"/>
			</a>
		</div>
		<div class="caption">
			<div class="name">
				<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
			</div>
			<div class="description"><?php echo $product['description']; ?></div>
			<?php if ($product['rating']) { ?>
			<div class="rating">
				<?php for ($i = 1; $i <= 5; $i++) { ?>
				<?php if ($product['rating'] < $i) { ?>
				<span class="fa-stack">
					<i class="material-design-bookmark45 fa-stack-1x"></i>
				</span>
				<?php } else { ?>
				<span class="fa-stack">
					<i class="material-design-bookmark45 fa-stack-1x"></i>
					<i class="material-design-bookmark45 star fa-stack-1x"></i>
				</span>
				<?php } ?>
				<?php } ?>
			</div>
			<?php } ?>
			<?php if ($product['price']) { ?>
			<div class="price">
				<?php if (!$product['special']) { ?>
				<?php echo $product['price']; ?>
				<?php } else { ?>
				<span class="price-new"><?php echo $product['special']; ?></span> 
				<span class="price-old"><?php echo $product['price']; ?></span>
				<?php } ?>
				<?php if ($product['tax']) { ?>
				<span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
				<?php } ?>
			</div>
			<?php } ?>
		</div>
		<div class="cart-button">
			<button class="product-btn-add" type="button" <?php if (count($product['options']) > 3) { ?> onclick="cart.add('<?php echo $product['product_id']; ?>');" <?php } else { ?> onclick="ajaxAdd($(this),<?php echo $product['product_id'] ?>);" <?php } ?>>
				<i class="material-design-shopping231"></i>
				<span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span>
			</button>
			<button class="product-btn" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
				<i class="fa fa-heart"></i>
			</button>
			<button class="product-btn" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');">
				<i class="fa fa-exchange"></i>
			</button>
		</div>
	</div>
	<?php } ?>
</div>

<script>
	;
	(function ($) {
		var o = $('#tm_product_slideshow-<?php echo $module_counter; ?>');
		$(document).ready(function () {
			o.owlCarousel({
				items : 1,
				singleItem: true,
				slideSpeed: 800,
				autoPlay : true,
				stopOnHover : true,

				pagination: false,
				navigation : true,
				navigationText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
			});
		});
	})(jQuery);
</script>
