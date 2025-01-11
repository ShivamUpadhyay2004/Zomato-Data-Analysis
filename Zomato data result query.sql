create database Zomato_data_analysis ;

use Zomato_data_analysis ;



select * from zomato_data ;


--------------  1 . What type of restaurant do the majority of customers order from?


SELECT listed_in_type as resturant_type , COUNT(*) as count
FROM zomato_data
GROUP BY resturant_type 
ORDER BY count DESC
LIMIT 5; 


-------------- Conclusion: Majority of the Resturants (Orders) falls in Dinning Category.







-------------- 2 . How many votes has each type of restaurant received from customers?


SELECT listed_in_type as Resturant_types , SUM(votes) as total_votes
FROM zomato_data
GROUP BY listed_in_type 
order by  total_votes desc ;







-------------- Conclusion: Dining Resturants have received maximum votes(20,363)






----------------- 3 . What are the ratings that the majority of restaurants have received?


SELECT rate, COUNT(*) as resturant_count
FROM zomato_data
GROUP BY rate
ORDER BY resturant_count DESC
LIMIT 10;



-------------- Conclusion: The majority resturants received the rating from 3.5 to 4 (mainly 3.8)







----------------- 4. Zomato has observed that most couples order most of their food online. 
----------------- What is their average spending on each order?


SELECT AVG(approx_cost_2_people) as average_spending
FROM zomato_data
WHERE online_order = 'Yes';







-------------- Conclusion: The Majority of Couples prefers resturants with an approx cost of 500 - 550 INR(510 INR).






-------------------- 5. Which mode (online or offline) has received the maximum rating?


SELECT online_order, AVG(CAST(SUBSTRING(rate, 1, 3) AS FLOAT)) as avg_rating
FROM zomato_data
GROUP BY online_order
ORDER BY avg_rating DESC
LIMIT 2;




-------------- Conclusion: Offline orders received lower ratings in compare to Online orders.

 








-------------------- 6. which type of resturants receives more offline orders.
 -------------------- so that zomato can provide customers with some good offers




SELECT 
  listed_in_type as restaurant_type,
  COUNT(CASE WHEN online_order = 'No' THEN 1 END) AS offline_order_count,
  COUNT(CASE WHEN online_order = 'Yes' THEN 1 END) AS online_order_count
FROM zomato_data
GROUP BY  listed_in_type
ORDER BY offline_order_count DESC;



-------------- Conclusion: Dining Resturants primarily offers offline orders.
-------------- Whereas cafes primarily receives online orders.
-------------- this suggests that prefers to order in person in resturants, but prefers online ordering at cafes.