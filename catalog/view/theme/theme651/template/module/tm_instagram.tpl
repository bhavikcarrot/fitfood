<div class="instagram">
	<div class="box-heading">
		<h3><?php echo $heading_title . ' @ ' . $tag_name; ?></h3>
	</div>
	<div class="box-content">
		<div id="instafeed" class="row"></div>
	</div>
</div>
<script type="text/javascript">
    var userFeed = new Instafeed({
        get: <?php if ($get == 'user') { ?>'user'<?php } else { ?>'tagged'<?php } ?>,
		<?php if ($get == 'tagged') { ?>tagName:'<?php echo $tag_name; ?>',<?php } ?>
		<?php if ($get == 'tagged') { ?>clientId:'<?php echo $clientid; ?>',<?php } ?>
		
        <?php if ($get == 'user') { ?>userId: <?php echo $user_id; ?>,<?php } ?>
		limit:<?php echo $limit; ?>,
        <?php if ($get == 'user') { ?>accessToken: '<?php echo $accesstoken; ?>',<?php } ?>
		template: '<a class="col-sm-4 col-xs-4" href="{{link}}"><img src="{{image}}" /><span class="fa fa-heart">{{likes}}</span><span class="fa fa-comment float-right">{{comments}}</span></a>'
    });
    userFeed.run();
</script>
