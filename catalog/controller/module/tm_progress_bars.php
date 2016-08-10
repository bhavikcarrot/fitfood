<?php

class ControllerModuleTMProgressBars extends Controller
{
	private $error = array();

	public function index($setting) {
		static $module = 0;
		$this->load->language('module/tm_progress_bars');

		if ($setting['type'] == 0){
			$this->document->addScript('catalog/view/theme/' . $this->config->get($this->config->get('config_theme') . '_directory') . '/js/tmprogressbars/progressbar.min.js');
		} else {
			$this->document->addScript('catalog/view/theme/' . $this->config->get($this->config->get('config_theme') . '_directory') . '/js/tmprogressbars/jquery.counter.js');
		}

		$data['type'] = $setting['type'];

		$data['heading_title'] = $this->language->get('heading_title');

		$data['percentage'] = $setting['percentage'];
		$data['progress'] = $setting['tm_progress_bars'][$this->config->get('config_language_id')];

		$data['action'] = $this->url->link('module/tm_progress_bars', '', true);

		$data['module'] = $module++;

		return $this->load->view('module/tm_progress_bars', $data);
	}
}