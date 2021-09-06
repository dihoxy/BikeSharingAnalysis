---
# BikeSharingAnalysis
## By: *Anthony VanSlambrouck*
## Date: *09/06/2021*
---
# Google Data Analyitics Capstone Project

(*note - cyclistic is a fictional company*)
## Business Task 
*Analyze 16 months worth of bike sharing data to inform marketing strategy on the prospect of converting current "casual" riders into annual members over targeting new customers*
### Project Questions
- How do annual members differ from casual riders?
- What similarities are there between the two groups?
- What differences are there?
#### Problem Type
- Discovering Conncections
- Categorizing things
- Finding Patterns
### Who are our key stakeholders and characters?
- **Cyclistic**: A bike-share program with 5,800 bicycles and 600 docking stations
- **Lily Moreno**: Director of Marketing
- **Cyclistic Marketing Analytics Team**: Current team
- **Cyclistic Executive Team***
- **Cyclistic customers**
- **The City of Chicago**
### How will this data help solve our problem?
The data is current (last dataset was for July 2021), comprehensive (covers trip durartion, start and stop distance and member status), and 

## Data
The 16 months worth of data live in 16 different csv files. All files have the same columns: 
- ride_id(character): the id assigned to that trip
- rideable_type(category)
- started_at(timestamp m/dd/YYYY HH:MM): start of trip
- ended_at(timestamp m/dd/YYYY HH:MM): end of trip
- start_station_name(variable character): name of start station
- start_station_id(int): start station id
- end_station_name(variable character): name of end station
- end_station_id(int): end station id
- start_lat(geo): latitude of start location
- start_lng(geo): longitude of start location
- end_lat(geo): end station latitude
- end_lng(geo): end station longitude
- member_casual(category): member or casual rider

### Sources of Data
- Accessed via Coursera Google Capstone Case Study
- License provided can be found [here](https://www.divvybikes.com/data-license-agreement)
### Location of Data
- Located in a repository on GitHub; on local pc, stored in the "DataAnalysis" directory in the "Bike Sharing" subfolder
### Data Structure
- The data is organized chronologically from 04/2020 to 07/2020
- 13 fields (columns)
### Data Issues
- The datetime columns should be broken up into two columns: *date* and *time* for each datetime field (i.e. start and end)
- We should convert the *member_casual* field into a boolean *1* or *0* for member status (1 for Member, 0 for casual)
- If we use a spatial solution when implementing our RDMS, we need to pay special attention to how our lat and long are formatted

