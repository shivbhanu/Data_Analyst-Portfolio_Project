# Instacart Customer Analysis

## Introduction

Instacart is a technology company that operates as a same-day grocery delivery and pick up service in the U.S. and Canada. Customers shop for groceries through the Instacart mobile app or Instacart.com from various retailer partners. The order is shopped and delivered by an Instacart personal shopper. Their goal is to ensure customers get their groceries delivered reliably, to lift up our retail partners, and to provide flexible earnings opportunities for shoppers.

### Objectives:
- Analyze the anonymized [data](https://www.kaggle.com/c/instacart-market-basket-analysis/data) of 3 million grocery orders from more than 200,000 Instacart users open sourced by Instacart.
- Identify any pattern of what customers buy and how often they buy them.
- Use SQL, Python to perform EDA and Tableau for visualization.


## Data Description

- **aisles:** This file contains different aisles and there are total 134 unique aisles.

- **departments:** This file contains different departments and there are total 21 unique departments.

- **orders:** This file contains all the orders made by different users. From below analysis, we can conclude following:
    - There are total 3421083 orders made by total 206209 users.
    - The total orders per customer ranges from 0 to 100.
    - Based on the plot of 'Orders VS Day of Week' we can map 0 and 1 as Saturday and Sunday respectively based on the assumption that most of the people buy groceries on weekends.
    - Majority of the orders are made during the day time.  
    - Customers order once in a week which is supported by peaks at 7, 14, 21 and 30 in 'Orders VS Days since prior order' graph.
    - Based on the graph between 'Day of Week' and 'Hour of Day,' we can say that Saturday afternoons and Sunday mornings are prime time for orders.

<p align="center">
  <img width="500" height="300" src="https://github.com/shivbhanu/Data_Analyst-Portfolio_Project/blob/main/Instacart%20Customer%20Analysis/Plots/Order_DOW_HOD.png">
</p>


<p align="center">
  <img width="500" height="300" src="https://github.com/shivbhanu/Data_Analyst-Portfolio_Project/blob/main/Instacart%20Customer%20Analysis/Plots/Day_of_Week.png">
</p>

- **products:** This file contains the list of total 49688 products and their aisle as well as department. The number of products in different aisles and different departments are different.


## Exploratory Data Analysis

- This plot shows top 20 aisle basis number of products bought. We can see that fresh fruits and vegetables have very high reorders than the packaged ones.

 <p align="center">
  <img width="500" height="300" src="https://github.com/shivbhanu/Data_Analyst-Portfolio_Project/blob/main/Instacart%20Customer%20Analysis/Plots/Aisle_Orders.png">
</p> 

- Top bought departments with their reorder ratios. Procude and Dairy eggs are clear winner. 

   <p align="center">
  <img width="500" height="300" src="https://github.com/shivbhanu/Data_Analyst-Portfolio_Project/blob/main/Instacart%20Customer%20Analysis/Plots/Dept_Orders.png">
</p> 

- In tems of top products , many organic products are most popular ones.
  
<p align="center">
  <img width="500" height="300" src="https://github.com/shivbhanu/Data_Analyst-Portfolio_Project/blob/main/Instacart%20Customer%20Analysis/Plots/Most-popular-products.png">
</p> 



## Customer Insights 

Apart from above insights, lets deep-dive into some user behaviours and patterns. 

- **Re-ordering Pattern** : Most of the reorders happen on weekly/monthly basis i.e. 7th, 14th, 21st and 30th day of order. We can clearly see spikes in reorders on these days.

<p align="center">
  <img width="600" height="400" src="https://github.com/shivbhanu/Data_Analyst-Portfolio_Project/blob/main/Instacart%20Customer%20Analysis/Plots/Re-Ordering%20Pattern.png">
</p>   

- **Coke vs Pepsi** : In the battle of Coke vs Pepsi, Coke is the clear winner.

<p align="center">
  <img width="600" height="400" src="https://github.com/shivbhanu/Data_Analyst-Portfolio_Project/blob/main/Instacart%20Customer%20Analysis/Plots/Coke_vs_Pepsi.png">
</p> 
  
- **Order Aggregates** : Below are some important platform averages.

<p align="center">
  <img width="300" height="200" src="https://github.com/shivbhanu/Data_Analyst-Portfolio_Project/blob/main/Instacart%20Customer%20Analysis/Plots/Agg_Platform.png">
</p> 



## Future Work 

- We can perform customer segmentation using ML model to identify and target customers with similar preferences.
