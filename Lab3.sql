select ordno, totalusd
from Orders;

select name, city
from Agents
where name='Smith';

select pid, name, priceusd
from Products
where qty>'200010';

select name, city
from Customers
where city='Duluth';

select name
from Agents
where not city='Dallas'
	intersect
select name
from Agents
where not city='Duluth';

select *
from Products
where not city ='Dallas'
	intersect
select *
from Products 
where not city = 'Duluth'
	intersect
select *
from Products
where priceusd<'1.00';

select *
from Orders
where month='Mar' or month='May';

select *
from Orders
where month='Feb'
	intersect
select *
from Orders
where totalusd>='500.00';

select Orders.*
from Orders
inner join Customers
on Orders.cid = Customers.cid
where Orders.cid='c005';