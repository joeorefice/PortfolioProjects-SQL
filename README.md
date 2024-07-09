# PortfolioProjects-SQL

This repository contains SQL code and queries for a number of my data analysis portfolio projects.
<br>

### Analyze Twitch Gaming Data
**Code**: [analyze_twitch_gaming_data.sql](https://github.com/joeorefice/PortfolioProjects-SQL/blob/main/analyze_twitch_gaming_data.sql)

**Description**:  Data analysis project working with two tables containing Twitch users’ stream viewing data and chat room usage data.

Stream viewing data:
* stream table

Chat usage data:
* chat table

Dataset provided by Twitch Science Team - .csv files (800,000 rows) available from the following GitHub URL (https://github.com/Codecademy-Curriculum/Codecademy-Learn-SQL-from-Scratch/tree/master/Twitch)

**Skills**: data analysis, SQL table/database querying

**Results**: identification of the following metrics;
* unique games in stream table
* unique channels in stream table
* most popular games in stream table
* country location of stream viewers of League of Legends
* list of players and their number of streamers
* creation of genre and streaming hours columns in stream table
* joining stream and chat tables

<br>

### Bytes of China database creation  
**Code**: [bytes_of_china.sql](https://github.com/joeorefice/PortfolioProjects-SQL/blob/main/bytes_of_china.sql)

**Description**: Creation of a multi-table database underpinning a website for fictional restaurant. 

**Skills**: database creation, data analysis, SQL table/database querying

**Results**: successful creation and population of the restaurant, address, dish, review and category tables, identification of the following metrics;
* best review
* dish name, price and category sorted by dish name and category
* all spicy dishes with their prices and categories
* all dishes and the categories they span
* dishes that span more than one category 
* highest rating

<br>

### Warby Parker usage funnels  
**Code**: [warby_parker_usage_funnels.sql](https://github.com/joeorefice/PortfolioProjects-SQL/blob/main/warby_parker_usage_funnels.sql)

**Description**: Analysis of different marketing funnels in order to calculate conversion rates for American glasses manufacturer and retailer Warby Parker  

**Skills**: data analysis, SQL table/database querying

**Results**: identification of the following metrics;
* conversion percentage for each stage of style quiz
* creation of is_home_try_on and is_purchase values, comparison of conversion rates from completing quiz to home try on, and home try on to making a purchase
* calulating conversion rates for customers that tried on 3 pairs at home vs 5 pairs at home 
