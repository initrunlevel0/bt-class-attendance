-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Inang: 127.0.0.1
-- Waktu pembuatan: 14 Mei 2014 pada 07.07
-- Versi Server: 5.5.27
-- Versi PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Basis data: `test`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `test_multi_sets`()
    DETERMINISTIC
begin
        select user() as first_col;
        select user() as first_col, now() as second_col;
        select user() as first_col, now() as second_col, now() as third_col;
        end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE IF NOT EXISTS `kelas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kelas` varchar(255) NOT NULL,
  `mulai` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `selesai` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `toleransi` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id`, `nama_kelas`, `mulai`, `selesai`, `toleransi`) VALUES
(1, 'Jaringan Nirkabel dan Komputasi Bergerak (B)', '2014-05-14 04:49:54', '2014-05-14 06:00:00', '2014-05-14 05:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE IF NOT EXISTS `mahasiswa` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `bt_addr` varchar(255) NOT NULL,
  `present` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `name`, `bt_addr`, `present`) VALUES
('000000000', 'Tidak Jelas', '00:00:00:00:00:00', '0000-00-00 00:00:00'),
('5110100043', 'M. SATRYO PRAMARHADI', 'CC:FA:00:0F:C5:FD', '0000-00-00 00:00:00'),
('5110100703', 'Muhammad Redha', '88:C6:63:C3:45:AE', '0000-00-00 00:00:00'),
('5111100012', 'Putu Wiramaswara Widya', '30:F3:1D:7F:C1:BC', '2014-05-14 05:04:05'),
('5111100028', 'Pande Putu Prana Pratistha', '00:1F:E2:EA:40:89', '0000-00-00 00:00:00'),
('5111100044', 'Dhimas Bagus Pramudya', 'C8:A0:30:58:EA:69', '0000-00-00 00:00:00'),
('5111100056', 'Herleeyandi Markoni', '00:26:CC:EA:7F:D2', '0000-00-00 00:00:00'),
('5111100073', 'Karsono Puguh Nindyo Cipto', '54:79:75:FD:87:F3', '2014-05-14 05:04:05');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
