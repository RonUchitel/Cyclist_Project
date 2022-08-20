SELECT *
FROM Cyclistic..[202108]

--Add time started riding and stopped riding time columns
SELECT CAST(started_at as time)
FROM Cyclistic..[202108]

ALTER TABLE [202108]
Add StartTime time;

Update [202108]
SET StartTime = CAST(started_at as time)

ALTER TABLE [202108]
Add EndedTime time;

Update [202108]
SET EndedTime = CAST(ended_at as time)

--Calculate the ride length
SELECT ended_at-started_at as Ride_Length
FROM Cyclistic..[202108]

ALTER TABLE [202108]
Add Ride_Length time;

Update [202108]
SET Ride_Length = ended_at-started_at 

--Checking If there is any negative values which means that the "ended_at" date bigger than "started_at" date
SELECT * 
FROM [202108] 
WHERE Ride_Length < '00:00:00'

--Or (Check minimum length_ride)
SELECT MIN(Ride_Length)
FROM Cyclistic..[202108]
--There is no negetive times in ride_length wich means "started_at" date and "ended_at" date are the same

--Dropping end_at Column
ALTER TABLE [202108]
DROP COLUMN end_at;

--Adding a date column
ALTER TABLE [202108]
Add Ride_Date date;

Update [202108]
SET Ride_Date = started_at 

--Addding the day of the week 
SELECT DATENAME(WEEKDAY, started_at)
FROM Cyclistic..[202108]

ALTER TABLE [202108]
Add Week_Day nvarchar(255);

Update [202108]
SET Week_Day = DATENAME(WEEKDAY, started_at)

--Dropping started_at column
ALTER TABLE [202108]
DROP COLUMN started_at;
