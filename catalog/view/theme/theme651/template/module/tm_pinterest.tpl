<div class="col-sm-4">
<div class="box pinterest soc_info text-center">
		<div class="box-heading">
			<h3><?php echo $heading_title; ?></h3>
		</div>
		<div class="box-content">
			<a data-pin-do="embedUser" href="<?php echo $page_url; ?>" data-pin-scale-width="100" data-pin-scale-height="<?php echo $height; ?>" data-pin-board-width="<?php echo $width; ?>"></a>
		</div>
	</div>
</div>

<script>
	(function(d){
		var f = d.getElementsByTagName('SCRIPT')[0], p = d.createElement('SCRIPT');
		p.type = 'text/javascript';
		p.async = true;
		p.src = '//assets.pinterest.com/js/pinit.js';
		f.parentNode.insertBefore(p, f);
	}(document));
</script>