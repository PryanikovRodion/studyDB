use `Plants`;

create view `ViewDetailedOrders` as
select
	o.id as `orderId`,
	o.status as `orderStatus`,
	o.createDate as `orderDate`,
	c.name as `clientName`,
	c.email as `clientEmail`,
	p.name as `productName`,
	p.price as `productCurentPrice`,
	oc.productQuantity,
	oc.productPrice
from 
	`Order` as o
join
	`Client` as c on o.clientId = c.id
join 
	`OrderContent` as oc on o.id = oc.orderId
join
    `Product` AS p ON oc.productId = p.id
order by
    o.id DESC;
