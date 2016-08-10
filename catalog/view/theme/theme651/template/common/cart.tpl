<div class="box-cart">
	<div id="cart" class="cart toggle-wrap">
		
		<button type="button" data-loading-text="<?php echo $text_loading; ?>" class="toggle">
			<i class="fl-line-icon-set-grocery10"></i> 
			<strong><?php echo $text_shopping_cart; ?></strong>						
		</button>
		<?php if (isset($text_items2)) { ?>
			<span id="cart-total2" class="cart-total2"><?php echo $text_items2; ?></span>
		<?php } ?>
			<p>
				<span id="cart-total" class="cart-total"><?php echo $text_items; ?></span> 
				<a class="checkout-button" href="<?php echo $checkout; ?>" ><?php echo $text_checkout; ?></a>
			</p>	
		<ul class="pull-right toggle_cont">
			<?php if ($products || $vouchers) { ?>
			<li>
				<table class="table">
				
					<thead><tr><td><?php echo $text_shopping_cart; ?></td><td><?php echo $text_check; ?></td></tr></thead>
					
					<tbody>
					<tr>
					<td>
					<?php foreach ($products as $product) { ?>
					<div>
						<div class="text-left"><?php if ($product['thumb']) { ?>
							<div class="image">
								<a href="<?php echo $product['href']; ?>">
									<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" />
								</a>
							</div>
							<?php } ?>
						</div>
						<div class="text-center">
							<div class="name">
								<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
							</div>							
							<div> x <?php echo $product['quantity']; ?> <span class="price-cart"><?php echo $product['total']; ?></span></div>
						</div>
						<div class="text-right">
							<button type="button" onclick="cart.remove('<?php echo $product['cart_id']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs">
								<i class="fa fa-times"></i>
							</button>
						</div>
					</div>
					<?php } ?>
					
					<?php foreach ($vouchers as $voucher) { ?>
						<div class="text-left"><?php echo $voucher['description']; ?></div>
						<div class="text-center">x&nbsp;1&nbsp;<?php echo $voucher['amount']; ?></div>
						<div class="text-right text-danger">
							<button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs">
								<i class="fa fa-times"></i>
							</button>
						</div>
					<?php } ?>
					</td>
					
					<td>
					<div class="total">
						<?php foreach ($totals as $total) { ?>
							<div class="text-left">
								<?php echo $total['title']; ?>
							</div>
							<div class="text-right">
								<?php echo $total['text']; ?>
							</div>
						<?php } ?>
					</div>
					<div class="text-right">
						<a class="btn btn-primary" href="<?php echo $cart; ?>"><span><?php echo $text_cart; ?></span></a>
						<a class="btn btn-primary" href="<?php echo $checkout; ?>"><span><?php echo $text_checkout; ?></span></a>
					</div>
					</td>
					
					</tr>
					</tbody>
					
				</table>
			</li>
			<?php } else { ?>
			<li>
				<p class="text-center"><?php echo $text_empty; ?></p>
			</li>
			<?php } ?>
		</ul>
	</div>
</div>
