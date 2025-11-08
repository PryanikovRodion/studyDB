USE `plants`;
-- Додаємо нову колонку в таблицю куди ми будемо писати дату зміни таблиці при роботі тригера
ALTER TABLE `Product`
ADD COLUMN IF NOT EXISTS `updated_at` TIMESTAMP NULL DEFAULT NULL;

DELIMITER //

CREATE TRIGGER `trigerProductBeforeUpdate`-- Створюємо тригер 
BEFORE UPDATE ON `Product`-- При оновлені таблиці Product
FOR EACH row -- Любого рядка таблиці
BEGIN
    SET NEW.`updated_at` = NOW();-- Примусово змінюємо поле updated_at строки що ми змінюємо на поточну дату
END
//

DELIMITER ;
