-- This query counts the total number of lessons, as well as the number of individual,
-- group, and ensemble lessons given by instructors during the specified year.
SELECT
  -- Extract the month from the scheduled time slot of each lesson.
  EXTRACT(MONTH FROM scheduled_time_slot) AS month,
  -- Count the number of lessons that were given in each month.
  COUNT(*) AS total_lessons,
  -- Count the number of individual lessons that were given in each month.
  SUM(CASE WHEN lesson_type = 'individual' THEN 1 ELSE 0 END) AS individual_lessons,
  -- Count the number of group lessons that were given in each month.
  SUM(CASE WHEN lesson_type = 'group' THEN 1 ELSE 0 END) AS group_lessons,
  -- Count the number of ensemble lessons that were given in each month.
  SUM(CASE WHEN lesson_type = 'ensemble' THEN 1 ELSE 0 END) AS ensemble_lessons
FROM (
  -- Combine all lessons into a single table.
  SELECT il.student_id, il.available_time AS scheduled_time_slot, 'individual' AS lesson_type
  FROM individual_lesson il
  UNION ALL
  SELECT gl.student_id, gl.scheduled_time_slot, 'group' AS lesson_type
  FROM group_lesson gl
  UNION ALL
   SELECT e.instructor_id, e.scheduled_time_slot, 'ensemble' AS lesson_type
  FROM ensemble e
) AS lessons
-- Filter out lessons that were not given during the specified year.
WHERE EXTRACT (YEAR FROM scheduled_time_slot) = 2022
GROUP BY month;
