-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 06, 2020 at 07:23 AM
-- Server version: 10.3.22-MariaDB-log-cll-lve
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rentalc1_igni526`
--

-- --------------------------------------------------------

--
-- Table structure for table `barangs`
--

CREATE TABLE `barangs` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(255) DEFAULT NULL,
  `harga_sewa` int(11) DEFAULT NULL,
  `deskripsi` mediumtext DEFAULT NULL,
  `gambar_barang` mediumtext DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `ukuran` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barangs`
--

INSERT INTO `barangs` (`id_barang`, `nama_barang`, `harga_sewa`, `deskripsi`, `gambar_barang`, `stok`, `ukuran`, `created_at`) VALUES
(1, 'Tenda Great Outdoor Flyair', 25000, 'untuk 2 orang', 'afa1a5e062c04b31fa0ac2eb4adf034d.jpg', 7, 'besar', '2020-06-05 07:52:10'),
(2, 'Tenda Great indoor', 25000, 'untuk 3 orang', 'cf45d796e05bcd519688fed66cb16515.jpg', 8, 'kecil', '2020-06-05 07:52:10'),
(3, 'Bestway Monodome Pavilio X2', 30000, 'untuk 1-2 orang', '05e2c3fc81212290a46d9062bce7dbf3.jpg', 8, 'kecil', '2020-06-05 08:23:28'),
(4, 'Great Outdoor Flyair', 20000, 'tenda', 'b5707d44fbe2b0a356cab845a5997159.jpg', 7, 'kecil', '2020-06-05 08:15:33');

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id_detail_transaksi` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `jumlah_barang` int(11) NOT NULL DEFAULT 1,
  `tgl_ditambahkan` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`id_detail_transaksi`, `id_transaksi`, `id_barang`, `jumlah_barang`, `tgl_ditambahkan`) VALUES
(1, 4, 3, 1, '2020-05-22 20:02:26'),
(2, 4, 4, 2, '2020-05-22 20:02:26'),
(3, 6, 1, 1, '2020-05-26 19:50:10'),
(4, 6, 3, 1, '2020-05-26 19:50:10'),
(5, 5, 1, 1, '2020-05-28 02:24:14'),
(6, 5, 4, 1, '2020-05-28 02:24:14'),
(7, 7, 3, 1, '2020-05-28 12:18:59'),
(8, 8, 3, 1, '2020-05-28 14:33:05'),
(9, 9, 1, 2, '2020-05-30 11:26:55'),
(10, 9, 2, 3, '2020-05-30 11:26:56'),
(11, 9, 3, 3, '2020-05-30 11:26:56'),
(12, 10, 4, 2, '2020-05-30 14:19:38'),
(13, 11, 4, 1, '2020-05-30 14:37:18'),
(14, 12, 3, 1, '2020-06-01 04:01:24'),
(15, 13, 2, 2, '2020-06-02 03:08:21'),
(16, 14, 2, 2, '2020-06-02 05:01:36'),
(17, 16, 2, 2, '2020-06-05 07:39:54'),
(18, 17, 4, 3, '2020-06-05 08:15:33'),
(19, 18, 3, 2, '2020-06-05 08:23:28');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `tgl_deadline` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL COMMENT '0 = belum\r\n1 = sudah\r\n2 = gagal/expired',
  `tgl_bayar` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `bukti_bayar` varchar(100) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_transaksi`, `tgl_deadline`, `status`, `tgl_bayar`, `bukti_bayar`, `is_verified`, `created_at`) VALUES
