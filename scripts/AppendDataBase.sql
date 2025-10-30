use plants;

insert into client(id,name,email,hash)
values
(5,"USE4R1","OlenaVenhrina@gmail.com","343rtdghj54545567567435"),
(7,"user42","Dolgova2020@gmail.com","43576576tyuty7457567567");

insert into category(id,name,description)
values
(10,"Кактус","Зелений"),
(8,"Квіти","Різнокольорові");

insert into product(id,name,description,price,quantity,categoryId)
values
(3,"Кактус","Опис кактуса...",228.1,20,10),
(4,"Малий кактус","Опис малого кактуса...",628.9,80,10);

insert into plants.order(id,status,clientId)
values
(12,"ready",5);

insert into ordercontent(orderId,productId,productPrice,productQuantity)
values
(12,4,628.9,3);
