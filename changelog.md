---
# Bike Sharing Analysis 
## Anthony VanSlambrouck
---
# Changes
***2021-09-06***
- Set up IDE environment in Pycharm, and PgAdmin(for postgreSQL)
- Created README and CHANGELOG files 
- Set version control system (VCS) to Git and created a repository in GitHub
- Connected VCS to Pycharm
- Uploaded 04-2020 and 05-2020 to database
- Corrected date of ride id 97CC2520F1C7A269 from 0006-05-25 to 2020-05-25 for the start_at column
----
***2021-09-07***
- Uploaded 06-2020, 07-2020, 08-2020
- Deleted all records from database due to errors while importing csvs (*Conversion error due to smallint datatype too small to handle start and end ids)*
- Changed field "ride_id" to varchar(20), and set start and end ids to type *integer*
- Changed Pycharm import settings to "first row is header"
- Starting in 12-2020, start and end ids contain a string of numbers and
----
***2021-09-09***
- Changed all character fields to type "text"
- Changed start and end station ids to type "text" (since some datasets contain characters in their ids)
- 202012 file has 209 unique pk violations
----
***2021-09-10***
- Finished importing all csvs into database


--- Inspecting the Dataset ---
- No Null Values in start and end datetimes
- 369,356 rows have no start station ids, of those 369,331 rows have no start station names 
- 409,615 rows have no end station ids, of those 409,154 rows have no end station names
- 9,288 rows have no end station id and no end station name and are NOT rideable_type 'electric_bike'
- No Null Values in start lat and lng
- 6,904 null values for end lat and lng
- No null values for member/casual

--- New Files ---
- Created jupyter notebook for Python analysis
----
***2021-09-14***
- Exported merged (uncleaned) dataset to a new csv 
