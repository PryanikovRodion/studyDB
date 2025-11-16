use `plants`;
-- 1. Дивимося на ціну "ДО"
SELECT * FROM `Product` WHERE `id` = 6;

-- 2. Починаємо транзакцію
START TRANSACTION;

-- 3. Виконуємо нашу DML-операцію (яку ми хочемо скасувати)
UPDATE `Product` 
SET `price` = 999.00 -- Встановлюємо якусь божевільну ціну
WHERE `id` = 6;

-- 4. Переконуємося, що ЦІНА ЗМІНИЛАСЯ (тільки для нас, всередині транзакції)
SELECT * FROM `Product` WHERE `id` = 6;

-- 5. Завершуємо транзакцію ТА СКАСОВУЄМО ВСІ ЗМІНИ
ROLLBACK;

-- 6. Дивимося на ціну "ПІСЛЯ"
SELECT * FROM `Product` WHERE `id` = 6;
