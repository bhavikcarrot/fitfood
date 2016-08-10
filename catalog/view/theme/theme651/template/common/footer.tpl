<footer>
    <div class="container">
		<div class="row">
			<div class="logo col-sm-4">
				<?php if ($logo) { ?>
				<a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive"/></a>
				<?php } else { ?>
				<h1>
					<a href="<?php echo $home; ?>"><?php echo $name; ?></a>
				</h1>
				<?php } ?>
			</div>
			<div class="footer_box col-lg-2 col-md-3 col-sm-3 col-xs-12">
				<?php if ($informations) { ?>
					<h5><?php echo $text_information; ?></h5>
					<ul class="list-unstyled">
						<?php foreach ($informations as $information) { ?>
							<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
						<?php } ?>							
					</ul>
                <?php } ?>
			</div>
			
			<div class="footer_box col-lg-3 col-md-2 col-sm-2 col-xs-12">
				 <?php if ($footer_top) { ?>
					<div class="footer"> <?php echo $footer_top; ?> </div>
				<?php } ?>
			</div>			
			
			<div class="footer_box col-sm-3">			
				<a class="phone" href="tel:<?php echo $telephone; ?>"><?php echo $telephone; ?></a><br>
				<span class="phone-call" ><?php echo $text_call; ?></span><br>			
				<?php if ($address) { ?>
				<p> <?php echo $address ?> </p>
				<?php } ?>
			</div>
			
		</div>
	
    </div>
    <div class="copyright">
        <div class="container">
            <?php echo $powered; ?><!-- [[%FOOTER_LINK]] -->
        </div>
    </div>
</footer>
<script src="catalog/view/theme/<?php echo $theme_path; ?>/js/livesearch.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/<?php echo $theme_path; ?>/js/script.js" type="text/javascript"></script>
</div>

<div class="ajax-overlay"></div>
<script>
$(document).ready(function(){
	//console.log($(document).scrollTop());
	$('.scroll-menu-bg').css("display" , "none");
	$(window).scroll(function() {
		//console.log('here');
			if ($(document).scrollTop() >400) {
			$('.scroll-menu-bg').css("display" , "block");
			}
			else {
			$('.scroll-menu-bg').css("display" , "none"); }
	});
	$(window).trigger('scroll');
});
</script>
<!-- coder by xena -->

</body></html>