DROP DATABASE IF EXISTS `tifosi`;
CREATE DATABASE `tifosi` CHARACTER SET  utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `tifosi`;

CREATE USER IF NOT EXISTS `tifosi`@`localhost` IDENTIFIED BY 'tifosi2026';
GRANT ALL PRIVILEGES ON tifosi.* TO 'tifosi'@'localhost';
