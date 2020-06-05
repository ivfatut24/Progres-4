<?php
defined('BASEPATH') OR exit('No direct script access allowed');
$this->load->view('admin/header');
?>
<div class="container-fluid p-0">
<div class="row">
        <div class="col-lg-8 col-sm-8 col-12 d-lg-flex">
            <h1 class=" m-0 font-weight-light">Laporan penyewaan</h1>
            <div id="laporanRentang" class="ml-lg-2 mt-3 mt-lg-0 btn btn-icon-text p-2 bg-white rounded border">
                <i data-feather="calendar"></i>&nbsp;
                <span class="mx-2"></span> <i data-feather="chevron-down"></i>
            </div>
        </div>
        <div class="col-lg-4 col-sm-4 col-12 mt-3 mt-lg-0 text-lg-right text-sm-right">
              
            <a href="<?php echo '#'?>" class="btn-icon-text btn btn-brand">
                <i data-feather="file-text" class="align-middle"></i>
                <span class="ml-1 align-middle">Export Excel</span>
            </a>
        </div>
    </div>
    <div class="row mb-5">
        <div class="col-12">
            <span class="text-black-80"> 10 data</span>  
        </div>
    </div>
    <div class="row">
        <div class="col-lg-7 order-lg-1 order-2">
            <?php for($tor = 1; $tor <= 10; $tor++): ?>
            <div class="card mb-4">
                <div class="card-body">
                    <div class="row">
                        <div class="col-3">
                            <div class="text-black-60 mb-1-4 font-size-tiny text-uppercase">
                                No. Booking
                            </div>
                            <div class="text-black-100">
                                #<?php echo $tor?>
                            </div>
                            <div class="text-black-60 line-height-26 font-size-sm">
                                15 Mei 2020 00.18
                            </div>
                        </div>
                        <div class="col-9">
                            <div class="row">
                                <div class="col-lg-7">
                                    <div class="text-black-60 mb-1-4 font-size-tiny text-uppercase">
                                        Nama Customer
                                    </div>
                                    <div class="text-black-100">
                                        Retester PSO PT Anugerah Situbolon
                                    </div>
                                </div>
                                <div class="col-lg-5">
                                    <div class="text-black-60 mb-1-4 font-size-tiny text-uppercase">
                                        Tujuan
                                    </div>
                                    <div class="text-black-100">
                                        Acara Keluarga
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <?php endfor; ?>
        </div>
        <div class="col-lg-5 order-lg-2 order-1">
            <div class="card w-100">
                <div class="card-header">
                    <h5 class="card-title mb-0">Jumlah Pengunjung</h5>
                </div>
                <div class="card-body">
                    <div class="tabler-responsive">
                        <table class="table mb-0">
                            <thead>
                                <tr>
                                    <th>Tujuan</th>
                                    <th class="text-right">Jumlah</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><i data-feather="square" class="text-primary"></i> Pantai</td>
                                    <td class="text-right"> #Jumlah </td>
                                </tr>
                                <tr>
                                    <td><i data-feather="square" class="text-warning"></i> Gunung</td>
                                    <td class="text-right"> #Jumlah </td>
                                </tr>
                                <tr>
                                    <td><i data-feather="square" class="text-danger"></i> Camping Ground</td>
                                    <td class="text-right"> #Jumlah </td>
                                </tr>
                                <tr>
                                    <td><i data-feather="square" class="text-tertiary"></i> Sekolah</td>
                                    <td class="text-right"> #Jumlah </td>
                                </tr>
                                <tr>
                                    <td><i data-feather="square" class="text-red"></i> Lapangan</td>
                                    <td class="text-right"> #Jumlah </td>
                                </tr>
                                <tr>
                                    <td><i data-feather="square" class="text-yellow"></i> Event</td>
                                    <td class="text-right"> #Jumlah </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php $this->load->view('admin/footer'); ?>

