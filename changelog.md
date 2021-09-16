---
# Bike Sharing Analysis
Anthony VanSlambrouck
---
# Changes
### ***2021-09-16***
- Imported csvs into PostgreSQL
- Unique constraint error when loading in 202012-divy-tripdata.csv. 209 rows have the same ride_id as other rows in the dataset, and are not included in the database
- Added columns 'trip_dur' and 'weekday' to indicate the length of the ride duration and the day of the week it fell on
- Added column 'weekday_name' to display the day of the week as a string
- Indexes created on start and end station ids, trip duration, and weekday_name in *pgAdmin*

***Data Structure***
- There are 5,910,407 rows in the dataset
