-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2017 at 11:57 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `deliveryonline`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `ID_CUSTOMER` varchar(10) NOT NULL,
  `ID_USER` varchar(10) DEFAULT NULL,
  `NAMA_CUS` varchar(50) DEFAULT NULL,
  `ALAMAT_CUS` varchar(50) DEFAULT NULL,
  `EMAIL_CUS` varchar(30) DEFAULT NULL,
  `NO_HP_CUS` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`ID_CUSTOMER`, `ID_USER`, `NAMA_CUS`, `ALAMAT_CUS`, `EMAIL_CUS`, `NO_HP_CUS`) VALUES
('1', '3', 'b', 'b', 'b', 1);

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `ID_DRIVER` varchar(10) NOT NULL,
  `ID_PEMESANAN` varchar(10) DEFAULT NULL,
  `ID_USER` varchar(10) DEFAULT NULL,
  `NAMA_DRI` varchar(50) DEFAULT NULL,
  `ALAMAT_DRI` varchar(50) DEFAULT NULL,
  `EMAIL_DRI` varchar(30) DEFAULT NULL,
  `NO_HP_DRI` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`ID_DRIVER`, `ID_PEMESANAN`, `ID_USER`, `NAMA_DRI`, `ALAMAT_DRI`, `EMAIL_DRI`, `NO_HP_DRI`) VALUES
('1', NULL, '2', 'a', 'a', 'a', 1);

-- --------------------------------------------------------

--
-- Table structure for table `makanan`
--

