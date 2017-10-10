/*
Nick DePaul
Lab 5
10/9/17
*/

--1--
select a.city
from agents a inner join orders o 
				on a.aid = o.aid
			  inner join customers c 
			    on c.cid = o.cid
where c.cid = 'c006';

--2--
select p.pid
from products p inner join orders o 
					on p.pid = o.pid
				 inner join agents a 
					on o.aid = a.aid
				 left outer join customers c 
					on o.cid = c.cid 
where c.city = 'Beijing'
order by p.pid desc;

--3--
select name
from customers
where cid not in (select cid
             	  from orders
             	 );

--4--
select c.name
from customers c left outer join orders o
					on c.cid = o.cid
where c.name = 'Weyland';

--5--
select c.name, a.name 
from customers c
	inner join orders o 
		on c.cid = o.cid
	inner join agents a 
		on a.aid = o.aid;
		
--6--
select c.name, a.name 
from customers c
	inner join orders o on c.cid = o.cid
	inner join agents a on c.city = a.city;
	
--7--
select c.city, c.name 
from customers c
	inner join products p 
		on c.city = p.city
group by p.city
order by count(p.city) asc;

--This made my eyes bleed when I looked at it.--