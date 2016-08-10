<?php
class ControllerModuleTmCategory extends Controller {
	public function index($setting) {
		$this->load->language('module/tm_category');

		$data['heading_title'] = $this->language->get('heading_title');

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$this->load->model('design/topmenu');
		$data['categories'] = $this->model_design_topmenu->getMenu();
		$categories = $this->model_catalog_category->getCategories(0);

		return $this->load->view('module/tm_category', $data);
	}
	
}