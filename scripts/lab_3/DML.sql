-- DML: Додавання нового користувача (User)
INSERT INTO plants.`Client` (name, email, hash) VALUES
('1Vik Pavlenko', '1vi54ktor.pavlenko@gmail.com', '0000'),
('2Vik Pavlenko', '2vi54ktor.pavlenko@gmail.com', '0000'),
('3Vik Pavlenko', '3vi54ktor.pavlenko@hneu.com', '0000'),
('4Vik Pavlenko', '4vi54ktor.pavlenko@hneu.com', '0000'),
('5Vik Pavlenko', '5vi54ktor.pavlenko@gmail.com', '0000'),
('6Vik Pavlenko', '6vi54ktor.pavlenko@gopo.com', '0000');

-- DML: Додавання нових товарів (Product)
INSERT INTO plants.`Product` (`name`, `description`, `price`, `quantity`, `categoryId`) VALUES
("Flower1","description",10,10,2),
("Flower2","description",10,10,2),
("Flower3","description",10,10,2),
("Flower4","description",10,10,2),
("Flower5","description",10,10,2);

-- DML: Оновлення ціни товару (Update)
UPDATE plants.`Product`
SET `price` = 8888
WHERE `name` = 'Flower5';

-- DML: Видалення позицій з замовлення (Delete)
DELETE FROM plants.`OrderContent`
WHERE `orderId` = 1 AND `productId` > 3;

-- DQL: Фільтрація (WHERE + AND)
SELECT *
FROM plants.`Product`
WHERE `categoryId` = 1 AND `price` < 400;

-- DQL: Фільтрація (WHERE + IN)
SELECT *
FROM plants.`Order`
WHERE `status` IN ('shipped', 'completed');

-- DQL: Фільтрація (WHERE + LIKE)
SELECT *
FROM plants.`Client`
WHERE `email` LIKE '%@gmail.com';

-- DQL: Сортування (ORDER BY)
SELECT *
FROM plants.`Product`
ORDER BY `price` DESC;
