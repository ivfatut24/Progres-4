<?php
	defined('BASEPATH') OR exit('No direct script access allowed');
	
	class Model_Pemesanan extends CI_Model {
	
		function getAllPemesanan($date = 0)
		{
			if ($date == 1) {
				$firstDay = new DateTime('first day of last month');
				$lastDay  = new DateTime('last day of last month');
				$this->db->where('tgl_pemesanan BETWEEN \''. $firstDay->format('Y-m-d h:i:s') .'\' AND \''. $lastDay->format('Y-m-d h:i:s') .'\'');
			}
			if ($date == 2) {
				$firstDay = new DateTime('first day of this month');
				$lastDay  = new DateTime('last day of this month');
				$this->db->where('tgl_pemesanan BETWEEN \''. $firstDay->format('Y-m-d h:i:s') .'\' AND \''. $lastDay->format('Y-m-d h:i:s') .'\'');
			}

			if ($date == 3) {
				$this->db->join('users u', 't.id_user = u.id_user', 'left');				
				$this->db->join('pembayaran p', 't.id_transaksi = p.id_transaksi', 'left');
				$this->db->where('p.status', 1);
				$this->db->where('p.is_verified', 1);
			}
			
			$this->db->where('status_transaksi !=', 0);
			return $this->db->get('transaksi t')->result();
		}
	
		function siap($id_transaksi)
		{
			$this->db->update('transaksi', ['status_transaksi' => 2], ['id_transaksi' => $id_transaksi]);
		}


	}
	
	/* End of file Model_Pemesanan.php */
	
?>