(3, 6, '2020-05-27 07:50:10', 1, '2020-05-26 21:37:17', 'f185566c6e3b729ec87a5978105eeabc.jpg', 0, '2020-05-26 19:50:10'),
(4, 5, '2020-05-28 14:24:15', 2, '2020-05-28 14:31:25', 'b621e127f0ad33074312d70e41320516.jpg', 0, '2020-05-28 02:24:15'),
(10, 12, '2020-06-01 16:01:24', 2, '2020-06-02 02:58:28', NULL, 1, '2020-06-01 04:01:24'),
(11, 13, '2020-06-02 15:08:21', 1, '2020-06-02 03:25:29', '42e980dcff5936c90cd48ea5eb294171.png', 0, '2020-06-02 03:08:21'),
(12, 14, '2020-06-02 17:01:36', 1, '2020-06-02 05:27:01', 'b6a1a3c52858a37c497a838f2e2bc677.png', 1, '2020-06-02 05:01:36'),
(13, 16, '2020-06-05 19:39:54', 1, '2020-06-05 07:56:46', 'e1a1d520b2270854db1561c5b1e6bc66.jpg', 1, '2020-06-05 07:39:54'),
(14, 17, '2020-06-05 20:15:33', 0, NULL, NULL, 0, '2020-06-05 08:15:33'),
(15, 18, '2020-06-05 20:23:28', 0, NULL, NULL, 0, '2020-06-05 08:23:28');

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian`
--

CREATE TABLE `pengembalian` (
  `idpengembalian` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `tanggalkembali` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `temp_detail_transaksi`
--

CREATE TABLE `temp_detail_transaksi` (
  `id_temp_detail_transaksi` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `jumlah_barang` int(11) NOT NULL DEFAULT 1,
  `tgl_ditambahkan` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `temp_detail_transaksi`
--

INSERT INTO `temp_detail_transaksi` (`id_temp_detail_transaksi`, `id_transaksi`, `id_barang`, `jumlah_barang`, `tgl_ditambahkan`) VALUES
(6, 1, 3, 5, '2020-05-18 02:22:48'),
(8, 3, 4, 1, '2020-05-19 10:45:53'),
(19, 15, 2, 0, '2020-06-02 05:18:41');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `status_transaksi` int(11) NOT NULL DEFAULT 0 COMMENT '0 = sementara\r\n1 = transaksi',
  `subtotal` bigint(20) DEFAULT NULL,
  `tgl_pemesanan` timestamp NULL DEFAULT NULL,
  `tgl_sewa` date DEFAULT NULL,
  `tgl_pengembalian` date DEFAULT NULL,
  `id_tujuan` int(11) DEFAULT NULL,
  `metode_pengambilan` varchar(100) DEFAULT NULL,
  `alamat_pengiriman` text DEFAULT NULL,
  `jarak` float DEFAULT NULL,
  `kode_kendaraan` int(11) DEFAULT NULL COMMENT '0=ambil sendir, 1=motor, 2=mobil',
  `biaya_pengiriman` int(11) DEFAULT NULL,
  `jaminan` varchar(100) DEFAULT NULL,
  `foto_jaminan` varchar(255) DEFAULT NULL,
  `no_identitas` varchar(50) DEFAULT NULL,
  `no_telp` varchar(20) DEFAULT NULL,
  `total_harga` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_user`, `status_transaksi`, `subtotal`, `tgl_pemesanan`, `tgl_sewa`, `tgl_pengembalian`, `id_tujuan`, `metode_pengambilan`, `alamat_pengiriman`, `jarak`, `kode_kendaraan`, `biaya_pengiriman`, `jaminan`, `foto_jaminan`, `no_identitas`, `no_telp`, `total_harga`) VALUES
