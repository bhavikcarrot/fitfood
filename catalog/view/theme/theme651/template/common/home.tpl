<?php echo $header; ?>

    <section id="container">
        <div class="container">
            <div class="row"><?php echo $column_left; ?>
                <?php if ($column_left && $column_right) { ?>
                    <?php $class = 'col-sm-6'; ?>
                <?php } elseif ($column_left || $column_right) { ?>
                    <?php $class = 'col-sm-9'; ?>
                <?php } else { ?>
                    <?php $class = 'col-sm-12'; ?>
                <?php } ?>
                <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?></div>
                <?php echo $column_right; ?></div>
        </div>
    </section>
    <section class="content_bottom">
        <?php echo $content_bottom; ?>
    </section>
<?php if ($bottom) { ?>
    <section class="bottom"><div class="container"><div class="row"><?php echo $bottom; ?></div></div></section>
<?php }
echo $footer; ?>