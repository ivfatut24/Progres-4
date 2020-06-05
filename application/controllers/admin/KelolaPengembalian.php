<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class KelolaPengembalian extends MY_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->cekAksesAdmin();
		$this->session->set_flashdata('menu', 'kelola-pengembalian');
	}

	public function index()
	{
		$data['pemesanan'] = $this->pemesanan->getAllPemesanan(3);
		$this->load->view('admin/kelola_pengembalian/index');
	}
}

/* End of file KelolaPengembalian.php */
/* Location: ./application/controllers/admin/KelolaPengembalian.php */
