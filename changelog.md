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
