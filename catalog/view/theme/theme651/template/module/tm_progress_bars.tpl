<div class="block-progress">
	<!-- <h3><?php echo $heading_title; ?></h3> -->
	<div id="progress-bars<?php echo $module; ?>" class="prog-wrapper">
		<?php if ($type == '2') {
			foreach ($progress['title'] as $key => $value) { ?>
			<div>
				<h6><?php echo $value ?></h6>
				 <div class="progress-horizontal" data-progress="<?php echo $percentage[$key]; ?>">                       
                        <div class="bar" style="width: <?php echo $percentage[$key] . '%'; ?>"></div><div class="text" style="left: <?php echo $percentage[$key] . '%'; ?>">0</div>
                    </div>
			</div>
			<?php }
		} elseif ($type == '1') {
			foreach ($progress['title'] as $key => $value) { ?>
			<div>
				<h6><?php echo $value ?></h6>
				<div class="progress-vertical" data-progress="<?php echo $percentage[$key]; ?>">
					<div class="text">0</div>
					<div class="bar" style="height: <?php echo $percentage[$key] . '%'; ?>">
						<div class="text text-inner">0</div>
					</div>
				</div>
			</div>
			<?php }
		} else {
			foreach ($progress['title'] as $key => $value) { ?>
			<div>
				<h6><?php echo $value ?></h6>
				<div class="radial-progress draw" data-progress="<?php echo $percentage[$key]; ?>">
				</div>
			</div>
			<?php }
		} ?>
	</div>
</div>

<script>
	;
	(function ($) {
		<?php if ($type == 0){ ?>
			function animationClass() {
				$('.radial-progress.draw').each(function () {
					var a = ($(this).offset().top - $(window).scrollTop()) < $(window).height(),
					scrollUp = ($(this).offset().top - $(window).scrollTop()) > -$(this).height();
					if (a && scrollUp) {
						$(this).each(function () {
							var progress = $(this).data('progress');
							var circle = new ProgressBar.Circle('.radial-progress.draw', {
								color: '#000',
								trailColor: '#000',
								fill: '#000',
								strokeWidth: 10,
								trailWidth: 0,
								duration: 1500,
								text: {
									value: '0'
								},
								step: function (state, bar) {
									bar.setText((bar.value() * 100).toFixed(0));
								}
							});
							circle.animate(progress / 100, function () {
							});
							$(this).removeClass('draw');
						})
					}
				})
			}

			$(window).on('load scroll', animationClass);

			<?php } else { ?>
				function animationClass() {
					$('[class*="progress"]').not('.visible').each(function () {
						var a = ($(this).offset().top - $(window).scrollTop()) < $(window).height(),
						scrollUp = ($(this).offset().top - $(window).scrollTop()) > -$(this).height();
						if (a && scrollUp) {
							$(this).addClass('visible');
							$(this).find('.text').counter({
								start: 0,
								end: $(this).data('progress'),
								time: 1,
								step: 50
							});
						}
					})
				}

				$(window).on('load scroll', animationClass);

				function progressResize() {
					<?php if ($type == 2){ ?>
					<?php } else { ?>
					$('.progress-vertical .text-inner').css('height', $('.progress-vertical').height());
					<?php } ?>
				}

				$(window).on('load resize', progressResize);

				<?php }?>
				})(jQuery)
				</script>




