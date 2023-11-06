/*1. Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.*/
select (
	select count(inventory.film_id) 
    from inventory 
    where inventory.film_id in (select film.film_id from film where film.title like '%Hunchback Imp%')
) as number_of_copies;

/*2. List all films whose length is longer than the average length of all the films in the Sakila database.*/
select film.title from film where film.length > (select avg(film.length) from film);

/*3. Use a subquery to display all actors who appear in the film "Alone Trip".*/
select concat(actor.first_name, ' ', actor.last_name) as full_name
from actor
join film_actor 
on actor.actor_id = film_actor.actor_id
and film_actor.film_id = (select film_id from film 
						where film.title like 'Alone Trip');

/***Bonus**:
4. Sales have been lagging among young families, and you want to target family movies for a promotion. 
Identify all movies categorized as family films.*/
select film.title
from film
inner join film_category
on film.film_id = film_category.film_id
inner join category
on film_category.category_id = category.category_id 
where category.name = 'Family';

/*5. Retrieve the name and email of customers from Canada using both subqueries and joins. To use joins, you will
need to identify the relevant tables and their primary and foreign keys.*/


/*6. Determine which films were starred by the most prolific actor in the Sakila database. A prolific actor is 
defined as the actor who has acted in the most number of films. First, you will need to find the most prolific 
actor and then use that actor_id to find the different films that he or she starred in.*/


/*7. Find the films rented by the most profitable customer in the Sakila database. You can use the customer and 
payment tables to find the most profitable customer, i.e., the customer who has made the largest sum of payments.*/


/*8. Retrieve the client_id and the total_amount_spent of those clients who spent more than the average of the 
total_amount spent by each client. You can use subqueries to accomplish this.*/

