<script src="//www.google.com/recaptcha/api.js" type="text/javascript"></script>
<div class="form-group required">
    <div class="col-sm-12">
        <div class="g-recaptcha" data-sitekey="<?php echo $site_key; ?>"></div>
        <?php if ($error_captcha) { ?>
            <div class="text-danger"><?php echo $error_captcha; ?></div>
        <?php } ?>
    </div>
</div>
