DROP DATABASE IF EXISTS `tifosi`;
CREATE DATABASE `tifosi` CHARACTER SET  utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `tifosi`;

CREATE USER IF NOT EXISTS `tifosi`@`localhost` IDENTIFIED BY 'tifosi2026';
GRANT ALL PRIVILEGES ON tifosi.* TO 'tifosi'@'localhost';

CREATE TABLE IF NOT EXISTS `ingredient`(
    `id_ingredient` INT NOT NULL AUTO_INCREMENT,
    `name_ingredient` VARCHAR (50) NOT NULL UNIQUE,
    PRIMARY KEY (`id_ingredient`)
);

CREATE TABLE IF NOT EXISTS `focaccia`(
    `id_focaccia` INT NOT NULL AUTO_INCREMENT,
    `name_focaccia` VARCHAR(50) NOT NULL,
    `price_focaccia` DECIMAL (5,2) NOT NULL,
    PRIMARY KEY (`id_focaccia`)
);

CREATE TABLE IF NOT EXISTS `recette`(
     `id_focaccia` INT NOT NULL,
     `id_ingredient`INT NOT NULL,
     `quantite` INT NOT NULL COMMENT 'Quantité en grammes',
     PRIMARY KEY (`id_ingredient`, `id_focaccia`)
    
);

ALTER TABLE `recette`
ADD CONSTRAINT `fk_recette_id_ingredient`
FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient`(`id_ingredient`);

ALTER TABLE `recette`
ADD CONSTRAINT `fk_recette_id_focaccia`
FOREIGN KEY (`id_focaccia`) REFERENCES `focaccia`(`id_focaccia`);


CREATE TABLE IF NOT EXISTS `marque`(
    `id_marque` INT NOT NULL AUTO_INCREMENT,
    `name_marque` VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY (`id_marque`)
);



CREATE TABLE IF NOT EXISTS `boisson` (
    `id_boisson` INT NOT NULL AUTO_INCREMENT,
    `name_boisson` VARCHAR(50) NOT NULL,
    `id_marque` INT NOT NULL,
    PRIMARY KEY (`id_boisson`)
);

ALTER TABLE `boisson`
ADD CONSTRAINT `fk_boisson_id_marque`
FOREIGN KEY (`id_marque`) REFERENCES `marque`(`id_marque`);


CREATE TABLE IF NOT EXISTS `menu` (
    `id_menu` INT NOT NULL AUTO_INCREMENT,
    `name_menu` VARCHAR(50) NOT NULL,
    `price_menu` DECIMAL(5,2) NOT NULL,
    `id_focaccia` INT NOT NULL,
     PRIMARY KEY (`id_menu`)
);

ALTER TABLE `menu`
ADD CONSTRAINT `fk_menu_id_focaccia`
FOREIGN KEY (`id_focaccia`) REFERENCES `focaccia`(`id_focaccia`);


CREATE TABLE IF NOT EXISTS `menu_boisson`(
     `id_boisson` INT NOT NULL,
     `id_menu` INT NOT NULL,
      PRIMARY KEY (`id_boisson`, `id_menu`)
);


ALTER TABLE `menu_boisson`
ADD CONSTRAINT `fk_menu_boisson_id_boisson`
FOREIGN KEY (`id_boisson`) REFERENCES `boisson`(`id_boisson`);


ALTER TABLE `menu_boisson`
ADD CONSTRAINT `fk_menu_boisson_id_menu`
FOREIGN KEY (`id_menu`) REFERENCES `menu`(`id_menu`);



CREATE TABLE IF NOT EXISTS `client`(
    `id_client` INT NOT NULL AUTO_INCREMENT,
    `name_client` VARCHAR(50) NOT NULL,
    `email` VARCHAR(150) NOT NULL UNIQUE,
    `code_postal` INT ,
     PRIMARY KEY (`id_client`)
);

CREATE TABLE IF NOT EXISTS `menu_client`(
    `id_client` INT NOT NULL,
    `id_menu` INT NOT NULL,
    `date_achat` DATE NOT NULL,
    PRIMARY KEY ( `id_client`, `id_menu`,`date_achat`)

);

ALTER TABLE `menu_client`
ADD CONSTRAINT `fk_menu_client_id_menu`
FOREIGN KEY (`id_menu`) REFERENCES `menu`(`id_menu`);

ALTER TABLE `menu_client`
ADD CONSTRAINT `fk_menu_client_id_client`
FOREIGN KEY (`id_client`) REFERENCES `client`(`id_client`);

