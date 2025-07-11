-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2025 at 03:14 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kitatulis`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_detailtransaksi`
--

CREATE TABLE `tbl_detailtransaksi` (
  `id_detail` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga_satuan` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_detailtransaksi`
--

INSERT INTO `tbl_detailtransaksi` (`id_detail`, `id_transaksi`, `nama_produk`, `harga_satuan`, `qty`, `subtotal`) VALUES
(1, 1, 'Pulpen', 6000, 10, 60000),
(2, 2, 'Kertas Folio', 500, 10, 5000),
(3, 3, 'Pulpen', 6000, 2, 12000),
(4, 3, 'Kertas Folio', 500, 5, 2500);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_produk`
--

CREATE TABLE `tbl_produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `stok` int(11) NOT NULL,
  `harga` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_produk`
--

INSERT INTO `tbl_produk` (`id_produk`, `nama_produk`, `kategori`, `stok`, `harga`) VALUES
(1, 'Pulpen', 'Alat Tulis', 20, 6000),
(2, 'Kertas Folio', 'Kertas', 100, 500);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_supplier`
--

CREATE TABLE `tbl_supplier` (
  `id_supplier` int(11) NOT NULL,
  `nama_supplier` varchar(100) NOT NULL,
  `alamat` text DEFAULT NULL,
  `telepon` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_supplier`
--

INSERT INTO `tbl_supplier` (`id_supplier`, `nama_supplier`, `alamat`, `telepon`) VALUES
(1, 'CV Project Wahyu', 'Jl. Raya Visual No.23', '081234567890');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaksi`
--

CREATE TABLE `tbl_transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `total_bayar` int(11) NOT NULL,
  `uang_bayar` int(11) NOT NULL,
  `kembalian` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_transaksi`
--

INSERT INTO `tbl_transaksi` (`id_transaksi`, `tanggal`, `total_bayar`, `uang_bayar`, `kembalian`) VALUES
(1, '2025-07-09', 60000, 100000, 40000),
(2, '2025-07-09', 5000, 10000, 5000),
(3, '2025-07-09', 14500, 20000, 5500);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` enum('admin','petugas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id_user`, `username`, `password`, `role`) VALUES
(1, 'admin', '0192023a7bbd73250516f069df18b500', 'admin'),
(2, 'petugas', '570c396b3fc856eceb8aa7357f32af1a', 'petugas');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_detailtransaksi`
--
ALTER TABLE `tbl_detailtransaksi`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_transaksi` (`id_transaksi`);

--
-- Indexes for table `tbl_produk`
--
ALTER TABLE `tbl_produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indexes for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_detailtransaksi`
--
ALTER TABLE `tbl_detailtransaksi`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_produk`
--
ALTER TABLE `tbl_produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_detailtransaksi`
--
ALTER TABLE `tbl_detailtransaksi`
  ADD CONSTRAINT `tbl_detailtransaksi_ibfk_1` FOREIGN KEY (`id_transaksi`) REFERENCES `tbl_transaksi` (`id_transaksi`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
