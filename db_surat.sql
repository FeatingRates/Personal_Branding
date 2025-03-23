-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 10, 2025 at 02:00 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_surat`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_surat`
--

CREATE TABLE `detail_surat` (
  `nomor_surat` varchar(255) NOT NULL,
  `id_jenis_surat` int NOT NULL,
  `judul_surat` varchar(255) NOT NULL,
  `tanggal_pengajuan` date NOT NULL,
  `tanggal_surat_dibuat` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `detail_surat`
--

INSERT INTO `detail_surat` (`nomor_surat`, `id_jenis_surat`, `judul_surat`, `tanggal_pengajuan`, `tanggal_surat_dibuat`) VALUES
('001/TE/TRPL/2025', 1, 'Tim Teaching Prodi TRPL', '2025-02-28', '2025-03-11'),
('002/TM/TRPL/2025', 1, 'Tim Manpro TRPL', '2025-03-06', '2025-03-09');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_surat`
--

CREATE TABLE `jenis_surat` (
  `id_jenis_surat` int NOT NULL,
  `nama_jenis_surat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jenis_surat`
--

INSERT INTO `jenis_surat` (`id_jenis_surat`, `nama_jenis_surat`) VALUES
(1, 'Surat Tugas'),
(2, 'Surat Izin'),
(3, 'Surat Keputusan');

-- --------------------------------------------------------

--
-- Table structure for table `keanggotaan`
--

CREATE TABLE `keanggotaan` (
  `id_keanggotaan` int NOT NULL,
  `nomor_surat` varchar(255) NOT NULL,
  `nik_pegawai` int NOT NULL,
  `role` enum('ketua','anggota') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `keanggotaan`
--

INSERT INTO `keanggotaan` (`id_keanggotaan`, `nomor_surat`, `nik_pegawai`, `role`) VALUES
(1, '001/TE/TRPL/2025', 113135, 'ketua'),
(2, '001/TE/TRPL/2025', 113136, 'anggota'),
(3, '001/TE/TRPL/2025', 113137, 'anggota'),
(4, '001/TE/TRPL/2025', 113138, 'anggota'),
(5, '001/TE/TRPL/2025', 113139, 'anggota');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `nik_pegawai` int NOT NULL,
  `id_unit` int NOT NULL,
  `nama_pegawai` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`nik_pegawai`, `id_unit`, `nama_pegawai`, `role`, `password`) VALUES
(113135, 1, 'Supardianto', 'KPS TRPL', ''),
(113136, 1, 'DIka', 'Dosen TRPL', ''),
(113137, 1, 'Fahri', 'Dosen TRPL', ''),
(113138, 1, 'Gilang', 'Dosen TRPL', ''),
(113139, 1, 'Ali', 'Dosen TRPL', ''),
(113140, 2, 'herman', 'Dosen TRPL', '1');

-- --------------------------------------------------------

--
-- Table structure for table `status_surat`
--

CREATE TABLE `status_surat` (
  `id_status_surat` int NOT NULL,
  `nomor_surat` varchar(255) NOT NULL,
  `status_surat` enum('Diajukan','Diproses','Disetujui','Ditolak') NOT NULL,
  `tanggal_rilis` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `status_surat`
--

INSERT INTO `status_surat` (`id_status_surat`, `nomor_surat`, `status_surat`, `tanggal_rilis`) VALUES
(1, '001/TE/TRPL/2025', 'Diproses', '0000-00-00'),
(2, '002/TM/TRPL/2025', 'Ditolak', '2025-03-20');

-- --------------------------------------------------------

--
-- Table structure for table `unit_pegawai`
--

CREATE TABLE `unit_pegawai` (
  `id_unit` int NOT NULL,
  `nama_unit` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `unit_pegawai`
--

INSERT INTO `unit_pegawai` (`id_unit`, `nama_unit`) VALUES
(1, 'Jurusan Teknik Informatika'),
(2, 'Jurusan Teknik Elektro'),
(3, 'Jurusan Teknik Mesin'),
(4, 'Jurusan Manajemen Bisnis');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_surat`
--
ALTER TABLE `detail_surat`
  ADD PRIMARY KEY (`nomor_surat`),
  ADD KEY `id_jenis_surat` (`id_jenis_surat`);

--
-- Indexes for table `jenis_surat`
--
ALTER TABLE `jenis_surat`
  ADD PRIMARY KEY (`id_jenis_surat`);

--
-- Indexes for table `keanggotaan`
--
ALTER TABLE `keanggotaan`
  ADD PRIMARY KEY (`id_keanggotaan`),
  ADD KEY `nik_pegawai` (`nik_pegawai`),
  ADD KEY `nomor_surat` (`nomor_surat`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`nik_pegawai`),
  ADD KEY `id_unit` (`id_unit`);

--
-- Indexes for table `status_surat`
--
ALTER TABLE `status_surat`
  ADD PRIMARY KEY (`id_status_surat`),
  ADD KEY `nomor_surat` (`nomor_surat`);

--
-- Indexes for table `unit_pegawai`
--
ALTER TABLE `unit_pegawai`
  ADD PRIMARY KEY (`id_unit`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jenis_surat`
--
ALTER TABLE `jenis_surat`
  MODIFY `id_jenis_surat` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `keanggotaan`
--
ALTER TABLE `keanggotaan`
  MODIFY `id_keanggotaan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `status_surat`
--
ALTER TABLE `status_surat`
  MODIFY `id_status_surat` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `unit_pegawai`
--
ALTER TABLE `unit_pegawai`
  MODIFY `id_unit` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_surat`
--
ALTER TABLE `detail_surat`
  ADD CONSTRAINT `detail_surat_ibfk_2` FOREIGN KEY (`id_jenis_surat`) REFERENCES `jenis_surat` (`id_jenis_surat`);

--
-- Constraints for table `keanggotaan`
--
ALTER TABLE `keanggotaan`
  ADD CONSTRAINT `keanggotaan_ibfk_1` FOREIGN KEY (`nik_pegawai`) REFERENCES `pegawai` (`nik_pegawai`),
  ADD CONSTRAINT `keanggotaan_ibfk_2` FOREIGN KEY (`nomor_surat`) REFERENCES `detail_surat` (`nomor_surat`);

--
-- Constraints for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `pegawai_ibfk_1` FOREIGN KEY (`id_unit`) REFERENCES `unit_pegawai` (`id_unit`);

--
-- Constraints for table `status_surat`
--
ALTER TABLE `status_surat`
  ADD CONSTRAINT `status_surat_ibfk_1` FOREIGN KEY (`nomor_surat`) REFERENCES `detail_surat` (`nomor_surat`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
