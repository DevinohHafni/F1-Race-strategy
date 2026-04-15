--F1 RACE OPTIMIZATION
-- Total rows in dataset
SELECT COUNT(*) AS total_records FROM race;
-- Number of laps per race
SELECT race, COUNT(*) AS total_laps
FROM race
GROUP BY race
ORDER BY total_laps DESC;
-- Avg lap time by race
SELECT race, ROUND(AVG("LapTime_sec")::numeric, 2) AS avg_lap_time
FROM race
GROUP BY race
ORDER BY avg_lap_time;
-- Top 10 fastest drivers
SELECT "Driver", ROUND(AVG("LapTime_sec")::numeric, 2) AS avg_time
FROM race
GROUP BY "Driver"
ORDER BY avg_time ASC;
-- Position impact
SELECT "Position", ROUND(AVG("LapTime_sec")::numeric, 2) AS avg_time
FROM race
GROUP BY "Position"
ORDER BY "Position";
-- Unusually slow laps
SELECT "Driver", race, "LapTime_sec"
FROM race
WHERE "LapTime_sec" > 110
ORDER BY "LapTime_sec" DESC;
-- Lap time vs tire age
SELECT "Compound", "LapInStint", 
       ROUND(AVG("LapTime_sec")::numeric, 2) AS avg_time
FROM race
GROUP BY "Compound", "LapInStint"
ORDER BY "Compound", "LapInStint";
-- Compare lap time before vs after pit stop
SELECT "Driver",
       ROUND(AVG(CASE WHEN "PitInTime" IS NOT NULL THEN "LapTime_sec" END)::numeric, 2) AS pit_laps,
       ROUND(AVG(CASE WHEN "PitInTime" IS NULL THEN "LapTime_sec" END)::numeric, 2) AS normal_laps
FROM race
GROUP BY "Driver";