(1, 5, 0, NULL, '0000-00-00 00:00:00', '2020-05-20', '2020-05-22', 1, 'Diambil', NULL, 0, 0, 0, 'KTP', '28173d6eec49cc44d36511b7269a0baf.png', '1231', '123213', 300000),
(3, 11, 0, 100000, '2020-05-20 08:09:40', '2020-05-20', '2020-05-22', 1, 'Dikirim', 'daasdasd', 0.6, 2, 4800, 'KTP', 'c8d79768f4e95f61425782c26062e943.png', '1231231', '23123', 104800),
(4, 8, 1, 300000, '2020-05-22 19:48:25', '2020-05-20', '2020-05-22', 1, 'Dikirim', 'Jalan kaliurang', 2.5, 2, 20000, 'KTP', 'b66539fcbc8d73a240fc700037ccfca9.jpg', '123', '213', 320000),
(5, 3, 1, 102222, '2020-05-28 02:23:52', '2020-05-29', '2020-05-30', 3, 'Dikirim', 'jl. senggani 27', 6.3, 2, 50400, 'Kartu Pelajar', '2050c169e4ee88bc8deac79c02ef911c.PNG', '12345678', '8677777', 152622),
(6, 8, 1, 102222, '2020-05-26 19:50:02', '2020-05-28', '2020-06-05', 5, 'Dikirim', 'jalan jalan', 6, 2, 48000, 'KTP', '14dddef21dc23b4d14acab51d022254a.jpg', '999', '321654', 150222),
(7, 3, 1, 100000, '2020-05-28 12:18:11', '2020-05-29', '2020-05-31', 2, 'Dikirim', 'polinema', 6.3, 2, 50400, 'KTP', '7b85db993db62a7403f3dfc2ff561120.jpg', '12345678', '5555555', 150400),
(8, 3, 1, 100000, '2020-05-28 14:32:48', '2020-05-31', '2020-06-01', 1, 'Diambil', NULL, 0, 2, 0, 'KTP', '52fd631a7a147eded936df26eb18e0e4.jpg', '12345678', '34567890', 100000),
(9, 3, 1, 215000, '2020-05-30 11:14:06', '2020-05-30', '2020-05-31', 1, 'Dikirim', 'v', 1.7, 2, 13600, 'KTP', 'fbf2f06556b05364565a035dde6810dc.jpg', '12345678', '12345678', 228600),
(10, 3, 1, 200000, '2020-05-30 14:19:15', '2020-05-31', '2020-06-01', 1, 'Dikirim', 'aaa', 1.7, 2, 13600, 'KTP', '356ce3a17b5a59d2deef7fa34edffe57.jpg', '12345678', '000000000', 213600),
(11, 3, 1, 100000, '2020-05-30 14:35:03', '2020-06-05', '2020-06-06', 1, 'Dikirim', 'aaaa', 1.5, 2, 12000, 'KTP', 'c874d4a9590cc210a23d171e64e07842.jpg', '12345678', '33333333', 112000),
(12, 3, 1, 30000, '2020-06-01 04:01:16', '2020-06-01', '2020-06-02', 1, 'Dikirim', 'aaaa', 1.1, 2, 8800, 'Kartu Pelajar', '9dd935284aa32a8f36e75194049714d2.png', '12345678', '444444', 38800),
(13, 3, 1, 50000, '2020-06-02 03:07:20', '2020-06-03', '2020-06-04', 1, 'Dikirim', 'Polinema', 1.3, 1, 5200, 'KTP', '7eb5916a2a6642a95dba24951361d0f0.png', '56789374942', '85755813231', 55200),
(14, 3, 1, 50000, '2020-06-02 04:42:55', '2020-06-05', '2020-06-07', 1, 'Dikirim', 'Jalan senggani 27, jatimulyo', 4.7, 1, 18800, 'KTP', '81d166c23dc81d9ead7bc8e5f6bd458f.png', '1731710083', '82233203907', 68800),
(15, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 3, 1, 100000, '2020-06-05 07:38:29', '2020-06-06', '2020-06-07', 1, 'Dikirim', 'hotel ibis malang', 1.6, 1, 6400, 'KTP', 'e5a45a8e854c2edc7e6e55c868a5c0f9.jpg', '56789374942', '4565456', 100000),
(17, 3, 1, 180000, '2020-06-05 08:15:19', '2020-06-08', '2020-06-11', 5, 'Dikirim', 'Hotel Iblis Malang', 1.6, 1, 6400, 'KTP', '9976d661e562987d8381228c22ccb420.jpg', '3456743532', '85755845654', 180000),
(18, 3, 1, 360000, '2020-06-05 08:23:22', '2020-06-12', '2020-06-14', 1, 'Dikirim', 'hotel ibis malang', 1.6, 1, 6400, 'KTP', '37d8d6e2cdef0a9642d4f136499ffaba.jpg', '56789374942', '2345678', 360000);

