
-- DDL --
CREATE TABLE public.bike_trip_data (
	ride_id text PRIMARY KEY, rideable_type text,  started_at timestamp, ended_at timestamp,
	start_station_name text, start_station_id text, end_station_name text, end_station_id text,
	start_lat decimal(20, 7), start_lng decimal(20, 7), end_lat decimal(20, 7), end_lng decimal(20,7),
	member_casual text

);
-- Calculate the interval between start and stops and set it as the value for the 'trip_dur' field
UPDATE public.bike_trip_data
SET trip_dur = age(ended_at, started_at)
;



-- Create a table for 'stations'
-- Since we are likely to use the start and end stations as filters for a lot
-- of our queries, we will create an index to improve performance
CREATE INDEX start_station_name_idx
	ON public.bike_trip_data (start_station_name);

CREATE INDEX end_station_name_idx
	ON public.bike_trip_data (end_station_name);

------

-- DQL --

-- Verifying that nulls for start and end locations only exist with the rideable_type
-- 'electric_bike'
SELECT *
FROM public.bike_trip_data
WHERE start_station_name IS NULL AND rideable_type <> 'electric_bike'
ORDER BY started_at ASC;

-- Count of each rideable type for each start location
SELECT start_station_name, rideable_type, count(ride_id) AS num_rides_starting_at_station
FROM public.bike_trip_data
GROUP BY start_station_name, rideable_type
ORDER BY start_station_name;

-- Syntax that queried the null count for each field
SELECT count(*) AS num_null_value
FROM public.bike_trip_data
WHERE bike_trip_data.[field_name] IS NULL;



-- Querying the nulls of each field
-- Created a temp table so that I can query and see the number of null values per field at once
WITH null_counts AS (
    SELECT (
               SELECT count(*)
               FROM bike_trip_data
               WHERE rideable_type IS NULL
           ) AS null_ride_types,
           (
               SELECT count(*)
               FROM bike_trip_data
               WHERE started_at IS NULL)
             AS start_times_nulls,
           (
               SELECT count(*)
               FROM bike_trip_data
               WHERE ended_at IS NULL)
             AS end_times_nulls,
           (
               SELECT count(*)
               FROM bike_trip_data
               WHERE start_station_id IS NULL)
             AS start_station_id_nulls,
           (
               SELECT count(*)
               FROM bike_trip_data
               WHERE start_station_name IS NULL)
             AS start_station_name_nulls,
           (
               SELECT count(*)
               FROM bike_trip_data
               WHERE end_station_id IS NULL)
             AS end_station_id_null,
           (
               SELECT count(*)
               FROM bike_trip_data
               WHERE end_station_name IS NULL)
             AS end_station_name_nulls,
           (
               SELECT count(*)
               FROM bike_trip_data
               WHERE start_lat IS NULL)
             AS start_lat_nulls,
           (
               SELECT count(*)
               FROM bike_trip_data
               WHERE start_lng IS NULL)
             AS start_lng_nulls,
           (
               SELECT count(*)
               FROM bike_trip_data
               WHERE end_lat IS NULL)
             AS end_lat_nulls,
           (
               SELECT count(*)
               FROM bike_trip_data
               WHERE end_lng IS NULL)
             AS end_lng_nulls,
           (
               SELECT count(*)
               FROM bike_trip_data
               WHERE weekday IS NULL)
             AS week_day_nulls,
           (
               SELECT count(*)
               FROM bike_trip_data
               WHERE weekday_name IS NULL)
             AS weekday_name_nulls
)
SELECT *
FROM null_counts



-- Querying the member status of electric_bike riders and seeing if there is any trend with null start ids
SELECT rideable_type, (
    SELECT count(*)
    FROM bike_trip_data
    WHERE member_casual = 'casual'
    ) AS cnt_casual,(
    SELECT count(*)
    FROM bike_trip_data
    WHERE member_casual = 'member'
    ) AS cnt_member
FROM bike_trip_data
WHERE rideable_type = 'electric_bike' AND start_station_id IS NULL
GROUP BY rideable_type


-- DML --

-- Create a column for weekday names
ALTER TABLE public.bike_trip_data
    ADD COLUMN weekday_name varchar(15);
UPDATE public.bike_trip_data
    SET weekday_name = to_char(started_at, 'day');


-- Weekday num
ALTER TABLE public.bike_trip_data
    DROP COLUMN weekday;
ALTER TABLE public.bike_trip_data
    ADD COLUMN weekday int;
UPDATE bike_trip_data
    SET weekday = EXTRACT(dow FROM started_at)
;
