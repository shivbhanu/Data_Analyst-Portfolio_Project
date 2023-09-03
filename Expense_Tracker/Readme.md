# Personal Expense Tracker 

## Introduction

I always wondered where my money was going every month. Here and there, in bits and pieces, some expenses accumulate and become significant by the end of the month. I tried using certain apps for tracking but couldn't get a hold of it. Then I thought, since I receive emails for each and every transaction from my bank, why not create an automated tracker for the same?

As the saying goes, we can improve what we can track, and hence the motivation for this project, **Expense Tracker**.

## Objective

To track my daily expenses and build automated report/tracker using transaction mails from bank.

## Subtasks 

- Import transaction emails from gmail.
- Collect and process the gmail body html and convert it to readable text.
- Identify patterns in body text to drill down below information:
  - Amount of Transaction
  - Mode : UPI, NetBanking, Debit Card, Credit Card, ATM withdrawal.
  - Source and Destination of Transaction.
  - Final flag : Expense , Saving, Credit Card Payment
- Build different visualization  from above processed data to get view on :
  - Lifetime Expenses : Monthly and Cumulative.
  - Mode wise Expenses
  - Savings : Monthly, Cumulative
  - Current months : Daily and Cumulative expenses ( used for report ).
 

## Data Description and Processing : 

- The most complicated part was to convert the data from email body into desired text format and then identify pattern from the text to classify the transaction. Below is the image of email data. 

 <p align="center">
  <img width="800" height="300" src="https://github.com/shivbhanu/Data_Analyst-Portfolio_Project/blob/main/Expense_Tracker/Images/email_msg_data.png">
</p> 

- Thanks to our python developers we have BeautifulSoup. This removed the images and all remaining clutter from the html and returned the body part of the mail.
Post this proecssing, the data looked like this:

 <p align="center">
  <img width="800" height="400" src="https://github.com/shivbhanu/Data_Analyst-Portfolio_Project/blob/main/Expense_Tracker/Images/msg_data_processed.png">
</p> 

- Next step was to idetify pattern and classify mail into Expense/Saving/Credit Card Payment transaction. After careful inspection, mostly all mails were classified into 5 Broad Categories : UPI, NetBanking, Debit Card, Credit Card, ATM withdrawal.

## Insights

- From July'19 to till date. I have spent around 46L INR. This includes all the transactions.

<p align="center">
  <img width="800" height="500" src="https://github.com/shivbhanu/Data_Analyst-Portfolio_Project/blob/main/Expense_Tracker/Images/total_expense.png">
</p> 

- UPI Contributes to ~81% of my overall lifetime expense.

  <p align="center">
  <img width="500" height="500" src="https://github.com/shivbhanu/Data_Analyst-Portfolio_Project/blob/main/Expense_Tracker/Images/mode_contri_lifetime.png">
</p> 

- Looking at graph of Day of Week vs Hour of Day for amount, we can clearly see that transactions with high amounts were done during the day time, around 10AM to 2PM and before 8PM except for Sundays where high amounts peaked after 8PM to 1PM.

   <p align="center">
  <img width="800" height="350" src="https://github.com/shivbhanu/Data_Analyst-Portfolio_Project/blob/main/Expense_Tracker/Images/dow_hod_amount.png">
</p> 

- However, if we look at the number of transactions instead of amount, we can clearly see that most transactions happened after 8PM on all days, peaking on Tuesday.


   <p align="center">
  <img width="800" height="350" src="https://github.com/shivbhanu/Data_Analyst-Portfolio_Project/blob/main/Expense_Tracker/Images/dow_hod_num.png">
</p> 


## Automated Report 

To better track my daily expenses and be on top of how far I am from the budget line, I created a report which shows my transaction behaviour and % of budget exhausted.



 <p align="center">
  <img width="1000" height="600" src="https://github.com/shivbhanu/Data_Analyst-Portfolio_Project/blob/main/Expense_Tracker/Images/August_summary.png">
</p> 


## Future Work 

- To automate a googlsheet report and deep dive on where I am spending. Further classification of transaction into classes like :
  - Grocery
  - Petrol
  - Food
  - Rent
  - Travel
  - Maintenance (Vehicle)
  - Others


Thanks for reading till this point. Much appreciated.

Have a look at my portfolio website and do let me know of any improvements : [Shiv Bhanu Singh](https://shivbhanusingh.com/)
  
