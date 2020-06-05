<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class KelolaPemesanan extends MY_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->cekAksesAdmin();
		$this->session->set_flashdata('menu', 'kelola-pemesanan');
	}

	public function index()
	{
		$data['pemesanan'] = $this->pemesanan->getAllPemesanan(3);
		$this->load->view('admin/kelola_pemesanan/index', $data);
	}

	public function siap($id_transaksi)
	{
		$this->pemesanan->siap($id_transaksi);
		redirect(base_url('admin/kelola/pemesanan'));
	}

}

/* End of file KelolaPemesanan.php */
/* Location: ./application/controllers/admin/KelolaPemesanan.php */
