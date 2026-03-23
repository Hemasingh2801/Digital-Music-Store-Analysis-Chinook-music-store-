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

/*Q4.Which city has the best customers? We would like
to throw a promotional Music Festival in the city we
made the most money. Write a query that returns one
city that has the highest sum of invoice totals. 
Return both the city name & sum of all invoice totals.*/
select billing_city,round(sum(total),2) as total
from invoice
group by billing_city
order by total desc
limit 1;

/*Who is the best customer? The customer who has spent 
the most money will be declared the best customer. 
Write a query that returns the person who has spent 
the most money.*/
select c.first_name,c.last_name,c.customer_id,sum(i.total) as total_spend 
from customer c
join invoice i
on c.customer_id=i.customer_id
group by c.first_name,c.last_name,c.customer_id
order by total_spend desc
limit 1;

#---Question Set-2:---MODERATE LEVEL
/*Q1: Write query to return the email, first name,
last name, & Genre of all Rock Music listeners.
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

/*Q2: Let's invite the artists who have written 
the most rock music in our dataset. Write a query 
that returns the Artist name and total track count 
of the top 10 rock bands.*/

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
 
/*Return all the track names that have a song 
length longer than the average song length.
Return the Name and Milliseconds for each track.
Order by the song length with the longest songs 
listed first.*/
select name ,milliseconds from track
where milliseconds > (
select avg(milliseconds) from track)
order by milliseconds desc
;

#---Question Set-3:---ADVANCE LEVEL

