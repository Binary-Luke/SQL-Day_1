--1. How many actors are there with the last name ‘Wahlberg’?

select count(actor_id)
from actor
where last_name like 'Wahlberg';

-- Answer == 2

--2. How many payments were made between $3.99 and $5.99?

select count(amount)
from payment
where amount >= 3.99 and amount <= 5.99;

-- Answer 5602

--3. What film does the store have the most of? (search in inventory)

select film_id, count(inventory_id)
from inventory
group by film_id
order by count(inventory_id) desc;

-- Answer is many film_ids because the max count in my database is 8 


--4. How many customers have the last name ‘William’?

select count(last_name)
from customer
where last_name like 'William';

-- Answer == 0

--5. What store employee (get the id) sold the most rentals?

select staff_id, count(rental_id)
from rental
group by staff_id 
order by count(rental_id) desc;

-- Answer 1 with 8040

--6. How many different district names are there?

select count(distinct district)
from address

-- answer == 378


--7. What film has the most actors in it? (use film_actor table and get film_id)

select film_id, count(actor_id)
from film_actor
group by film_id 
order by count(actor_id) desc;

--Answer 508 with 15



--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)

select store_id, count(last_name)
from customer
where last_name like '%es'
group by store_id;

--Answer 1 with 13


--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--with ids between 380 and 430? (use group by and having > 250)

select count(distinct amount)
from payment
where customer_id >= 380.00 and customer_id <= 430
group by rental_id > 250;



--10. Within the film table, how many rating categories are there? And what rating has the most
--movies total?

select rating, count(distinct film_id)
from film
group by rating
order by count(film_id) desc;

-- answer 5 rating PG-13 with the most movies at 223