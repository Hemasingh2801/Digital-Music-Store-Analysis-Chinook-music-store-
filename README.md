# Digital-Music-Store-Analysis(Chinook-music-store)

# Problem Statement

The digital music store generates large amounts of data related to customers, artists, albums, tracks, invoices, and sales transactions. However, this raw data does not directly provide business insights.

The objective of this project is to analyze the Chinook music store database using SQL to answer important business questions such as:

Who are the most valuable customers?
Which cities and countries generate the most revenue?
What are the most popular music genres?
Which artists generate the most sales?
Customer purchasing behavior analysis

The goal is to transform raw transactional data into meaningful insights that can support business decision-making, marketing strategies, and customer engagement improvements.

# Task List
The project tasks were divided into three difficulty levels:

#Easy Level Tasks

1. Find the senior most employee
2. Identify countries with highest invoices
3. Find top 3 invoice totals
4. Identify city generating highest revenue
5. Find best customer based on spending

#Moderate Level Tasks

1. Find Rock music listeners
2. Identify top Rock artists
3. Find tracks longer than average duration

#Advanced Level Tasks

1. Calculate money spent by customers on artists
2. Find best selling artist revenue contribution
3. Identify most popular genre by country
4. Find top spending customer in each country

# Tables Provided
The Chinook database contains 11 tables:

1. Employee -> Store staff details
2. Customer -> Customer information
3. Invoice ->	 Purchase transactions
4. Invoice_Line ->	Purchase details
5. Track ->	Music track details
6. Album ->	Album information
7. Artist ->	Artist details
8. Genre ->	Music category
9. Media_Type ->	File formats
10. Playlist ->	Playlist data
11. Playlist_Track ->	Track mapping

# ER Diagram of the  normalized database

<img width="710" height="574" alt="MusicDatabaseSchema" src="https://github.com/user-attachments/assets/34ce2245-d4d9-4c3b-978a-dd46638f4f7e" />

# Business Questions & Analysis Tasks

1. Basic Level:
<img width="466" height="190" alt="image" src="https://github.com/user-attachments/assets/0d7537e1-89b4-438b-b59e-5698033620f7" />

2. Moderate Level:
<img width="469" height="123" alt="image" src="https://github.com/user-attachments/assets/3ca030ba-a225-44ad-a5d3-69d2f8a7c261" />

3. Advance Level:
<img width="469" height="176" alt="image" src="https://github.com/user-attachments/assets/b96e34ff-fdfd-44ae-a206-6a9027e1208e" />

# Insights & Recommendations

1. Revenue Growth:

• Focus on USA Market: Since USA generates the highest number of invoices (131 invoices), Chinook should run targeted promotions and loyalty programs in this region.

<img width="275" height="164" alt="image" src="https://github.com/user-attachments/assets/87290436-1b3c-431d-ac11-ab9b99bf2237" />

• Target High Revenue Cities: Prague generates the highest revenue ($273.24), so marketing campaigns and exclusive offers should be focused there.

• Increase High Value Purchases: Since the highest invoice is only $23.76, bundle offers and album packages could increase transaction values.

2. Customer Strategy

• Retain Top Customers: František Wichterlová spent the highest ($144.54), so Chinook should introduce VIP benefits, early releases, and loyalty rewards.

<img width="275" height="80" alt="image" src="https://github.com/user-attachments/assets/231e1bff-18b3-4794-911e-f2d3520b17d4" />

• Country-wise Customer Retention: Top customers like Luís Gonçalves ($108.90) and François Tremblay ($99.99) should receive personalized offers.

• Reduce Customer Concentration Risk: Since revenue is dependent on a small number of customers, Chinook should focus on growing mid-tier customers.

3. Product & Music Strategy

• Promote Rock Genre: Since Rock is the most purchased genre (example: 561 purchases in USA), Chinook should:

Expand Rock catalog

Promote Rock playlists

Recommend Rock artists

• Promote Best Selling Artists: Since Iron Maiden generated about $138.60, Chinook should feature top artists on homepage recommendations.

<img width="362" height="221" alt="image" src="https://github.com/user-attachments/assets/df28ce32-27db-4ecc-995c-58ebe69511ae" />

4. Marketing Channel

• Genre Based Recommendations: Since customers repeatedly purchase similar genres, Chinook should implement recommendation systems.

• Email Marketing: Send genre-based offers to Rock listeners.

• Artist Promotion Campaigns: Promote top 10 artists with highest track counts.

5. Customer Behavior

• Increase Repeat Purchases:Since customers with multiple invoices generate more revenue, Chinook should:

a. Offer repeat purchase discounts

b. Provide loyalty points

c. Offer subscription models

• Geographic Targeting:Since USA, Canada, and Brazil are top markets, Chinook should prioritize marketing spend there.

# Strategic Recommendation

Based on the analysis, Chinook should focus on:

• Customer retention (top 10 customers)

• Genre expansion (Rock music)

• Geographic targeting (USA market)

• Artist promotion (top revenue artists)

This will help increase customer lifetime value and overall revenue growth.
