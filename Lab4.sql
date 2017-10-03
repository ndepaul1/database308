--Nick DePaul--
--10/2/17--
--Lab 4--

--1--
select *
from agents
where exists (select *
              from orders
			  where cid = 'c006'
			  );

--2--
select distinct *
from products
where exists (select aid
			  from orders
			  where exists (select *
			                from customers
							where city = 'Beijing'
							)
			  );

--3--
select cid, name
from customers
where exists (select *
              from orders
			  where aid <> 'a03'
			  );

--4--
select distinct cid
from orders
where exists (select *
              from orders
			  where exists (select aid
			                from orders
							where pid = 'p01'
							)
							or exists (select aid
							           from orders
									   where pid = 'p07'
									   )
			  );
			  
--5--
select pid 
from orders
where exists (select aid
              from products
			  where aid <> 'a002' or aid <> 'a03'
			  )
order by pid desc;

--6--
select name, discountpct
from customers
where exists (select aid
              from orders
			  where aid = (select distinct aid
			               from agents 
						   where city = 'Tokyo'
						   limit 1
						   )
			  or aid = (select distinct aid
			            from agents
						where city = 'New York'
						limit 1
						)
			  );

--7--
/*select *
from customers
where discountpct = (select discountpct
                     from customers
					 where city = (select city
								   from customers
								   where city = 'London' or city = 'Duluth'
								   )
					 );

-8--
A check constraint limits the value range that a column will have. It can refer to a single column or multiple columns. They are important so you can tell it not to allow 
anything under a certain number.
Good example of a check constraint:
ALTER TABLE Orders
ADD CONSTRAINT CHK_MonthUSD CHECK (totalUSD>=1000 AND month=’Jan’);

That’s a good example because I’m making sure that it will only show me the totalUSD for anything above 1000.

Bad example of a check constraint:
ALTER TABLE Orders
ADD CONSTRAINT CHK_AID CHECK (aid>=’a04’ AND month=’Mar’);

That’s a bad example of a check constraint because you should never use ids to check for anything because they may change in the future and you want your 
table to be future proof.

*/									 