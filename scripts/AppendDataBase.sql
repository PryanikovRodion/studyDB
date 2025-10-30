use plants;

insert into client(id,name,email,hash)
values
(6,"USE4R3211","OlenaV234enhrina@gmail.com","343rtdg234hj54545567567435"),
(19,"user42","Dolgova2234020@gmail.com","43576576tyu324ty7457567567");

insert into category(id,name,description)
values
(100,"Кактус","Зелений"),
(80,"Квіти","Різнокольорові");

insert into product(id,name,description,price,quantity,categoryId)
values
(121,"Кактус","Опис кактуса...",228.1,20,100),
(34,"Малий кактус","Опис малого кактуса...",628.9,80,100);

insert into plants.order(id,status,clientId)
values
(1,"ready",6);

insert into ordercontent(orderId,productId,productPrice,productQuantity)
values
(1,121,628.9,3);
