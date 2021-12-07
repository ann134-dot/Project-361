CREATE DATABASE IF NOT EXISTS `hms` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `hms`;

CREATE TABLE `booking` (
                           `id` int(11) NOT NULL,
                           `arrival` date DEFAULT NULL,
                           `departure` date DEFAULT NULL,
                           `total` decimal(19,2) DEFAULT NULL,
                           `guest_id` int(11) DEFAULT NULL,
                           `room_id` int(11) DEFAULT NULL,
                           `employee_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `hotel` (
                           `id` int(11) NOT NULL,
                           `name` varchar(255) DEFAULT NULL,
                           `city` varchar(255) DEFAULT NULL,
                           `address` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `checks` (
                          `id` int(11) NOT NULL,
                          `checkTime` datetime DEFAULT NULL,
                          `status` bit(1) DEFAULT NULL,
                          `booking_id` int(11) DEFAULT NULL,
                          `employee_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `guest` (
                         `login` varchar(255) DEFAULT NULL,
                         `password` varchar(255) DEFAULT NULL,
                         `id` int(11) NOT NULL,
                         `birthDate` date DEFAULT NULL,
                         `documentType` varchar(255) DEFAULT NULL,
                         `document` varchar(255) DEFAULT NULL,
                         `email` varchar(255) DEFAULT NULL,
                         `name` varchar(255) DEFAULT NULL,
                         `phoneNumber` varchar(255) DEFAULT NULL,
                         `homeNumber` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `payment` (
                           `id` int(11) NOT NULL,
                           `payTime` datetime DEFAULT NULL,
                           `paymentMethod` varchar(255) DEFAULT NULL,
                           `value` decimal(19,2) DEFAULT NULL,
                           `booking_id` int(11) DEFAULT NULL,
                           `employee_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `room` (
                        `id` int(11) NOT NULL,
                        `number` int(11) DEFAULT NULL,
                        `roomType_id` int(11) DEFAULT NULL,
                        `hotel_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `roomtype` (
                            `id` int(11) NOT NULL,
                            `hotel_id` int(11) NOT NULL,
                            `dailyPrice` decimal(19,2) DEFAULT NULL,
                            `description` varchar(255) DEFAULT NULL,
                            `name` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `employee` (
                         `id` int(11) NOT NULL,
                         `name` varchar(255) DEFAULT NULL,
                         `surname` varchar(255) DEFAULT NULL,
                         `email` varchar(255) DEFAULT NULL,
                         `address` varchar(255) DEFAULT NULL,
                         `shift` varchar(255) DEFAULT NULL,
                         `salary` int DEFAULT NULL,
                         `accessLevel` varchar(255) DEFAULT NULL,
                         `login` varchar(255) DEFAULT NULL,
                         `password` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `schedule` (
                            `id` int(11) NOT NULL,
                            `schedule` varchar(255) DEFAULT NULL,
                            `total` varchar(255) DEFAULT NULL,
                            `working_hours` varchar(255) DEFAULT NULL,
                            `payloads` varchar(255) DEFAULT NULL,

) ENGINE=MyISAM DEFAULT CHARSET=utf8;


ALTER TABLE `booking`
    ADD PRIMARY KEY (`id`),
    ADD KEY `FKs0yg8nbvp96u5vf3wfh685rcp` (`guest_id`),
    ADD KEY `FKowymy55vrygpdnacvnbck2js3` (`room_id`),
    ADD KEY `FKfvwnge63uejojl97650lpyd02` (`employee_id`);

ALTER TABLE `hotel`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `checks`
    ADD PRIMARY KEY (`id`),
    ADD KEY `FKmeomx1m6ycre055o90qdksoyw` (`booking_id`),
    ADD KEY `FKaqc6lyqmy0mv6rwtnuodu2a6n` (`employee_id`);

ALTER TABLE `guest`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `payment`
    ADD PRIMARY KEY (`id`),
    ADD KEY `FKt30qv3axmqwhk1wag867yxqum` (`booking_id`),
    ADD KEY `FKov0p9jd34njt27gu7jks7mv4i` (`employee_id`);

ALTER TABLE `room`
    ADD PRIMARY KEY (`id`),
    ADD KEY `FKklafyw0cu1h3eo2m7vl1f4ga1` (`roomType_id`),
    ADD KEY `FKkavcyw02u1h4eo2m3el1f4gb6` (`hotel_id`);

ALTER TABLE `roomtype`
    ADD PRIMARY KEY (`id`),
    ADD KEY `FKklbcww2cu2h3eo2m7vl1f3ga4` (`hotel_id`);

ALTER TABLE `employee`
    ADD PRIMARY KEY (`id`);


ALTER TABLE `booking`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `hotel`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `checks`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `guest`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `payment`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `room`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `roomtype`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `employee`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

INSERT INTO `employee`(name, surname, email, address, shift, salary, accessLevel, login, password)
VALUES ( 'ADMIN - MUST BE DELETED OR EDITED','admin','admin@mail.com','admin','admin','1','MANAGER', 'admin', 'admin');
COMMIT;
INSERT INTO `hotel`(name, city, address)
VALUES ( 'Raddison','Nur-Sultan','Sauran 2'), ('Hilton','Nur-Sultan','Turan 5'), ('Rixos','Almaty','Street 4');
COMMIT;