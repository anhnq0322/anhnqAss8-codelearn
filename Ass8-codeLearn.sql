--Q1

use fsoft_training;

--1
--Create a table called Movie to store information about movies. Add columns in your table for a movie name, 
--duration, genre, director, amount of money made at the box office and comments.
--Make sure one of your columns works as a PRIMARY KEY.
--Genre: accepts value range from 1 to 8 only (1: Action, 2: Adventure, 3: Comedy, 
--4: Crime (gangster), 5: Dramas, 6: Horror, 7: Musical/dance, 8: War)
create table movie(
movie_id int primary key,
movie_name nvarchar(20),
duration time check (duration >= 1),
genre int check(genre between 1 and 8),
director nvarchar(30),
make_money decimal(10,2),
comment text
);

--2. Create another table called Actor to store information about actors. 
--Just like you did with Movie, add several columns to store actor data for the actor's name, 
--age, average movie salary, and Nationality. Again, make sure there is a PRIMARY KEY in your table.
create table Actor(
actor_id int primary key,
name_actor nvarchar(50),
age int,
avg_movieSalary decimal(10,2),
nationality nvarchar(50)
);

 --3. Create a final table called ActedIn to store information about which movies certain actors have acted in. 
 --Think carefully about what the columns of this table should be. This table should make use of FOREIGN KEYS.
 create table ActedIn(
 actedin_id int not null,
 actor_id int,
 movie_id int, 
 movie_name nvarchar(20),
 constraint PK_actedinID primary key(actedin_id),
 constraint FK_actorID foreign key (actor_id) references Actor(actor_id),
 constraint FK_movieID foreign key (movie_id) references movie(movie_id)
 );

 --Q2

 --1
 --Add an ImageLink field to Movie table and make sure that the database 
 --will not allow the value for ImageLink to be inserted into a new row if that value has already been used in another row.
 alter table movie add column imageLink varchar(200) unique;

 --2
 --Populate your tables with some data using the INSERT statement. Make sure you have at least 5 tuples per table.
 insert into movie(movie_id,movie_name,duration,genre,director,make_money,comment)
 values
(1, 'The Godfather',1.51, 4, 'Francis Ford Coppola', 10000.02, 'One of the greatest films of all time.'),
(2, 'The Shawshank Redemption', 1.42, 5, 'Frank Darabont', 58.3, 'One of the greatest movies ever made.'),
(3, 'The Dark Knight', 1.52, 1, 'Christopher Nolan', 100000.09, 'One of the best superhero movies ever made.'),
(4, 'Forrest Gump', 2.42, 5, 'Robert Zemeckis', 677.40, 'A timeless classic.'),
(5, 'Pulp Fiction', 1.54, 4, 'Quentin Tarantino', 213.90, 'A cult classic.');

update Actor set name_actor = 'anonimous' where name_actor = 'the king';
--Q3
--1
--Write a query to retrieve all the data in the Actor table for actors that are older than 50.
select * from Actor where age > 50;
--Write a query to retrieve all actor names and average salaries from ACTOR and sort the results by average salary.
select actor_id, name_actor, avg_movieSalary
from Actor
order by avg_movieSalary;
--Using an actor name from your table, write a query to retrieve the names of all the movies that the actor has acted in.
select movie_name, b.actor_id from ActedIn a
inner join Actor AS b
on a.actor_id = b.actor_id;
