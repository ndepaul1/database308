/*
Nick DePaul
Lab 8
11/12/17
*/

Drop Table If Exists actors;
Drop Table If Exists movieData;
Drop Table If Exists directors;
Drop Table If Exists people;

--Actors Table--
Create Table actors (
		pid  Char(6) Not Null References people(pid),
		AGAD Date,
		primary key(pid)
);

Insert Into actors (pid, AGAD)
		Values('hk92t7', '1992-05-20');
		
Insert Into actors (pid, AGAD)
		Values('kfu30a', '1960-09-03');
Insert Into actors (pid, AGAD)
		Values('pcuq90', '1955-02-10');

Select * From actors;

--Movie Data Table--
Create Table movieData (
		mid             Char(2) Not Null,
		mpaaNum			Text Not Null,
		name			Text Not Null,
		released		Date Not Null,
		dbosUSD			Integer Not Null,
		fbosUSD			Integer Not Null,
		dvdSales		Integer Not Null,
		primary key(mid)
);

Insert Into movieData (mid, mpaaNum, name, released, dbosUSD, fbosUSD, dvdSales)
		Values('20', 'PG13', 'Star Trek: Beyond', '2016-07-22', '1040234', '2018329');
		
Insert Into movieData (mid, mpaaNum, name, released, dbosUSD, fbosUSD, dvdSales)
		Values('15', 'PG13', 'Star Trek: Into Darkness', '2013-05-16', '3901277', '1047288');
		
Insert Into movieData (mid, mpaaNum, name, released, dbosUSD, fbosUSD, dvdSales)
		Values('05', 'PG13', 'Star Trek V: The Final Frontier', '1989-06-09', '3284018', '2018594');

Select From movieData;

--Directors Table--
Create Table directors (
		pid             Char(6) Not Null References people(pid),
		school			Text,
		DGAD			Date,
		lensMaker		Text,
		primary key(pid)
);

Insert Into directors (pid, school, DGAD, lensmaker)
		Values('lfhj92', 'New York Film Academy', '1990-07-20', 'Samsung');
		
Insert Into directors (pid, school, DGAD, lensmaker)
		Values('pw90ag', 'Colorado Film School', '1965-03-15', 'Samsung');
		
Select  From directors;

--People Table
Create Table people (
		pid				Char(6) Unique Not Null,
		firstName		Text Not Null,
		lastName		Text Not Null,
		birthday		Date Not Null,
		weight			Integer Not Null,
		primary key(pid)
);

Insert Into people( pid, firstName, lastName, birthday, weight)
		Values('kiquf7', 'Zachary', 'Quinto', '1977-06-02', '183');
		
Insert Into people( pid, firstName, lastName, birthday, weight)
		Values('suep28', 'Leonard', 'Nimoy', '1931-05-26', '190');
		
Insert Into people( pid, firstName, lastName, birthday, weight)
		Values('pisk0', 'Stephen', 'Manley', '1965-02-13', '200');
		
Select * From people;