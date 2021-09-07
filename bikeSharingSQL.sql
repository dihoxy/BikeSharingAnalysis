CREATE TABLE public.bike_trip_data (
	ride_id text PRIMARY KEY, rideable_type text, started_at timestamp, ended_at timestamp,
	start_station_name text, start_station_id text, end_station_name text, end_station_id text,
	start_lat decimal(20, 7), start_lng decimal(20, 7), end_lat decimal(20, 7), end_lng decimal(20,7),
	member_casual text

);

-- Since we know that we will likely calling on the start and end ids
-- a lot, we will create an index on them
CREATE INDEX CONCURRENTLY start_station_id_idx
	ON public.bike_trip_data USING btree
	(start_station_id ASC NULLS LAST)
;
-- CONCURRENTLY is specified since our table already has data as of
-- this index

CREATE INDEX CONCURRENTLY end_station_id_idx
	ON public.bike_trip_data USING btree
	(end_station_id ASC NULLS LAST)
;
