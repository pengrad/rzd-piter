# --------------------------------------------------------
# Host:                         localhost
# Server version:               5.1.50-community
# Server OS:                    Win32
# HeidiSQL version:             6.0.0.3603
# Date/time:                    2012-02-12 20:38:35
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

# Dumping database structure for rzd
DROP DATABASE IF EXISTS `rzd`;
CREATE DATABASE IF NOT EXISTS `rzd` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `rzd`;


# Dumping structure for table rzd.direction
DROP TABLE IF EXISTS `direction`;
CREATE TABLE IF NOT EXISTS `direction` (
  `dir_id` int(10) unsigned NOT NULL,
  `dir_name` varchar(100) NOT NULL,
  PRIMARY KEY (`dir_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table rzd.discount
DROP TABLE IF EXISTS `discount`;
CREATE TABLE IF NOT EXISTS `discount` (
  `disc_id` int(10) unsigned NOT NULL,
  `disc_type_id` int(10) unsigned NOT NULL,
  `disc_type_name` varchar(50) NOT NULL,
  PRIMARY KEY (`disc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for view rzd.discount_fednonsoc
DROP VIEW IF EXISTS `discount_fednonsoc`;
# Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `discount_fednonsoc` (
	`disc_id` INT(10) UNSIGNED NOT NULL DEFAULT ''
) ENGINE=MyISAM;


# Dumping structure for view rzd.discount_fedsoc
DROP VIEW IF EXISTS `discount_fedsoc`;
# Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `discount_fedsoc` (
	`disc_id` INT(10) UNSIGNED NOT NULL DEFAULT ''
) ENGINE=MyISAM;


# Dumping structure for view rzd.discount_region
DROP VIEW IF EXISTS `discount_region`;
# Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `discount_region` (
	`disc_id` INT(10) UNSIGNED NOT NULL DEFAULT ''
) ENGINE=MyISAM;


# Dumping structure for view rzd.discount_rzdpersonal
DROP VIEW IF EXISTS `discount_rzdpersonal`;
# Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `discount_rzdpersonal` (
	`disc_id` INT(10) UNSIGNED NOT NULL DEFAULT ''
) ENGINE=MyISAM;


# Dumping structure for view rzd.discount_rzdservice
DROP VIEW IF EXISTS `discount_rzdservice`;
# Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `discount_rzdservice` (
	`disc_id` INT(10) UNSIGNED NOT NULL DEFAULT ''
) ENGINE=MyISAM;


# Dumping structure for view rzd.discount_rzdwork
DROP VIEW IF EXISTS `discount_rzdwork`;
# Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `discount_rzdwork` (
	`disc_id` INT(10) UNSIGNED NOT NULL DEFAULT ''
) ENGINE=MyISAM;


# Dumping structure for view rzd.discount_study
DROP VIEW IF EXISTS `discount_study`;
# Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `discount_study` (
	`disc_id` INT(10) UNSIGNED NOT NULL DEFAULT ''
) ENGINE=MyISAM;


# Dumping structure for view rzd.discount_war
DROP VIEW IF EXISTS `discount_war`;
# Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `discount_war` (
	`disc_id` INT(10) UNSIGNED NOT NULL DEFAULT ''
) ENGINE=MyISAM;