CREATE TABLE `makanan` (
  `ID_MAKANAN` varchar(10) NOT NULL,
  `ID_WARUNG` varchar(10) DEFAULT NULL,
  `NAMA_MAK` varchar(30) DEFAULT NULL,
  `HARGA_MAK` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `makanan`
--

INSERT INTO `makanan` (`ID_MAKANAN`, `ID_WARUNG`, `NAMA_MAK`, `HARGA_MAK`) VALUES
('1', '1', 'g', 'g');

-- --------------------------------------------------------

--
-- Table structure for table `memilih`
--

CREATE TABLE `memilih` (
  `ID_MAKANAN` varchar(10) NOT NULL,
  `ID_PEMESANAN` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan`
--

CREATE TABLE `pemesanan` (
  `ID_PEMESANAN` varchar(10) NOT NULL,
  `ID_CUSTOMER` varchar(10) DEFAULT NULL,
  `ID_DRIVER` varchar(10) DEFAULT NULL,
  `ID_WARUNG` varchar(10) DEFAULT NULL,
  `TGL_PESAN` date DEFAULT NULL,
  `KET_PESAN` int(11) DEFAULT NULL,
  `TOTAL_PESAN` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pemesanan`
--

INSERT INTO `pemesanan` (`ID_PEMESANAN`, `ID_CUSTOMER`, `ID_DRIVER`, `ID_WARUNG`, `TGL_PESAN`, `KET_PESAN`, `TOTAL_PESAN`) VALUES
('1', '1', '1', '1', '2017-04-06', 1, '1');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID_USER` varchar(10) NOT NULL,
  `ID_WARUNG` varchar(10) DEFAULT NULL,
  `ID_DRIVER` varchar(10) DEFAULT NULL,
  `ID_CUSTOMER` varchar(10) DEFAULT NULL,
  `USERNAME` varchar(30) DEFAULT NULL,
  `PASSWORD` varchar(20) DEFAULT NULL,
  `LEVEL` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID_USER`, `ID_WARUNG`, `ID_DRIVER`, `ID_CUSTOMER`, `USERNAME`, `PASSWORD`, `LEVEL`) VALUES
('1', NULL, NULL, NULL, 'w', 'w', 'w'),
('2', NULL, NULL, NULL, 'p', 'p', 'p'),
('3', NULL, NULL, NULL, 'q', 'q', 'q');

-- --------------------------------------------------------

--
-- Table structure for table `warung`
--

CREATE TABLE `warung` (
  `ID_WARUNG` varchar(10) NOT NULL,
  `ID_USER` varchar(10) DEFAULT NULL,
  `NAMA_WAR` varchar(50) DEFAULT NULL,
  `ALAMAT_WAR` varchar(50) DEFAULT NULL,
  `KONTAK_WAR` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `warung`
--

INSERT INTO `warung` (`ID_WARUNG`, `ID_USER`, `NAMA_WAR`, `ALAMAT_WAR`, `KONTAK_WAR`) VALUES
('1', '1', 'w', 'w', 'w');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID_CUSTOMER`),
  ADD KEY `FK_PUNYAI1` (`ID_USER`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`ID_DRIVER`),
  ADD KEY `FK_MENGAMBIL` (`ID_PEMESANAN`),
  ADD KEY `FK_PUNYA` (`ID_USER`);

--
-- Indexes for table `makanan`
--
ALTER TABLE `makanan`
  ADD PRIMARY KEY (`ID_MAKANAN`),
  ADD KEY `FK_MENYEDIAKAN` (`ID_WARUNG`);

--
-- Indexes for table `memilih`
--
ALTER TABLE `memilih`
  ADD PRIMARY KEY (`ID_MAKANAN`,`ID_PEMESANAN`),
  ADD KEY `FK_MEMILIH2` (`ID_PEMESANAN`);

--
-- Indexes for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`ID_PEMESANAN`),
  ADD KEY `FK_MELAKUKAN` (`ID_CUSTOMER`),
  ADD KEY `FK_MEMBERI` (`ID_WARUNG`),
  ADD KEY `FK_MENGAMBIL2` (`ID_DRIVER`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID_USER`),
  ADD KEY `FK_PUNYA2` (`ID_DRIVER`),
  ADD KEY `FK_PUNYA4` (`ID_WARUNG`),
  ADD KEY `FK_PUNYAI2` (`ID_CUSTOMER`);

--
-- Indexes for table `warung`
--
ALTER TABLE `warung`
  ADD PRIMARY KEY (`ID_WARUNG`),
  ADD KEY `FK_PUNYA3` (`ID_USER`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `FK_PUNYAI1` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`);

--
-- Constraints for table `driver`
--
ALTER TABLE `driver`
  ADD CONSTRAINT `FK_MENGAMBIL` FOREIGN KEY (`ID_PEMESANAN`) REFERENCES `pemesanan` (`ID_PEMESANAN`),
  ADD CONSTRAINT `FK_PUNYA` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`);

--
-- Constraints for table `makanan`
--
ALTER TABLE `makanan`
  ADD CONSTRAINT `FK_MENYEDIAKAN` FOREIGN KEY (`ID_WARUNG`) REFERENCES `warung` (`ID_WARUNG`);

--
-- Constraints for table `memilih`
--
ALTER TABLE `memilih`
  ADD CONSTRAINT `FK_MEMILIH` FOREIGN KEY (`ID_MAKANAN`) REFERENCES `makanan` (`ID_MAKANAN`),
  ADD CONSTRAINT `FK_MEMILIH2` FOREIGN KEY (`ID_PEMESANAN`) REFERENCES `pemesanan` (`ID_PEMESANAN`);

--
-- Constraints for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD CONSTRAINT `FK_MELAKUKAN` FOREIGN KEY (`ID_CUSTOMER`) REFERENCES `customer` (`ID_CUSTOMER`),
  ADD CONSTRAINT `FK_MEMBERI` FOREIGN KEY (`ID_WARUNG`) REFERENCES `warung` (`ID_WARUNG`),
  ADD CONSTRAINT `FK_MENGAMBIL2` FOREIGN KEY (`ID_DRIVER`) REFERENCES `driver` (`ID_DRIVER`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_PUNYA2` FOREIGN KEY (`ID_DRIVER`) REFERENCES `driver` (`ID_DRIVER`),
  ADD CONSTRAINT `FK_PUNYA4` FOREIGN KEY (`ID_WARUNG`) REFERENCES `warung` (`ID_WARUNG`),
  ADD CONSTRAINT `FK_PUNYAI2` FOREIGN KEY (`ID_CUSTOMER`) REFERENCES `customer` (`ID_CUSTOMER`);

--
-- Constraints for table `warung`
--
ALTER TABLE `warung`
  ADD CONSTRAINT `FK_PUNYA3` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
