-- 1. Створюємо користувача 'app_backend'
CREATE USER 'app_backend'@'localhost' IDENTIFIED BY 'pass_secure_456';

-- 2. Дозволяємо ТІЛЬКИ ЧИТАТИ товари, категорії та користувачів
-- (щоб показувати їх на сайті)
GRANT SELECT ON plants.`Product` TO 'app_backend'@'localhost';
GRANT SELECT ON plants.`Category` TO 'app_backend'@'localhost';
GRANT SELECT on plants.`Client` TO 'app_backend'@'localhost';

-- 3. Дозволяємо ЧИТАТИ ТА СТВОРЮВАТИ замовлення
-- (але не видаляти і не редагувати!)
GRANT SELECT, INSERT ON plants.`Order` TO 'app_backend'@'localhost';
GRANT SELECT, INSERT ON plants.`OrderContent` TO 'app_backend'@'localhost';

-- 4. Застосовуємо зміни
FLUSH PRIVILEGES;
