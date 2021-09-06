CREATE TABLE public.bike_trip_data (
	ride_id character(16) PRIMARY KEY, rideable_type varchar(15), started_at timestamp, ended_at timestamp,
	start_station_name varchar(75), start_station_id smallint, end_station_name varchar(75), end_station_id smallint,
	start_lat decimal(3, 7), start_lng decimal(3, 7), end_lat decimal(3, 7) end_lng decimal(3,7), member_casual character(6)

);
