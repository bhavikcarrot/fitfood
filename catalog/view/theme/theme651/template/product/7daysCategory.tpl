<script>var str = window.parent.location.href;
var idx = str.indexOf("mealType");
if(idx>0){
	window.location = 'index.php?route=product/7days&product_id=53';	
}
</script>
<div class="row">
		<?php $pr = 10000;  foreach ($products as $product) { $pr++?>
		<div class="product-layout product-list col-xs-12" id="div-<?php echo $product['product_id']; ?>">
            <div class="product-thumb transition <?php if ($product['options']) echo 'options';  ?>">
				<?php $sa = 0; if ($product['special']) { $sa = 1; ?>
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
	<?php if ($product['label_new'] && $sa == 0) { ?>
	<div class="new-pr"><span><?php echo $text_new; ?></span></div>
	<?php } ?>
			<div class="image">
				<a href="<?php echo $product['href']; ?>">
                                <img alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" src="<?php echo $product['thumb']; ?>"/>
                            </a>

				<?php if ($product['rating']) { ?><div class="rating">
					<?php for ($i = 1; $i <= 5; $i++) { ?>
					<?php if ($product['rating'] < $i) { ?> <?php } else { ?>
					<span class="fa-stack"> <i class="fa fa-star fa-stack-1x"></i> </span>
					<?php } ?>
					<?php } ?>
				</div><?php } ?>
						
			</div>
			
			<div class="product__buttons">
				<button class="product-btn" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
				<button class="product-btn" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart-o"></i></button>
			</div>
			
				<div class="caption">
					
					<div class="name"> <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a> </div>
                    <?php if ($product['options']) { ?>
            <hr>
            
            <?php foreach ($product['options'] as $option) { ?>
            <?php if ($option['type'] == 'select') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><!--<option value=""><?php echo $text_select; ?></option>-->
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                <?php } ?>
                </option>
                <?php } ?>
              </select>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'radio') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="radio">
                  <label>
                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'checkbox') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="checkbox">
                  <label>
                    <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" title="<?php echo $option_value['name']; ?>" />
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'image') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="radio">
                  <label>
                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'text') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'textarea') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'file') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'date') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group date">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'datetime') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group datetime">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'time') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group time">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php } ?>
            <?php } ?>
					<!--<div class="description-small"><?php echo mb_substr($product['description'],0,65,'UTF-8').'...'; ?></div>
					<div class="description"><?php echo $product['description']; ?></div>-->
					
				</div>
				
				<div class="cart-button">
				
					<?php if ($product['price']) { ?>
						<div class="price price-product">
							<?php if (!$product['special']) { ?>
							<?php echo $product['price']; ?>
							<?php } else { ?>
							<span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
							<?php } ?>
							<?php if ($product['tax']) { ?>
							<span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
							<?php } ?>
						</div>
					<?php } ?>
					<input type="hidden" name="quantity" value="1" size="2" id="input-quantity" class="form-control"/>
                    <input type="hidden" name="product_id" value="<?php echo $product['product_id']; ?>"/>
					<button class="product-btn btn-add 7days-addCart" id="product-<?php echo $product['product_id']; ?>" type="button" data-toggle="tooltip" title="<?php echo $button_cart; ?>" <?php if (count($product['options']) >= 4) { ?> onclick="cart.add('<?php echo $product['product_id']; ?>');" <?php } else { ?> onclick="ajaxAdd($(this),<?php echo $product['product_id'] ?>);" <?php } ?>><i class="fl-line-icon-set-grocery10"></i></button>
					
				</div>
				
                <div class="aside">
				
                	<div class="rating">
						<?php if ($product['rating']) { ?>
							<?php for ($i = 1; $i <= 5; $i++) { ?>
							<?php if ($product['rating'] < $i) { ?> <?php } else { ?>
							<span class="fa-stack"> <i class="fa fa-star fa-stack-1x"></i> </span>
							<?php } ?>
							<?php } ?>
						<?php } ?>
					</div>
					<input type="hidden" name="meal" value="<?=$meal?>" />
                    <input type="hidden" name="meal_type" value="<?=$meal_type?>" /><input type="hidden" name="meal_days" value="<?=$meal_days?>" />
					<div class="cart-button">
                		<button class="btn btn-primary 7days-addCart"  id="product-<?php echo $product['product_id']; ?>" type="button"><i class="fl-line-icon-set-grocery10"></i> <span><?php echo $button_cart; ?></span></button>
						<div class="clear"></div>                		
                		<button class="btn btn-product" type="button" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i> <span><?php echo $button_compare; ?></span></button>
						<button class="btn btn-product" type="button" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart-o"></i> <span><?php echo $button_wishlist; ?></span></button>
                	</div>
					
                </div>
            </div>
			<div class="clear"></div>
		</div>
		<?php } ?>
	  </div>
      
      