/*
Nick DePaul
Lab 6
10/16/17
*/

--1--
select c.city, c.name 
from customers c
	inner join products p 
		on c.city = p.city
group by p.city
order by count(p.city) asc;

--I couldn't figure it out for Codd :(--

--2--
select products.name, AVG(products.priceUSD)
from products
order by name desc;

--3--
select c.name
from customers c Inner Join orders o on c.cid = o.cid
where o.totalUSD >= 0
order by totalUSD asc;

--4--
select (name + COALESCE(name, 0))
from customers
where name = all;

--5--
select c.name
from customers c Inner Join orders o c.cid = o.cid
                 Inner Join products p o.pid = p.pid
                 Inner Join orders o p.aid = o.aid
                 Inner Join agents a o.aid = a.aid;
				 
--6--
select SUM (totalUSD)
from orders;

--7--
/*
A left outer join contains rows that do not match from the left side of the table.
A right outer join contains rows that match from the right side of the table.
Left Outer Join:
select c.name
from customers c left outer join products p c.name = p.name;

Right Outer Join:
select c.name
from customers c right outer join orders o o.cid = c.cid;
*/