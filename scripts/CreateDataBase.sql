use plants;

CREATE table if not exists `Client` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `email` varchar(256) UNIQUE,
  `hash` varchar(256) NOT NULL,
  `registrationDate` timestamp NOT NULL DEFAULT now()
);

CREATE TABLE if not exists `Category` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(128) UNIQUE,
  `description` text NOT NULL
);

CREATE TABLE if not exists `Product` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(128) UNIQUE,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` integer NOT NULL DEFAULT 0,
  `categoryId` integer NOT NULL
);

CREATE TABLE if not exists `Order` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `status` varchar(128) NOT NULL,
  `createDate` timestamp NOT NULL DEFAULT now(),
  `clientId` integer NOT NULL
);

CREATE TABLE if not exists `OrderContent` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `orderId` integer NOT NULL,
  `productId` integer NOT NULL,
  `productPrice` decimal(10,2) NOT NULL,
  `productQuantity` integer NOT NULL
);

ALTER TABLE `Product` ADD FOREIGN KEY (`categoryId`) REFERENCES `Category` (`id`);

ALTER TABLE `OrderContent` ADD FOREIGN KEY (`orderId`) REFERENCES `Order` (`id`);

ALTER TABLE `OrderContent` ADD FOREIGN KEY (`productId`) REFERENCES `Product` (`id`);

ALTER TABLE `Order` ADD FOREIGN KEY (`clientId`) REFERENCES `Client` (`id`);
