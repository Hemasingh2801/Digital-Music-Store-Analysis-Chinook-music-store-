#---Question Set-1:---EASY LEVEL
#Q1.Who is the senior most employee based on the job title?*/
select * from employee
order by levels desc
limit 1;

#Q2.Which countries have the most invoices?
SELECT * FROM musicstore.invoice;
select billing_country,count(invoice_id)
from invoice
group by billing_country
order by count(invoice_id) desc;

#Q3.What are the top 3 values of total invoices?
select total from invoice
order by total desc
limit 3;

/*Q4.Which city has the best customers? We would like to throw a promotional Music Festival in the city we
made the most money. Write a query that returns one city that has the highest sum of invoice totals.Return both the city name & sum of all invoice totals.*/
select billing_city,round(sum(total),2) as total
from invoice
group by billing_city
order by total desc
limit 1;

/*Who is the best customer? The customer who has spent the most money will be declared the best customer.
Write a query that returns the person who has spent the most money.*/
select c.first_name,c.last_name,c.customer_id,sum(i.total) as total_spend 
from customer c
join invoice i
on c.customer_id=i.customer_id
group by c.first_name,c.last_name,c.customer_id
order by total_spend desc;

#---Question Set-2:---MODERATE LEVEL
/*Q1: Write query to return the email, first name,last name, & Genre of all Rock Music listeners.
Return your list ordered alphabetically by email starting with A*/
SELECT DISTINCT
    c.email,
    c.first_name,
    c.last_name,
    g.name AS genre
FROM customer c
JOIN invoice i 
     ON c.customer_id = i.customer_id
JOIN invoice_line il 
     ON i.invoice_id = il.invoice_id
JOIN track t 
     ON il.track_id = t.track_id
JOIN genre g 
     ON t.genre_id = g.genre_id
WHERE g.name = 'Rock'
ORDER BY c.email;

/*Q2: Let's invite the artists who have written the most rock music in our dataset. Write a query 
that returns the Artist name and total track count of the top 10 rock bands.*/

SELECT 
    a.artist_id,
    a.name,
    COUNT(*) AS track_count
FROM track t
JOIN genre g 
     ON g.genre_id = t.genre_id
JOIN album2 al 
     ON al.album_id = t.album_id
JOIN artist a 
     ON a.artist_id = al.artist_id
WHERE g.name = 'Rock'
GROUP BY a.artist_id, a.name
ORDER BY track_count DESC
LIMIT 10;
 
/*Q3.Return all the track names that have a song length longer than the average song length.
Return the Name and Milliseconds for each track.Order by the song length with the longest songs listed first.*/
select name ,milliseconds from track
where milliseconds > (
select avg(milliseconds) from track)
order by milliseconds desc
;

#---Question Set-3:---ADVANCE LEVEL
/*Q1.Find how much amount spent by each customer on artists? Write a query to return customername, artist name 
and total spent.*/
select first_name,last_name,artist_name,sum(unit_price*quantity) as total_spent from(
select c.first_name as first_name,c.last_name as last_name,
a.name as artist_name,il.unit_price,il.quantity from customer c
join invoice i
on c.customer_id=i.customer_id
join invoice_line il
on i.invoice_id=il.invoice_id
join track t on il.track_id=t.track_id
join album2 a2 on t.album_id=a2.album_id
join artist a on a2.artist_id=a.artist_id)t
group by first_name,last_name,artist_name
order by total_spent desc;

#Money spent by each customer on the best_selling artist
#Solution No.1
WITH best_selling_artist AS 
(SELECT a.artist_id,a.name AS artist_name,
	SUM(il.unit_price * il.quantity) AS total_sales
    FROM invoice_line il
    JOIN track t ON il.track_id = t.track_id
    JOIN album2 al ON t.album_id = al.album_id
    JOIN artist a ON al.artist_id = a.artist_id
    GROUP BY a.artist_id, a.name
    ORDER BY total_sales DESC
    LIMIT 1)
SELECT c.first_name,c.last_name,bsa.artist_name,
SUM(il.unit_price * il.quantity) AS total_spent
FROM invoice_line il
JOIN invoice i ON il.invoice_id = i.invoice_id
JOIN customer c ON i.customer_id = c.customer_id
JOIN track t ON il.track_id = t.track_id
JOIN album2 al ON t.album_id = al.album_id
JOIN best_selling_artist bsa ON al.artist_id = bsa.artist_id
GROUP BY c.customer_id,c.first_name,c.last_name,bsa.artist_name
ORDER BY total_spent DESC;

#Solution No.2

WITH artist_sales AS (
    SELECT a.artist_id,a.name AS artist_name,
	SUM(il.unit_price * il.quantity) AS total_sales,
	RANK() OVER (ORDER BY SUM(il.unit_price * il.quantity) DESC) AS rnk
    FROM invoice_line il
    JOIN track t ON il.track_id = t.track_id
    JOIN album2 al ON t.album_id = al.album_id
    JOIN artist a ON al.artist_id = a.artist_id
    GROUP BY a.artist_id, a.name)
SELECT c.first_name,c.last_name,ar.artist_name,
SUM(il.unit_price * il.quantity) AS total_spent
FROM invoice_line il
JOIN invoice i ON il.invoice_id = i.invoice_id
JOIN customer c ON i.customer_id = c.customer_id
JOIN track t ON il.track_id = t.track_id
JOIN album2 al ON t.album_id = al.album_id
JOIN artist_sales ar ON al.artist_id = ar.artist_id
WHERE ar.rnk = 1
GROUP BY c.customer_id,c.first_name,c.last_name,ar.artist_name
ORDER BY total_spent DESC;

/*Q2.We want to find out the most popular music Genre for each country.We determine the most popular genre as the 
genre with the highest amount of purchases. Write a query that returns each country along with the top Genre.
For countries where the maximum number of purchases is shared return all Genres.*/
#customer->invoice->invoice_line->track->genre

select country,name as genre_name,total_purchases from(
select c.country,g.name,sum(il.quantity) as total_purchases,
rank() over(partition by c.country order by sum(quantity) desc) as rnk
from customer c join invoice i on c.customer_id=i.customer_id
join invoice_line il on i.invoice_id=il.invoice_id
join track t on il.track_id=t.track_id
join genre g on t.genre_id=g.genre_id
group by c.country,g.name)t
where rnk=1
order by total_purchases desc;

/* Q3: Write a query that determines the customer that has spent the most on music for each country. 
Write a query that returns the country along with the top customer and how much they spent. 
For countries where the top amount spent is shared, provide all customers who spent this amount. */

select first_name,last_name,country,total_spent from(
select c.customer_id,c.first_name,c.last_name,c.country,sum(total) as total_spent,
rank() over(partition by c.country order by sum(total) desc) as rnk
from customer c
join invoice i on c.customer_id=i.customer_id
group by c.customer_id,c.first_name,c.last_name,c.country)t
where rnk=1
order by country desc
;
