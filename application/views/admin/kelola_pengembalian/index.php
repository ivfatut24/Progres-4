<?php
defined('BASEPATH') OR exit('No direct script access allowed');
$this->load->view('admin/header');
?>
<div class="container-fluid p-0">
    <div class="row mb-3">
        <div class="col-lg-8 col-sm-8 col-12">
            <h1 class=" m-0 font-weight-light">Data Pengembalian</h1>
            <span class="text-black-80"> <?= '1'//count($data)?> data</span>
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
								// foreach ($pemesanan as $key => $value):
									// status transaksi guduk status tok :v => 1 = belum siap 2 = sudah siap 3 = keluar 4 = kembali
							?>
                            <tr>
								<td class="font-size-lg font-weight-bold text-center">
                                    <a class="font-weight-bold text-underline" href="#">
                                    	<?php echo '#'.$no ?>
                                    </a>
                                </td>
								<td class="font-size-lg"><?php echo 'Aca' ?></td>
								<td class="font-size-lg text-center"><?php echo '25 Mei 2020' ?></td>
								<td class="font-size-lg text-center"><?php echo '25 Mei 2020' ?></td>
								<td class="font-size-lg text-right">Rp <?= '168.000' ?></td>

                                <td class="align-top text-center">
									<?php //if($value->status_transaksi == 1) : ?>
                                    	<a data-toggle="modal" data-target="#exampleModal" href="#<?php // base_url('admin/kelola/pemesanan/siap/'.$value->id_transaksi) ?>" class="btn btn-outline-primary">Konfirmasi</a>
									<?php //endif; ?>
                                </td>
							</tr>
							<?php $no++ ?>
                            <?php //endforeach; ?>

                            </tbody>
                        </table>
                    </div> 
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
	aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Form Kondisi Barang</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="py-4">
					<div class="row mb-3">
						<div class="col-md-6">
							<label>Nama Customer</label>
							<div class="font-size-lg mb-0 text-black-100">Aca</div>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col-md-6">
							<label>Tujuan</label>
							<div class="font-size-lg mb-0 text-black-100">Event</div>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col-md-6 mb-3 mb-md-0">
							<label>Tanggal sewa</label>
							<div class="font-size-lg mb-0 text-black-100">25 Mei 2020</div>
						</div>
						<div class="col-md-6">
							<label>Tanggal pengembalian</label>
							<div class="font-size-lg mb-0 text-black-100">
								30 Mei 2020
							</div>
						</div>
					</div>
				</div>
				<hr>
				<div class="py-4">
					<h4>Pengembalian</h4>
					<div class="form-group">
						<label for="">Tanggal pengembalian</label>
						<input type="date" class="form-control">
					</div>
					<div class="form-group">
						<label for="">Kondisi Barang</label>
						<input type="text" class="form-control">
					</div>
					<div class="form-group">
						<label for="">Kondisi Barang</label>
						<div class="custom-controls-stacked pt-2">
							<label class="custom-control custom-radio custom-control-inline">
								<input value="baik" name="kondisiBarang" type="radio" class="custom-control-input">
								<span class="custom-control-label">Baik</span>
							</label>
							<label class="custom-control custom-radio custom-control-inline">
								<input value="rusak" name="kondisiBarang" type="radio" class="custom-control-input">
								<span class="custom-control-label">Rusak</span>
							</label>
						</div>
					</div>
                    <div class="kena-denda">
                        <h5>Denda</h5>
                        <div class="form-group">
                            <label for="">Keterangan</label>
                            <textarea placeholder="Keterangan denda" class="form-control"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="">Denda (Rp)</label>
                            <input type="number" class="form-control">
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
    $(".kena-denda").hide();
    $(".custom-control-input").on("change", function(){
        if($(this).val() == 'rusak'){

            $(".kena-denda").show();
        }else{

            $(".kena-denda").hide();
        }
    });
    });
</script>
<?php $this->load->view('admin/footer'); ?>