# Dumping structure for table rzd.file
DROP TABLE IF EXISTS `file`;
CREATE TABLE IF NOT EXISTS `file` (
  `FileId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `FileName` varchar(100) DEFAULT NULL COMMENT 'имя XML документа',
  `NumTerm` int(11) DEFAULT NULL COMMENT 'номер терминала',
  `SmenaNum` int(11) DEFAULT NULL COMMENT 'номер смены',
  `PlaceTerm` int(11) NOT NULL COMMENT 'станция приписки',
  `Month` int(11) DEFAULT NULL COMMENT 'номер месяца',
  `TimeOpen` datetime DEFAULT NULL COMMENT 'дата и время открытия смены',
  `FirstTicket` int(11) DEFAULT NULL COMMENT 'порядковый номер пробного билета',
  `Sum` double DEFAULT NULL COMMENT 'сумма смены (денежная выручка за рабочую смену)',
  `TimeClose` datetime DEFAULT NULL COMMENT 'дата и время закрытия смены',
  `NumTickets` int(11) DEFAULT NULL COMMENT 'количество оформленных документов',
  `LenTape` float DEFAULT NULL COMMENT 'длина ленты(метраж)',
  `TypeTerm` varchar(10) NOT NULL COMMENT 'тип терминала',
  `SoftVersion` varchar(100) DEFAULT NULL COMMENT 'версия ПО',
  `INN` varchar(20) DEFAULT NULL COMMENT 'ИНН владельца терминала (организации при постановке на налоговый учет)',
  `FIO` varchar(100) DEFAULT NULL COMMENT 'ФИО кассира',
  `CardOut` int(11) DEFAULT NULL COMMENT 'возвращено карт (Сумма принятого залога)',
  `CardIn` int(11) DEFAULT NULL COMMENT 'выдано карт (Сумма возвращенного залога)',
  `Sup` double DEFAULT NULL COMMENT 'Сумма доплаты льготных билетов (выпадающий доход за рабочую смену)',
  `Cancel` double DEFAULT NULL COMMENT 'Сумма анулированных билетов ',
  `NumProc` int(11) DEFAULT NULL COMMENT 'количество билетов (для p97)',
  `SumProc` double DEFAULT NULL COMMENT 'выручка (сумма билетов для p97)',
  `SumEKLZ` double DEFAULT NULL COMMENT 'сумма в ЭКЛЗ',
  `SCol` double DEFAULT NULL COMMENT 'сумма сборов за оформление ППД',
  `STax` double DEFAULT NULL COMMENT 'НДС за оформление ППД',
  `Blank` int(11) DEFAULT NULL COMMENT 'расход бланков',
  `SumRet` double DEFAULT NULL COMMENT 'сумма возврата по аварийным квитанциям',
  `SumServ` double DEFAULT NULL COMMENT 'сумма услуги',
  `NDSServ` double DEFAULT NULL COMMENT 'НДС услуги',
  `TimeCreate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата записи файла',
  PRIMARY KEY (`FileId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table rzd.sector
DROP TABLE IF EXISTS `sector`;
CREATE TABLE IF NOT EXISTS `sector` (
  `sect_id` int(10) unsigned NOT NULL,
  `sect_name` varchar(100) NOT NULL,
  `sect_dir_id` int(10) unsigned NOT NULL,
  `sect_parent_id` int(10) unsigned DEFAULT NULL COMMENT 'Ссылка на родительский участок, если участок вложенный',
  PRIMARY KEY (`sect_id`),
  KEY `fk__sector__sect_dir_id` (`sect_dir_id`),
  KEY `fk__sector__sect_parent_id` (`sect_parent_id`),
  CONSTRAINT `fk__sector__sect_parent_id` FOREIGN KEY (`sect_parent_id`) REFERENCES `sector` (`sect_id`),
  CONSTRAINT `fk__sector__sect_dir_id` FOREIGN KEY (`sect_dir_id`) REFERENCES `direction` (`dir_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table rzd.station
DROP TABLE IF EXISTS `station`;
CREATE TABLE IF NOT EXISTS `station` (
  `stat_id` int(10) unsigned NOT NULL,
  `stat_name` varchar(100) NOT NULL,
  PRIMARY KEY (`stat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table rzd.station_sector_cross
DROP TABLE IF EXISTS `station_sector_cross`;
CREATE TABLE IF NOT EXISTS `station_sector_cross` (
  `stat_id` int(10) unsigned NOT NULL,
  `sect_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`stat_id`,`sect_id`),
  KEY `fk__station_sector_cross__sect_id` (`sect_id`),
  CONSTRAINT `fk__station_sector_cross__stat_id` FOREIGN KEY (`stat_id`) REFERENCES `station` (`stat_id`),
  CONSTRAINT `fk__station_sector_cross__sect_id` FOREIGN KEY (`sect_id`) REFERENCES `sector` (`sect_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table rzd.ticket
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE IF NOT EXISTS `ticket` (
  `TicketId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `FileId` int(10) unsigned NOT NULL,
  `PerevozGkey` int(11) DEFAULT NULL COMMENT 'код перевозчика в АСОКУПЭ-Л',
  `TrainCat` varchar(5) DEFAULT NULL COMMENT 'категория поезда (скорый, пасс.)',
  `TPlanID` int(11) DEFAULT NULL COMMENT 'Тарифный план (ID в БД АСОКУПЭ-Л)',
  `FromStationE` int(11) NOT NULL COMMENT 'Станция отправления (Экспресс код)',
  `ToStationE` int(11) NOT NULL COMMENT 'Станция назначения (Экспресс код)',
  `TicketTypeID` int(11) NOT NULL COMMENT 'Тип билета (разовый, абонемент)',
  `TicketTypeL` int(11) DEFAULT NULL COMMENT 'Льготная категория',
  `N` int(11) DEFAULT NULL COMMENT 'Номер билета / квитанции /операции',
  `A` tinyint(4) DEFAULT NULL COMMENT 'Признак аннулирования =1',
  `T` datetime DEFAULT NULL COMMENT 'Время операции',
  `S` double DEFAULT NULL COMMENT 'сумма оплаченная пассажиром',
  `R` tinyint(4) DEFAULT NULL COMMENT 'Признак туда и обратно =1',
  `P` datetime DEFAULT NULL COMMENT 'Дата предварительного проезда',
  `U` double DEFAULT NULL COMMENT 'Сумма доплаты (сумма к выплате субъектом РФ, из федерального бюджета, из бюджета РЖД)',
  `V` int(11) DEFAULT NULL COMMENT 'Тип документа на льготу по КТО, ЭТТ, регионалы',
  `D` varchar(20) DEFAULT NULL COMMENT 'Номер льготного документа / ЭТТ с БСК',
  `B` varchar(10) DEFAULT NULL COMMENT 'Код билетного бюро',
  `O` varchar(20) DEFAULT NULL COMMENT 'Код организации',
  `H` varchar(2) DEFAULT NULL COMMENT 'Категория пассажира',
  `C` varchar(25) DEFAULT NULL COMMENT 'Номер ТК / СК / ЭТТ',
  `K` varchar(15) DEFAULT NULL COMMENT 'Кристалл ТК / СК / ЭТТ',
  `F` varchar(100) DEFAULT NULL COMMENT 'Фамилия льготника',
  `Z` varchar(25) DEFAULT NULL COMMENT 'Номер аннулированного документа',
  `E` varchar(10) DEFAULT NULL COMMENT 'Номер ошибки',
  `DK` varchar(25) DEFAULT NULL COMMENT 'Внутренний номер по ЭТТ с БСК',
  `Col` double DEFAULT NULL COMMENT 'Стоимость услуги оформления ППД на ПКТК',
  `Tax` double DEFAULT NULL COMMENT 'НДС услуги оформления ППД на ПКТК',
  `NDS` double DEFAULT NULL COMMENT 'НДС по ручной клади',
  `Bl` int(11) DEFAULT NULL COMMENT 'Номер бланка',
  `SN` varchar(15) DEFAULT NULL COMMENT 'СНИЛС',
  `TimeCalcReport` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Отчетный день, за который считать билет',
  PRIMARY KEY (`TicketId`),
  KEY `FK__ticket__FileId` (`FileId`),
  KEY `ix__ticket__TimeCalcReport` (`TimeCalcReport`) USING BTREE,
  CONSTRAINT `FK__ticket__FileId` FOREIGN KEY (`FileId`) REFERENCES `file` (`FileId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for view rzd.discount_fednonsoc
DROP VIEW IF EXISTS `discount_fednonsoc`;
# Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `discount_fednonsoc`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `discount_fednonsoc` AS select `discount`.`disc_id` AS `disc_id` from `discount` where (`discount`.`disc_type_id` = 2);


# Dumping structure for view rzd.discount_fedsoc
DROP VIEW IF EXISTS `discount_fedsoc`;
# Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `discount_fedsoc`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `discount_fedsoc` AS select `discount`.`disc_id` AS `disc_id` from `discount` where (`discount`.`disc_type_id` = 1);


# Dumping structure for view rzd.discount_region
DROP VIEW IF EXISTS `discount_region`;
# Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `discount_region`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `discount_region` AS select `discount`.`disc_id` AS `disc_id` from `discount` where (`discount`.`disc_type_id` = 3);


# Dumping structure for view rzd.discount_rzdpersonal
DROP VIEW IF EXISTS `discount_rzdpersonal`;
# Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `discount_rzdpersonal`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `discount_rzdpersonal` AS select `discount`.`disc_id` AS `disc_id` from `discount` where (`discount`.`disc_type_id` = 6);


# Dumping structure for view rzd.discount_rzdservice
DROP VIEW IF EXISTS `discount_rzdservice`;
# Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `discount_rzdservice`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `discount_rzdservice` AS select `discount`.`disc_id` AS `disc_id` from `discount` where (`discount`.`disc_type_id` = 8);


# Dumping structure for view rzd.discount_rzdwork
DROP VIEW IF EXISTS `discount_rzdwork`;
# Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `discount_rzdwork`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `discount_rzdwork` AS select `discount`.`disc_id` AS `disc_id` from `discount` where (`discount`.`disc_type_id` = 7);


# Dumping structure for view rzd.discount_study
DROP VIEW IF EXISTS `discount_study`;
# Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `discount_study`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `discount_study` AS select `discount`.`disc_id` AS `disc_id` from `discount` where (`discount`.`disc_type_id` = 5);


# Dumping structure for view rzd.discount_war
DROP VIEW IF EXISTS `discount_war`;
# Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `discount_war`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `discount_war` AS select `discount`.`disc_id` AS `disc_id` from `discount` where (`discount`.`disc_type_id` = 4);
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;