-- --------------------------------------------------------

--
-- Table structure for table `tujuan`
--

CREATE TABLE `tujuan` (
  `id` int(11) NOT NULL,
  `tujuan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tujuan`
--

INSERT INTO `tujuan` (`id`, `tujuan`) VALUES
(1, 'pantai'),
(2, 'gunung'),
(3, 'camping ground'),
(4, 'sekolah'),
(5, 'lapangan'),
(6, 'event');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` text DEFAULT NULL,
  `no_telp` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `nama`, `alamat`, `no_telp`, `email`, `username`, `password`, `level`, `created_at`, `update_at`) VALUES
(1, 'admin', '', '', '', 'admin', '21232f297a57a5a743894a0e4a801fc3', 0, '2020-06-05 07:50:13', '0000-00-00 00:00:00'),
(2, 'bayu', 'malang', '2147483647', 'bayu@gamil.com', 'bayu', 'a430e06de5ce438d499c2e4063d60fd6', 1, '2020-06-05 07:50:13', '0000-00-00 00:00:00'),
(3, 'ivfa', 'malang', '2147483647', 'ivfatut@gmail.com', 'ivfa', 'e70c7e007a4fb1f0781da38df3319235', 1, '2020-06-05 07:50:13', '0000-00-00 00:00:00'),
(4, 'mila', 'malang', '2147483647', 'mila@gmail.com', 'mila', '38cb862715ae650d05f745edfe66576a', 2, '2020-06-05 07:50:13', '0000-00-00 00:00:00'),
(5, 'dewi', 'malng', '2147483647', 'dewiina@gmail.com', 'dewi', 'ed1d859c50262701d92e5cbf39652792', 2, '2020-06-05 07:50:13', '0000-00-00 00:00:00'),
(12, 'Surya Adli', NULL, '82233203907', 'faulia98@gmail.com', 'surya', 'surya', 0, '2020-06-05 07:50:13', '0000-00-00 00:00:00'),
(13, 'ade', NULL, '77775555', 'ade@gmail.com', 'ade', 'a562cfa07c2b1213b3a5c99b756fc206', 1, '2020-06-05 07:50:13', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barangs`
--
ALTER TABLE `barangs`
  ADD PRIMARY KEY (`id_barang`),
  ADD UNIQUE KEY `barang_pk` (`id_barang`);

--
-- Indexes for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id_detail_transaksi`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD UNIQUE KEY `pembayaran_pk` (`id_pembayaran`),
  ADD KEY `dapat_fk` (`id_transaksi`);

--
-- Indexes for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`idpengembalian`),
  ADD UNIQUE KEY `pengembalian_pk` (`idpengembalian`),
  ADD KEY `dapat_fk` (`id_user`);

--
-- Indexes for table `temp_detail_transaksi`
--
ALTER TABLE `temp_detail_transaksi`
  ADD PRIMARY KEY (`id_temp_detail_transaksi`),
  ADD KEY `id_transaksi` (`id_transaksi`,`id_barang`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_tujuan` (`id_tujuan`);

--
-- Indexes for table `tujuan`
--
ALTER TABLE `tujuan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barangs`
--
ALTER TABLE `barangs`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `id_detail_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `temp_detail_transaksi`
--
ALTER TABLE `temp_detail_transaksi`
  MODIFY `id_temp_detail_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tujuan`
--
ALTER TABLE `tujuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
