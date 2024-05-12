-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Bulan Mei 2024 pada 04.30
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `absensi_karyawan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `building`
--

CREATE TABLE `building` (
  `building_id` int(8) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` varchar(100) NOT NULL,
  `building_scanner` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `building`
--

INSERT INTO `building` (`building_id`, `code`, `name`, `address`, `building_scanner`) VALUES
(6, 'SWZSF/2021', 'Dinas Penanaman Modal dan Pelayanan Perizinan Terpadu Satu Pintu  Binjai', 'Jln. Jambi No.3 Kelurahan Rambung Barat - Kecamatan Binjai Selatan', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `employees_code` varchar(20) NOT NULL,
  `employees_email` varchar(30) NOT NULL,
  `employees_password` varchar(100) NOT NULL,
  `employees_name` varchar(50) NOT NULL,
  `position_id` int(5) NOT NULL,
  `shift_id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `created_login` datetime NOT NULL,
  `created_cookies` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `employees`
--

INSERT INTO `employees` (`id`, `employees_code`, `employees_email`, `employees_password`, `employees_name`, `position_id`, `shift_id`, `building_id`, `photo`, `created_login`, `created_cookies`) VALUES
(20, 'wagon', 'wandi@mail.com', '008a48e368bc6dfd5f976c8d9e355d94e7d03ac5cfbcea3a7b193ff0f7a57ba9', 'Riswandi', 1, 5, 5, '2021-10-109f0896e40bc145d041401356da285b00.jpg', '2021-10-10 21:03:02', '30f1e2e1cd52c47ec4a5e91c91e2383e'),
(25, 'OM001-2024', 'orangpapuamanis@gmail.com', 'cd3338fcce8e72320630c8edb389726245d2cfe43873003cf45aa3733362f53d', 'Fariz Ramlan, CAT., MFTA.', 2, 5, 6, 'OM001-2024-5cf31695af21e1a51a59e4b3bf2147ed-1933-.jpg', '2024-05-11 19:27:45', '4a4b81d45f692c030128be3fdff9597f'),
(26, 'OM001-2024', 'orangmanis@gmail.com', 'cd3338fcce8e72320630c8edb389726245d2cfe43873003cf45aa3733362f53d', 'Orang Manis', 7, 3, 6, '', '2024-05-11 19:27:45', '4a4b81d45f692c030128be3fdff9597f');

-- --------------------------------------------------------

--
-- Struktur dari tabel `position`
--

CREATE TABLE `position` (
  `position_id` int(5) NOT NULL,
  `position_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `position`
--

INSERT INTO `position` (`position_id`, `position_name`) VALUES
(1, 'STAFF'),
(2, 'ACCOUNTING'),
(7, 'MANAGER');

-- --------------------------------------------------------

--
-- Struktur dari tabel `presence`
--

CREATE TABLE `presence` (
  `presence_id` int(11) NOT NULL,
  `employees_id` int(11) NOT NULL,
  `presence_date` date NOT NULL,
  `time_in` time NOT NULL,
  `time_out` time NOT NULL,
  `picture_in` varchar(150) NOT NULL,
  `picture_out` varchar(150) NOT NULL,
  `present_id` int(11) NOT NULL COMMENT 'Masuk,Pulang,Tidak Hadir',
  `presence_address` text NOT NULL,
  `information` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `presence`
--

INSERT INTO `presence` (`presence_id`, `employees_id`, `presence_date`, `time_in`, `time_out`, `picture_in`, `picture_out`, `present_id`, `presence_address`, `information`) VALUES
(26, 12, '2021-06-26', '05:05:00', '11:05:00', 'sari-murni-in-2021-06-26-12.jpg', 'sari-murni-out-2021-06-26-12.jpg', 1, '-1.4851831,102.43805809999999', ''),
(27, 12, '2021-06-30', '23:37:00', '00:00:00', 'sari-murni-in-2021-06-30-12.jpg', '', 1, '-1.4851831,102.43805809999999', ''),
(28, 18, '2021-06-30', '23:42:00', '00:00:00', 'juki--in-2021-06-30-18.jpg', '', 1, '-1.4851831,102.43805809999999', ''),
(29, 19, '2021-10-09', '22:51:00', '23:01:00', 'ilor-in-2021-10-09-19.jpg', 'ilor-out-2021-10-09-19.jpg', 2, '3.588096,98.6710016', ''),
(30, 20, '2021-10-10', '19:37:00', '19:38:00', 'riswandi-in-2021-10-10-20.jpg', 'riswandi-out-2021-10-10-20.jpg', 1, '0.5070677,101.4477793', ''),
(31, 21, '2021-10-10', '20:05:00', '20:05:00', 'ilor-in-2021-10-10-21.jpg', 'ilor-out-2021-10-10-21.jpg', 1, '0.5070677,101.4477793', ''),
(32, 23, '2021-10-10', '20:27:00', '21:03:00', 'gading-in-2021-10-10-23.jpg', 'gading-out-2021-10-10-23.jpg', 1, '0.5070677,101.4477793', ''),
(33, 24, '2021-10-10', '21:15:00', '21:15:00', 'yan-in-2021-10-10-24.jpg', 'yan-out-2021-10-10-24.jpg', 3, '0.5070677,101.4477793', 'llllllllllllllllllllllllllllllllllllllllllll'),
(34, 25, '2024-05-09', '14:06:00', '15:47:00', 'orang-papua-manis-in-2024-05-09-25.jpg', 'orang-papua-manis-out-2024-05-09-25.jpg', 1, '-5.1544064,119.4426368', ''),
(35, 25, '2024-05-10', '11:13:00', '15:05:00', 'orang-papua-manis-in-2024-05-10-25.jpg', 'orang-papua-manis-out-2024-05-10-25.jpg', 1, '-5.1675136,119.4426368', ''),
(36, 25, '2024-05-11', '12:40:00', '15:35:00', 'orang-papua-manis-in-2024-05-11-25.jpg', 'orang-papua-manis-out-2024-05-11-25.jpg', 1, '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `present_status`
--

CREATE TABLE `present_status` (
  `present_id` int(6) NOT NULL,
  `present_name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `present_status`
--

INSERT INTO `present_status` (`present_id`, `present_name`) VALUES
(1, 'Hadir'),
(2, 'Sakit'),
(3, 'Izin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `shift`
--

CREATE TABLE `shift` (
  `shift_id` int(11) NOT NULL,
  `shift_name` varchar(20) NOT NULL,
  `time_in` time NOT NULL,
  `time_out` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `shift`
--

INSERT INTO `shift` (`shift_id`, `shift_name`, `time_in`, `time_out`) VALUES
(3, 'SHIFT SIANG', '13:00:00', '17:00:00'),
(4, 'SHIFT PAGI', '07:00:00', '11:00:00'),
(5, 'FULL TIME', '07:00:00', '06:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `site`
--

CREATE TABLE `site` (
  `site_id` int(4) NOT NULL,
  `site_url` varchar(100) NOT NULL,
  `site_name` varchar(50) NOT NULL,
  `site_phone` char(12) NOT NULL,
  `site_address` text NOT NULL,
  `site_description` text NOT NULL,
  `site_logo` varchar(50) NOT NULL,
  `site_email` varchar(30) NOT NULL,
  `site_email_domain` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `site`
--

INSERT INTO `site` (`site_id`, `site_url`, `site_name`, `site_phone`, `site_address`, `site_description`, `site_logo`, `site_email`, `site_email_domain`) VALUES
(1, 'http://localhost/absensi_karyawan', 'ABSENSI DARING DPMPPTSP', '082274315641', 'Jln. Jambi No.3 Kelurahan Rambung Barat - Kecamatan Binjai Selatan', 'Aplikasi Sistem Absensi Daring Dinas Penanaman Modal dan Pelayanan Perizinan Terpadu Satu Pintu (DPMPPTSP) Berbasis Web', 'logotranspng.png', 'chairulazhar@gmail.com', 'dpmpptsp.binjai@gmail.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_keluar`
--

CREATE TABLE `surat_keluar` (
  `id` int(11) NOT NULL,
  `nomor_surat` varchar(500) NOT NULL,
  `tujuan` varchar(500) NOT NULL,
  `tanggal_surat` date NOT NULL,
  `perihal` varchar(500) NOT NULL,
  `file_surat` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `surat_keluar`
--

INSERT INTO `surat_keluar` (`id`, `nomor_surat`, `tujuan`, `tanggal_surat`, `perihal`, `file_surat`) VALUES
(3, 'OAKIW1121E', 'Fariz Ramlan, CAT., MFTA.', '2024-05-31', 'Let me cook something', '3615-6830-1-SM.pdf'),
(12, 'OAKIW1121E', 'Fariz Ramlan, CAT., MFTA.', '2024-05-18', 'Menggoreng', 'DOC-20240506-WA0003. (1).pdf');

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_masuk`
--

CREATE TABLE `surat_masuk` (
  `id` int(11) NOT NULL,
  `nomor_surat` varchar(50) NOT NULL,
  `tanggal_surat` date NOT NULL,
  `tanggal_terima` date NOT NULL,
  `asal_surat` varchar(500) NOT NULL,
  `perihal` varchar(255) NOT NULL,
  `file_surat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `surat_masuk`
--

INSERT INTO `surat_masuk` (`id`, `nomor_surat`, `tanggal_surat`, `tanggal_terima`, `asal_surat`, `perihal`, `file_surat`) VALUES
(15, 'OAKIW1121E', '2024-05-11', '2024-05-18', 'PT. PENTINGNYA TELAH MEMILIKIMU', 'GORENG', '6-Article Text-13-1-10-20220428.pdf');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tanggal`
--

CREATE TABLE `tanggal` (
  `tanggal_kegiatan` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(40) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `fullname` varchar(40) NOT NULL,
  `registered` datetime NOT NULL,
  `created_login` datetime NOT NULL,
  `last_login` datetime NOT NULL,
  `session` varchar(100) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `browser` varchar(30) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`user_id`, `username`, `email`, `password`, `fullname`, `registered`, `created_login`, `last_login`, `session`, `ip`, `browser`, `level`) VALUES
(1, 'admin', 'admin@mail.com', '88b3340abaa6acbf87abe45f68fa8960224c1e36f6a96433bcbc490c84c9c6d2', 'ADMIN', '2021-10-07 10:22:00', '2024-05-10 14:08:18', '2024-05-10 19:41:27', '-', '1', 'Google Crome', 1),
(3, 'operator', 'operator@mail.com', 'c0fc26e449ec10285f6b28a7f92b91dc4497af26dbf02aade5bd798c567390dc', 'OPERATOR', '2021-10-07 22:46:00', '2021-10-10 21:07:58', '2021-10-10 21:08:35', '-', '1', 'Google Crome', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_level`
--

CREATE TABLE `user_level` (
  `level_id` int(4) NOT NULL,
  `level_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user_level`
--

INSERT INTO `user_level` (`level_id`, `level_name`) VALUES
(1, 'Administrator'),
(2, 'Operator');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `building`
--
ALTER TABLE `building`
  ADD PRIMARY KEY (`building_id`);

--
-- Indeks untuk tabel `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`position_id`);

--
-- Indeks untuk tabel `presence`
--
ALTER TABLE `presence`
  ADD PRIMARY KEY (`presence_id`);

--
-- Indeks untuk tabel `present_status`
--
ALTER TABLE `present_status`
  ADD PRIMARY KEY (`present_id`);

--
-- Indeks untuk tabel `shift`
--
ALTER TABLE `shift`
  ADD PRIMARY KEY (`shift_id`);

--
-- Indeks untuk tabel `site`
--
ALTER TABLE `site`
  ADD PRIMARY KEY (`site_id`);

--
-- Indeks untuk tabel `surat_keluar`
--
ALTER TABLE `surat_keluar`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `surat_masuk`
--
ALTER TABLE `surat_masuk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indeks untuk tabel `user_level`
--
ALTER TABLE `user_level`
  ADD PRIMARY KEY (`level_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `building`
--
ALTER TABLE `building`
  MODIFY `building_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `position`
--
ALTER TABLE `position`
  MODIFY `position_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `presence`
--
ALTER TABLE `presence`
  MODIFY `presence_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT untuk tabel `present_status`
--
ALTER TABLE `present_status`
  MODIFY `present_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `shift`
--
ALTER TABLE `shift`
  MODIFY `shift_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `site`
--
ALTER TABLE `site`
  MODIFY `site_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `surat_keluar`
--
ALTER TABLE `surat_keluar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `surat_masuk`
--
ALTER TABLE `surat_masuk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `user_level`
--
ALTER TABLE `user_level`
  MODIFY `level_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
