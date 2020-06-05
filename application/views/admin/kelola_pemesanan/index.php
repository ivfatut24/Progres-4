<?php
defined('BASEPATH') OR exit('No direct script access allowed');
$this->load->view('admin/header');
?>
<div class="container-fluid p-0">
    <div class="row mb-3">
        <div class="col-lg-8 col-sm-8 col-12">
            <h1 class=" m-0 font-weight-light">Data Pemesanan</h1>
            <span class="text-black-80"> <?= ''//count($data)?> data</span>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="table" class="table table-hover">
                            <thead>
                                <tr>
									<th class="text-center">No Booking</th>
									<th class="text-left">Nama Pemesan</th>
									<th class="text-center">Tgl Pemesanan</th>
									<th class="text-center">Tgl Pengembalian</th>
									<th class="text-right">Total Sewa</th>
									<th class="nosort"></th>
								</tr>
                            </thead>

							</tbody>
							<?php $no=1; ?>
							<?php
								// dd($pemesanan);
								foreach ($pemesanan as $key => $value):
									// status transaksi guduk status tok :v => 1 = belum siap 2 = sudah siap 3 = keluar 4 = kembali
							?>
                            <tr>
								<td class="font-size-lg font-weight-bold text-center">
                                    <a class="font-weight-bold text-underline" href="<?php echo base_url('admin/kelola_pemesanan/detail/'.$value->id_transaksi)?>">
                                    	<?php echo '#'.$value->id_transaksi ?>
                                    </a>
                                </td>
								<td class="font-size-lg"><?php echo $value->nama ?></td>
								<td class="font-size-lg text-center"><?php echo idDateFormat($value->tgl_pemesanan) ?></td>
								<td class="font-size-lg text-center"><?php echo idDateFormat($value->tgl_pengembalian) ?></td>
								<td class="font-size-lg text-right">Rp <?= number_format($value->total_harga, 0, ',', '.') ?></td>

                                <td class="align-top text-center">
									<?php if($value->status_transaksi == 1) : ?>
                                    	<a href="<?= base_url('admin/kelola/pemesanan/siap/'.$value->id_transaksi) ?>" class="btn btn-success">Barang Siap</a>
									<?php endif; ?>
                                </td>
							</tr>
							<?php $no++ ?>
                            <?php endforeach; ?>

                            </tbody>
                        </table>
                    </div> 
                </div>
            </div>
        </div>
    </div>
</div>
<?php $this->load->view('admin/footer'); ?>
