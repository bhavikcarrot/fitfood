<script>
	$(document).ready(function ($) {
		$('.module_tab__<?php echo $module?> #module-tabs-<?php echo $module?> a:first').tab('show');
		$('.module_tab__<?php echo $module?>').tabCollapse();
	});
</script>
<div role="tabpanel" class="module_tab module_tab__<?php echo $module?>">

	<!-- Nav tabs -->
	<ul class="nav nav-tabs" role="tablist" id="module-tabs-<?php echo $module?>">
		<?php if ($featured_products) { ?>
		<li>
			<a href="#tab-featured-<?php echo $module; ?>" role="tab" data-toggle="tab">
				<?php echo $heading_featured; ?>
			</a>
		</li>
		<?php } ?>
		<?php if ($latest_products) { ?>
		<li>
			<a href="#tab-latest-<?php echo $module; ?>" role="tab" data-toggle="tab">
				<?php echo $heading_latest; ?>
			</a>
		</li>
		<?php } ?>
		<?php if ($special_products) { ?>
		<li>
			<a href="#tab-specials-<?php echo $module; ?>" role="tab" data-toggle="tab">
				<?php echo $heading_specials; ?>
			</a>
		</li>
		<?php } ?>
		<?php if ($bestseller_products) { ?>
		<li>
			<a href="#tab-bestsellers-<?php echo $module; ?>" role="tab" data-toggle="tab">
				<?php echo $heading_bestsellers; ?>
			</a>
		</li>
		<?php } ?>
	</ul>

	<!-- Tab panes -->
	<div class="tab-content">
		<?php if ($featured_products) { ?>
		<div role="tabpanel" class="tab-pane" id="tab-featured-<?php echo $module; ?>">
			<div class="box-carousel">
				<?php $tf = 11000; foreach ($featured_products as $product) { $tf++ ?>
				<div class="product-thumb transition <?php if ($product['options']) echo 'options';?>">
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
									<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id'] . $module . $tf; ?>">
										<?php echo $option['name']; ?>
									</label>
									<div class="col-sm-12">
										<select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id'] .  $module . $tf; ?>" class="form-control">
											<option value=""><?php echo $text_select; ?></option>
											<?php foreach ($option['product_option_value'] as $option_value) { ?>
											<option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
												<?php if ($option_value['price']) { ?>
												(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
												<?php } ?>
											</option>
											<?php } ?>
										</select>
									</div>
								</div>
								<?php } ?>
								<?php if ($option['type'] == 'radio') { ?>
								<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
									<label class="control-label col-sm-12"><?php echo $option['name']; ?></label>
									<div class="col-sm-12">
										<div id="input-option<?php echo $option['product_option_id'] .  $module . $tf; ?>">
											<?php foreach ($option['product_option_value'] as $option_value) { ?>
											<div class="radio">
												<label for="option[<?php echo $option['product_option_id'] . $option_value['product_option_value_id'] .  $module . $tf; ?>]">
													<input type="radio" hidden name="option[<?php echo $option['product_option_id']; ?>]" id="option[<?php echo $option['product_option_id'] . $option_value['product_option_value_id'] .  $module . $tf; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>"/>
													<?php echo $option_value['name']; ?>
													<?php if ($option_value['price']) { ?>
													(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
													<?php } ?>
												</label>
											</div>
											<?php } ?>
										</div>
									</div>
								</div>
								<?php } ?>
								<?php if ($option['type'] == 'checkbox') { ?>
								<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
									<label class="control-label col-sm-12"><?php echo $option['name']; ?></label>
									<div class="col-sm-12">
										<div id="input-option<?php echo $option['product_option_id'] .  $module . $tf; ?>">
											<?php foreach ($option['product_option_value'] as $option_value) { ?>
											<div class="checkbox">
												<label>
													<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>"/>
													<?php echo $option_value['name']; ?>
													<?php if ($option_value['price']) { ?>
													(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
													<?php } ?>
												</label>
											</div>
											<?php } ?>
										</div>
									</div>
								</div>
								<?php } ?>
								<?php if ($option['type'] == 'image') { ?>
								<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
									<label class="control-label col-sm-12"><?php echo $option['name']; ?></label>
									<div class="col-sm-12">
										<div id="input-option<?php echo $option['product_option_id'] .  $module . $tf; ?>">
											<?php foreach ($option['product_option_value'] as $option_value) { ?>
											<div class="radio">
												<label>
													<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>"/>
													<img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail"/> <?php echo $option_value['name']; ?>
													<?php if ($option_value['price']) { ?>
													(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
													<?php } ?>
												</label>
											</div>
											<?php } ?>
										</div>
									</div>
								</div>
								<?php } ?>
								<?php if ($option['type'] == 'text') { ?>
								<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
									<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id'] .  $module . $tf; ?>"><?php echo $option['name']; ?></label>
									<div class="col-sm-12">
										<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id'] .  $module . $tf; ?>" class="form-control"/>
									</div>
								</div>
								<?php } ?>
								<?php if ($option['type'] == 'textarea') { ?>
								<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
									<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id'] .  $module . $tf; ?>"><?php echo $option['name']; ?></label>
									<div class="col-sm-12">
										<textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id'] .  $module . $tf; ?>" class="form-control"><?php echo $option['value']; ?>
										</textarea>
									</div>
								</div>
								<?php } ?>
								<?php if ($option['type'] == 'file') { ?>
								<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
									<label class="control-label col-sm-12"><?php echo $option['name']; ?></label>
									<div class="col-sm-12">
										<button type="button" id="button-upload<?php echo $option['product_option_id'] .  $module . $tf; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-block btn-default">
											<i class="fa fa-upload"></i> 
											<?php echo $button_upload; ?>
										</button>
										<input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id'] .  $module . $tf; ?>"/>
									</div>
								</div>
								<?php } ?>
								<?php if ($option['type'] == 'date') { ?>
								<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
									<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id'] .  $module . $tf; ?>"><?php echo $option['name']; ?></label>
									<div class="col-sm-12">
										<div class="input-group date">
											<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id'] .  $module . $tf; ?>" class="form-control"/>
											<span class="input-group-btn">
												<button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
											</span>
										</div>
									</div>
								</div>
								<?php } ?>
								<?php if ($option['type'] == 'datetime') { ?>
								<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
									<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id'] .  $module . $tf; ?>"><?php echo $option['name']; ?></label>
									<div class="col-sm-12">
										<div class="input-group datetime">
											<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id'] .  $module . $tf; ?>" class="form-control"/>
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
									<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id'] .  $module . $tf; ?>"><?php echo $option['name']; ?></label>
									<div class="col-sm-12">
										<div class="input-group time">
											<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id'] .  $module . $tf; ?>" class="form-control"/>
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
					<div class="quick_info">
						<div id="quickview_featured_<?php echo $tf . $module ?>" class="quickview-style">
							<div>
								<div class="left col-sm-4">
									<div class="quickview_image image">
										<a href="<?php echo $product['href']; ?>"><img alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" src="<?php echo $product['thumb']; ?>"/></a>
									</div>
								</div>
								<div class="right col-sm-8">
									<h2><?php echo $product['name']; ?></h2>
									<div class="inf">
										<?php if ($product['author']) { ?>
										<p class="quickview_manufacture manufacture manufacture"><?php echo $text_manufacturer; ?>
											<a href="<?php echo $product['manufacturers']; ?>"><?php echo $product['author']; ?></a>
										</p>
										<?php } ?>
										<?php if ($product['model']) { ?>
										<p class="product_model model"><?php echo $text_model; ?> <?php echo $product['model']; ?></p>
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
									<?php if ($product['rating']) { ?>
									<div class="rating">
										<?php for ($i = 1; $i <= 5; $i++) { ?>
										<?php if ($product['rating'] < $i) { ?>
										<span class="fa-stack"><i class="material-design-bookmark45 fa-stack-1x"></i></span>
										<?php } else { ?>
										<span class="fa-stack">
											<i class="material-design-bookmark45 fa-stack-1x"></i>
											<i class="material-design-bookmark45 star  fa-stack-1x"></i>
										</span>
										<?php } ?>
										<?php } ?>
									</div>
									<?php } ?>
									<button class="product-btn-add" data-toggle="tooltip" title="<?php echo $button_cart; ?>" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"> <i class="fl-line-icon-set-grocery10"></i> <span><?php echo $button_cart; ?></span> </button>
									<ul class="product-buttons">
										<li>
											<button class="btn btn-icon" type="button" data-toggle="tooltip"title="<?php echo $button_wishlist; ?>"onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
												<i class="fa fa-heart"></i>
												<span><?php echo $button_wishlist; ?></span>
											</button>
										</li>
										<li>
											<button class="btn btn-icon" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i>
												<span><?php echo $button_compare; ?></span>
											</button>
										</li>
									</ul>
									<div class="clear"></div>
								</div>
								<div class="col-sm-12">
									<div class="quickview_description description">
										<?php echo $product['description1']; ?>
									</div>
								</div>
							</div>
						</div>
					</div>
					<?php if ($product['special']) { ?>
					<div class="sale"><span><?php echo $text_sale; ?></span></div>
					<?php } ?>
					<div class="image">
						<a class="lazy" style="padding-bottom: <?php echo($product['img-height'] / $product['img-width'] * 100); ?>%" href="<?php echo $product['href']; ?>">
							<img alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" data-src="<?php echo $product['thumb']; ?>" src="#"/>
						</a>
						<a class="quickview" data-rel="details" href="#quickview_featured_<?php echo $tf .  $module ?>">
							<?php echo $text_quick; ?>
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
							<span class="fa-stack"><i class="material-design-bookmark45 fa-stack-1x"></i></span>
							<?php } else { ?>
							<span class="fa-stack">
								<i class="material-design-bookmark45 fa-stack-1x"></i>
								<i class="material-design-bookmark45 star  fa-stack-1x"></i>
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
						<button class="product-btn-add" type="button" onclick="ajaxAdd($(this),<?php echo $product['product_id'] ?>);">
							<i class="fl-line-icon-set-grocery10"></i>
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
		</div>
		<?php } ?>
		<?php if ($latest_products) { ?>
		<div role="tabpanel" class="tab-pane" id="tab-latest-<?php echo $module; ?>">
			<div class="box-carousel">
				<?php $tl = 12000; foreach ($latest_products as $product) { $tl++ ?>
				<div class="product-thumb transition <?php if ($product['options']) echo 'options';?>">
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
									<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id'] . $module . $tl; ?>">
										<?php echo $option['name']; ?>
									</label>
									<div class="col-sm-12">
										<select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id'] .  $module . $tl; ?>" class="form-control">
											<option value=""><?php echo $text_select; ?></option>
											<?php foreach ($option['product_option_value'] as $option_value) { ?>
											<option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
												<?php if ($option_value['price']) { ?>
												(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
												<?php } ?>
											</option>
											<?php } ?>
										</select>
									</div>
								</div>
								<?php } ?>
								<?php if ($option['type'] == 'radio') { ?>
								<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
									<label class="control-label col-sm-12"><?php echo $option['name']; ?></label>
									<div class="col-sm-12">
										<div id="input-option<?php echo $option['product_option_id'] .  $module . $tl; ?>">
											<?php foreach ($option['product_option_value'] as $option_value) { ?>
											<div class="radio">
												<label for="option[<?php echo $option['product_option_id'] . $option_value['product_option_value_id'] .  $module . $tl; ?>]">
													<input type="radio" hidden name="option[<?php echo $option['product_option_id']; ?>]" id="option[<?php echo $option['product_option_id'] . $option_value['product_option_value_id'] .  $module . $tl; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>"/>
													<?php echo $option_value['name']; ?>
													<?php if ($option_value['price']) { ?>
													(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
													<?php } ?>
												</label>
											</div>
											<?php } ?>
										</div>
									</div>
								</div>
								<?php } ?>
								<?php if ($option['type'] == 'checkbox') { ?>
								<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
									<label class="control-label col-sm-12"><?php echo $option['name']; ?></label>
									<div class="col-sm-12">
										<div id="input-option<?php echo $option['product_option_id'] .  $module . $tl; ?>">
											<?php foreach ($option['product_option_value'] as $option_value) { ?>
											<div class="checkbox">
												<label>
													<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>"/>
													<?php echo $option_value['name']; ?>
													<?php if ($option_value['price']) { ?>
													(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
													<?php } ?>
												</label>
											</div>
											<?php } ?>
										</div>
									</div>
								</div>
								<?php } ?>
								<?php if ($option['type'] == 'image') { ?>
								<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
									<label class="control-label col-sm-12"><?php echo $option['name']; ?></label>
									<div class="col-sm-12">
										<div id="input-option<?php echo $option['product_option_id'] .  $module . $tl; ?>">
											<?php foreach ($option['product_option_value'] as $option_value) { ?>
											<div class="radio">
												<label>
													<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>"/>
													<img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail"/> <?php echo $option_value['name']; ?>
													<?php if ($option_value['price']) { ?>
													(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
													<?php } ?>
												</label>
											</div>
											<?php } ?>
										</div>
									</div>
								</div>
								<?php } ?>
								<?php if ($option['type'] == 'text') { ?>
								<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
									<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id'] .  $module . $tl; ?>"><?php echo $option['name']; ?></label>
									<div class="col-sm-12">
										<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id'] .  $module . $tl; ?>" class="form-control"/>
									</div>
								</div>
								<?php } ?>
								<?php if ($option['type'] == 'textarea') { ?>
								<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
									<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id'] .  $module . $tl; ?>"><?php echo $option['name']; ?></label>
									<div class="col-sm-12">
										<textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id'] .  $module . $tl; ?>" class="form-control"><?php echo $option['value']; ?>
										</textarea>
									</div>
								</div>
								<?php } ?>
								<?php if ($option['type'] == 'file') { ?>
								<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
									<label class="control-label col-sm-12"><?php echo $option['name']; ?></label>
									<div class="col-sm-12">
										<button type="button" id="button-upload<?php echo $option['product_option_id'] .  $module . $tl; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-block btn-default">
											<i class="fa fa-upload"></i> 
											<?php echo $button_upload; ?>
										</button>
										<input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id'] .  $module . $tl; ?>"/>
									</div>
								</div>
								<?php } ?>
								<?php if ($option['type'] == 'date') { ?>
								<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
									<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id'] .  $module . $tl; ?>"><?php echo $option['name']; ?></label>
									<div class="col-sm-12">
										<div class="input-group date">
											<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id'] .  $module . $tl; ?>" class="form-control"/>
											<span class="input-group-btn">
												<button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
											</span>
										</div>
									</div>
								</div>
								<?php } ?>
								<?php if ($option['type'] == 'datetime') { ?>
								<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
									<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id'] .  $module . $tl; ?>"><?php echo $option['name']; ?></label>
									<div class="col-sm-12">
										<div class="input-group datetime">
											<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id'] .  $module . $tl; ?>" class="form-control"/>
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
									<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id'] .  $module . $tl; ?>"><?php echo $option['name']; ?></label>
									<div class="col-sm-12">
										<div class="input-group time">
											<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id'] .  $module . $tl; ?>" class="form-control"/>
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
					<div class="quick_info">
						<div id="quickview_latest_<?php echo $tl . $module ?>" class="quickview-style">
							<div>
								<div class="left col-sm-4">
									<div class="quickview_image image">
										<a href="<?php echo $product['href']; ?>"><img alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" src="<?php echo $product['thumb']; ?>"/></a>
									</div>
								</div>
								<div class="right col-sm-8">
									<h2><?php echo $product['name']; ?></h2>
									<div class="inf">
										<?php if ($product['author']) { ?>
										<p class="quickview_manufacture manufacture manufacture"><?php echo $text_manufacturer; ?>
											<a href="<?php echo $product['manufacturers']; ?>"><?php echo $product['author']; ?></a>
										</p>
										<?php } ?>
										<?php if ($product['model']) { ?>
										<p class="product_model model"><?php echo $text_model; ?> <?php echo $product['model']; ?></p>
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
									<?php if ($product['rating']) { ?>
									<div class="rating">
										<?php for ($i = 1; $i <= 5; $i++) { ?>
										<?php if ($product['rating'] < $i) { ?>
										<span class="fa-stack"><i class="material-design-bookmark45 fa-stack-1x"></i></span>
										<?php } else { ?>
										<span class="fa-stack">
											<i class="material-design-bookmark45 fa-stack-1x"></i>
											<i class="material-design-bookmark45 star  fa-stack-1x"></i>
										</span>
										<?php } ?>
										<?php } ?>
									</div>
									<?php } ?>
									<button class="product-btn-add" data-toggle="tooltip" title="<?php echo $button_cart; ?>" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');">
										<i class="fl-line-icon-set-grocery10"></i>
										<span><?php echo $button_cart; ?></span>
									</button>
									<ul class="product-buttons">
										<li>
											<button class="btn btn-icon" type="button" data-toggle="tooltip"title="<?php echo $button_wishlist; ?>"onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
												<i class="fa fa-heart"></i>
												<span><?php echo $button_wishlist; ?></span>
											</button>
										</li>
										<li>
											<button class="btn btn-icon" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i>
												<span><?php echo $button_compare; ?></span>
											</button>
										</li>
									</ul>
									<div class="clear"></div>
								</div>
								<div class="col-sm-12">
									<div class="quickview_description description">
										<?php echo $product['description1']; ?>
									</div>
								</div>
							</div>
						</div>
					</div>
					<?php if ($product['special']) { ?>
					<div class="sale"><span><?php echo $text_sale; ?></span></div>
					<?php } ?>
					<div class="image">
						<a class="lazy" style="padding-bottom: <?php echo($product['img-height'] / $product['img-width'] * 100); ?>%" href="<?php echo $product['href']; ?>">
							<img alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" data-src="<?php echo $product['thumb']; ?>" src="#"/>
						</a>
						<a class="quickview" data-rel="details" href="#quickview_latest_<?php echo $tl . $module ?>">
							<?php echo $text_quick; ?>
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
							<span class="fa-stack"><i class="material-design-bookmark45 fa-stack-1x"></i></span>
							<?php } else { ?>
							<span class="fa-stack">
								<i class="material-design-bookmark45 fa-stack-1x"></i>
								<i class="material-design-bookmark45 star  fa-stack-1x"></i>
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
						<button class="product-btn-add" type="button" onclick="ajaxAdd($(this),<?php echo $product['product_id'] ?>);">
							<i class="fl-line-icon-set-grocery10"></i>
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
		</div>
		<?php } ?>
		<?php if ($special_products) { ?>
		<div role="tabpanel" class="tab-pane" id="tab-specials-<?php echo $module; ?>">
			<div class="box-carousel">
				<?php $ts = 13000; foreach ($special_products as $product) { $ts++ ?>
				<div class="product-thumb transition <?php if ($product['options']) echo 'options';?>">
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
									<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id'] . $module . $ts; ?>">
										<?php echo $option['name']; ?>
									</label>
									<div class="col-sm-12">
										<select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id'] .  $module . $ts; ?>" class="form-control">
											<option value=""><?php echo $text_select; ?></option>
											<?php foreach ($option['product_option_value'] as $option_value) { ?>
											<option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
												<?php if ($option_value['price']) { ?>
												(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
												<?php } ?>
											</option>
											<?php } ?>
										</select>
									</div>
								</div>
								<?php } ?>
								<?php if ($option['type'] == 'radio') { ?>
								<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
									<label class="control-label col-sm-12"><?php echo $option['name']; ?></label>
									<div class="col-sm-12">
										<div id="input-option<?php echo $option['product_option_id'] .  $module . $ts; ?>">
											<?php foreach ($option['product_option_value'] as $option_value) { ?>
											<div class="radio">
												<label for="option[<?php echo $option['product_option_id'] . $option_value['product_option_value_id'] .  $module . $ts; ?>]">
													<input type="radio" hidden name="option[<?php echo $option['product_option_id']; ?>]" id="option[<?php echo $option['product_option_id'] . $option_value['product_option_value_id'] .  $module . $ts; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>"/>
													<?php echo $option_value['name']; ?>
													<?php if ($option_value['price']) { ?>
													(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
													<?php } ?>
												</label>
											</div>
											<?php } ?>
										</div>
									</div>
								</div>
								<?php } ?>
								<?php if ($option['type'] == 'checkbox') { ?>
								<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
									<label class="control-label col-sm-12"><?php echo $option['name']; ?></label>
									<div class="col-sm-12">
										<div id="input-option<?php echo $option['product_option_id'] .  $module . $ts; ?>">
											<?php foreach ($option['product_option_value'] as $option_value) { ?>
											<div class="checkbox">
												<label>
													<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>"/>
													<?php echo $option_value['name']; ?>
													<?php if ($option_value['price']) { ?>
													(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
													<?php } ?>
												</label>
											</div>
											<?php } ?>
										</div>
									</div>
								</div>
								<?php } ?>
								<?php if ($option['type'] == 'image') { ?>
								<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
									<label class="control-label col-sm-12"><?php echo $option['name']; ?></label>
									<div class="col-sm-12">
										<div id="input-option<?php echo $option['product_option_id'] .  $module . $ts; ?>">
											<?php foreach ($option['product_option_value'] as $option_value) { ?>
											<div class="radio">
												<label>
													<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>"/>
													<img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail"/> <?php echo $option_value['name']; ?>
													<?php if ($option_value['price']) { ?>
													(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
													<?php } ?>
												</label>
											</div>
											<?php } ?>
										</div>
									</div>
								</div>
								<?php } ?>
								<?php if ($option['type'] == 'text') { ?>
								<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
									<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id'] .  $module . $ts; ?>"><?php echo $option['name']; ?></label>
									<div class="col-sm-12">
										<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id'] .  $module . $ts; ?>" class="form-control"/>
									</div>
								</div>
								<?php } ?>
								<?php if ($option['type'] == 'textarea') { ?>
								<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
									<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id'] .  $module . $ts; ?>"><?php echo $option['name']; ?></label>
									<div class="col-sm-12">
										<textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id'] .  $module . $ts; ?>" class="form-control"><?php echo $option['value']; ?>
										</textarea>
									</div>
								</div>
								<?php } ?>
								<?php if ($option['type'] == 'file') { ?>
								<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
									<label class="control-label col-sm-12"><?php echo $option['name']; ?></label>
									<div class="col-sm-12">
										<button type="button" id="button-upload<?php echo $option['product_option_id'] .  $module . $ts; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-block btn-default">
											<i class="fa fa-upload"></i> 
											<?php echo $button_upload; ?>
										</button>
										<input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id'] .  $module . $ts; ?>"/>
									</div>
								</div>
								<?php } ?>
								<?php if ($option['type'] == 'date') { ?>
								<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
									<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id'] .  $module . $ts; ?>"><?php echo $option['name']; ?></label>
									<div class="col-sm-12">
										<div class="input-group date">
											<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id'] .  $module . $ts; ?>" class="form-control"/>
											<span class="input-group-btn">
												<button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
											</span>
										</div>
									</div>
								</div>
								<?php } ?>
								<?php if ($option['type'] == 'datetime') { ?>
								<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
									<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id'] .  $module . $ts; ?>"><?php echo $option['name']; ?></label>
									<div class="col-sm-12">
										<div class="input-group datetime">
											<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id'] .  $module . $ts; ?>" class="form-control"/>
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
									<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id'] .  $module . $ts; ?>"><?php echo $option['name']; ?></label>
									<div class="col-sm-12">
										<div class="input-group time">
											<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id'] .  $module . $ts; ?>" class="form-control"/>
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
					<div class="quick_info">
						<div id="quickview_special_<?php echo $ts . $module ?>" class="quickview-style">
							<div>
								<div class="left col-sm-4">
									<div class="quickview_image image">
										<a href="<?php echo $product['href']; ?>"><img alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" src="<?php echo $product['thumb']; ?>"/></a>
									</div>
								</div>
								<div class="right col-sm-8">
									<h2><?php echo $product['name']; ?></h2>
									<div class="inf">
										<?php if ($product['author']) { ?>
										<p class="quickview_manufacture manufacture manufacture"><?php echo $text_manufacturer; ?>
											<a href="<?php echo $product['manufacturers']; ?>"><?php echo $product['author']; ?></a>
										</p>
										<?php } ?>
										<?php if ($product['model']) { ?>
										<p class="product_model model"><?php echo $text_model; ?> <?php echo $product['model']; ?></p>
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
									<?php if ($product['rating']) { ?>
									<div class="rating">
										<?php for ($i = 1; $i <= 5; $i++) { ?>
										<?php if ($product['rating'] < $i) { ?>
										<span class="fa-stack"><i class="material-design-bookmark45 fa-stack-1x"></i></span>
										<?php } else { ?>
										<span class="fa-stack">
											<i class="material-design-bookmark45 fa-stack-1x"></i>
											<i class="material-design-bookmark45 star  fa-stack-1x"></i>
										</span>
										<?php } ?>
										<?php } ?>
									</div>
									<?php } ?>
									<button class="product-btn-add" data-toggle="tooltip" title="<?php echo $button_cart; ?>" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');">
										<i class="fl-line-icon-set-grocery10"></i>
										<span><?php echo $button_cart; ?></span>
									</button>
									<ul class="product-buttons">
										<li>
											<button class="btn btn-icon" type="button" data-toggle="tooltip"title="<?php echo $button_wishlist; ?>"onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
												<i class="fa fa-heart"></i>
												<span><?php echo $button_wishlist; ?></span>
											</button>
										</li>
										<li>
											<button class="btn btn-icon" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i>
												<span><?php echo $button_compare; ?></span>
											</button>
										</li>
									</ul>
									<div class="clear"></div>
								</div>
								<div class="col-sm-12">
									<div class="quickview_description description">
										<?php echo $product['description1']; ?>
									</div>
								</div>
							</div>
						</div>
					</div>
					<?php if ($product['special']) { ?>
					<div class="sale"><span><?php echo $text_sale; ?></span></div>
					<?php } ?>
					<div class="image">
						<a class="lazy" style="padding-bottom: <?php echo($product['img-height'] / $product['img-width'] * 100); ?>%" href="<?php echo $product['href']; ?>">
							<img alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" data-src="<?php echo $product['thumb']; ?>" src="#"/>
						</a>
						<a class="quickview" data-rel="details" href="#quickview_special_<?php echo $ts . $module ?>">
							<?php echo $text_quick; ?>
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
							<span class="fa-stack"><i class="material-design-bookmark45 fa-stack-1x"></i></span>
							<?php } else { ?>
							<span class="fa-stack">
								<i class="material-design-bookmark45 fa-stack-1x"></i>
								<i class="material-design-bookmark45 star  fa-stack-1x"></i>
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
						<button class="product-btn-add" type="button" onclick="ajaxAdd($(this),<?php echo $product['product_id'] ?>);">
							<i class="fl-line-icon-set-grocery10"></i>
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
		</div>
		<?php } ?>
		<?php if ($bestseller_products) { ?>
		<div role="tabpanel" class="tab-pane" id="tab-bestsellers-<?php echo $module; ?>">
			<div class="box-carousel">
				<?php $tb = 14000; foreach ($bestseller_products as $product) { $tb++ ?>
				<div class="product-thumb transition <?php if ($product['options']) echo 'options';?>">
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
									<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id'] . $module . $tb; ?>">
										<?php echo $option['name']; ?>
									</label>
									<div class="col-sm-12">
										<select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id'] .  $module . $tb; ?>" class="form-control">
											<option value=""><?php echo $text_select; ?></option>
											<?php foreach ($option['product_option_value'] as $option_value) { ?>
											<option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
												<?php if ($option_value['price']) { ?>
												(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
												<?php } ?>
											</option>
											<?php } ?>
										</select>
									</div>
								</div>
								<?php } ?>
								<?php if ($option['type'] == 'radio') { ?>
								<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
									<label class="control-label col-sm-12"><?php echo $option['name']; ?></label>
									<div class="col-sm-12">
										<div id="input-option<?php echo $option['product_option_id'] .  $module . $tb; ?>">
											<?php foreach ($option['product_option_value'] as $option_value) { ?>
											<div class="radio">
												<label for="option[<?php echo $option['product_option_id'] . $option_value['product_option_value_id'] .  $module . $tb; ?>]">
													<input type="radio" hidden name="option[<?php echo $option['product_option_id']; ?>]" id="option[<?php echo $option['product_option_id'] . $option_value['product_option_value_id'] .  $module . $tb; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>"/>
													<?php echo $option_value['name']; ?>
													<?php if ($option_value['price']) { ?>
													(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
													<?php } ?>
												</label>
											</div>
											<?php } ?>
										</div>
									</div>
								</div>
								<?php } ?>
								<?php if ($option['type'] == 'checkbox') { ?>
								<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
									<label class="control-label col-sm-12"><?php echo $option['name']; ?></label>
									<div class="col-sm-12">
										<div id="input-option<?php echo $option['product_option_id'] .  $module . $tb; ?>">
											<?php foreach ($option['product_option_value'] as $option_value) { ?>
											<div class="checkbox">
												<label>
													<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>"/>
													<?php echo $option_value['name']; ?>
													<?php if ($option_value['price']) { ?>
													(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
													<?php } ?>
												</label>
											</div>
											<?php } ?>
										</div>
									</div>
								</div>
								<?php } ?>
								<?php if ($option['type'] == 'image') { ?>
								<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
									<label class="control-label col-sm-12"><?php echo $option['name']; ?></label>
									<div class="col-sm-12">
										<div id="input-option<?php echo $option['product_option_id'] .  $module . $tb; ?>">
											<?php foreach ($option['product_option_value'] as $option_value) { ?>
											<div class="radio">
												<label>
													<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>"/>
													<img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail"/> <?php echo $option_value['name']; ?>
													<?php if ($option_value['price']) { ?>
													(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
													<?php } ?>
												</label>
											</div>
											<?php } ?>
										</div>
									</div>
								</div>
								<?php } ?>
								<?php if ($option['type'] == 'text') { ?>
								<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
									<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id'] .  $module . $tb; ?>"><?php echo $option['name']; ?></label>
									<div class="col-sm-12">
										<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id'] .  $module . $tb; ?>" class="form-control"/>
									</div>
								</div>
								<?php } ?>
								<?php if ($option['type'] == 'textarea') { ?>
								<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
									<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id'] .  $module . $tb; ?>"><?php echo $option['name']; ?></label>
									<div class="col-sm-12">
										<textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id'] .  $module . $tb; ?>" class="form-control"><?php echo $option['value']; ?>
										</textarea>
									</div>
								</div>
								<?php } ?>
								<?php if ($option['type'] == 'file') { ?>
								<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
									<label class="control-label col-sm-12"><?php echo $option['name']; ?></label>
									<div class="col-sm-12">
										<button type="button" id="button-upload<?php echo $option['product_option_id'] .  $module . $tb; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-block btn-default">
											<i class="fa fa-upload"></i> 
											<?php echo $button_upload; ?>
										</button>
										<input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id'] .  $module . $tb; ?>"/>
									</div>
								</div>
								<?php } ?>
								<?php if ($option['type'] == 'date') { ?>
								<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
									<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id'] .  $module . $tb; ?>"><?php echo $option['name']; ?></label>
									<div class="col-sm-12">
										<div class="input-group date">
											<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id'] .  $module . $tb; ?>" class="form-control"/>
											<span class="input-group-btn">
												<button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
											</span>
										</div>
									</div>
								</div>
								<?php } ?>
								<?php if ($option['type'] == 'datetime') { ?>
								<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
									<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id'] .  $module . $tb; ?>"><?php echo $option['name']; ?></label>
									<div class="col-sm-12">
										<div class="input-group datetime">
											<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id'] .  $module . $tb; ?>" class="form-control"/>
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
									<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id'] .  $module . $tb; ?>"><?php echo $option['name']; ?></label>
									<div class="col-sm-12">
										<div class="input-group time">
											<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id'] .  $module . $tb; ?>" class="form-control"/>
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
					<div class="quick_info">
						<div id="quickview_bestseller_<?php echo $tb . $module ?>" class="quickview-style">
							<div>
								<div class="left col-sm-4">
									<div class="quickview_image image">
										<a href="<?php echo $product['href']; ?>"><img alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" src="<?php echo $product['thumb']; ?>"/></a>
									</div>
								</div>
								<div class="right col-sm-8">
									<h2><?php echo $product['name']; ?></h2>
									<div class="inf">
										<?php if ($product['author']) { ?>
										<p class="quickview_manufacture manufacture manufacture"><?php echo $text_manufacturer; ?>
											<a href="<?php echo $product['manufacturers']; ?>"><?php echo $product['author']; ?></a>
										</p>
										<?php } ?>
										<?php if ($product['model']) { ?>
										<p class="product_model model"><?php echo $text_model; ?> <?php echo $product['model']; ?></p>
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
									<?php if ($product['rating']) { ?>
									<div class="rating">
										<?php for ($i = 1; $i <= 5; $i++) { ?>
										<?php if ($product['rating'] < $i) { ?>
										<span class="fa-stack"><i class="material-design-bookmark45 fa-stack-1x"></i></span>
										<?php } else { ?>
										<span class="fa-stack">
											<i class="material-design-bookmark45 fa-stack-1x"></i>
											<i class="material-design-bookmark45 star  fa-stack-1x"></i>
										</span>
										<?php } ?>
										<?php } ?>
									</div>
									<?php } ?>
									<button class="product-btn-add" data-toggle="tooltip" title="<?php echo $button_cart; ?>" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');">
										<i class="fl-line-icon-set-grocery10"></i>
										<span><?php echo $button_cart; ?></span>
									</button>
									<ul class="product-buttons">
										<li>
											<button class="btn btn-icon" type="button" data-toggle="tooltip"title="<?php echo $button_wishlist; ?>"onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
												<i class="fa fa-heart"></i>
												<span><?php echo $button_wishlist; ?></span>
											</button>
										</li>
										<li>
											<button class="btn btn-icon" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i>
												<span><?php echo $button_compare; ?></span>
											</button>
										</li>
									</ul>
									<div class="clear"></div>
								</div>
								<div class="col-sm-12">
									<div class="quickview_description description">
										<?php echo $product['description1']; ?>
									</div>
								</div>
							</div>
						</div>
					</div>
					<?php if ($product['special']) { ?>
					<div class="sale"><span><?php echo $text_sale; ?></span></div>
					<?php } ?>
					<div class="image">
						<a class="lazy" style="padding-bottom: <?php echo($product['img-height'] / $product['img-width'] * 100); ?>%" href="<?php echo $product['href']; ?>">
							<img alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" data-src="<?php echo $product['thumb']; ?>" src="#"/>
						</a>
						<a class="quickview" data-rel="details" href="#quickview_bestseller_<?php echo $tb . $module ?>">
							<?php echo $text_quick; ?>
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
							<span class="fa-stack"><i class="material-design-bookmark45 fa-stack-1x"></i></span>
							<?php } else { ?>
							<span class="fa-stack">
								<i class="material-design-bookmark45 fa-stack-1x"></i>
								<i class="material-design-bookmark45 star  fa-stack-1x"></i>
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
						<button class="product-btn-add" type="button" onclick="ajaxAdd($(this),<?php echo $product['product_id'] ?>);">
							<i class="fl-line-icon-set-grocery10"></i>
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
		</div>
		<?php } ?>
	</div>
</div>