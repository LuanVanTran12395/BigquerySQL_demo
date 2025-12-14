-- Giả sử staffID 1 phải làm 15 task theo thứ tự. Task nào hoàn thành từ 7 ngày trở đi thì sẽ bị đánh dấu là trễ.
-- 1 staff thì trễ max 3 lần. Bắt đầu từ lần trễ thứ 3 thì các task tiếp theo sẽ được đánh số thứ tự tăng dần bắt đầu từ 1 để theo dõi
WITH cumulative_count_late AS (SELECT
                          staffID,
                          taskID,
                          CAST(REGEXP_EXTRACT(taskID,r'\d+')AS INT) AS task_num,
                          NumOfDayToComplete,
                          CASE WHEN NumOfDayToComplete >= 7 THEN 1 ELSE 0 END AS is_late,
              SUM(CASE WHEN NumOfDayToComplete >= 7 THEN 1 ELSE 0 END) OVER (PARTITION BY staffID 
                                                                      ORDER BY CAST(REGEXP_EXTRACT(taskID,r'\d+')AS INT)) AS cum_late
                      FROM `project-tranvanluan-2025.mydataset.Ex_19`),
-- ták thứ mấy bị trễ lần thứ 3 ở mỗi staff ID
      task_third_rank AS (SELECT *,
                                MIN (CASE 
                                        WHEN cum_late =3 THEN task_num
                                        ELSE NULL END) OVER (PARTITION BY staffID) AS third_late_task,
                                ROW_NUMBER() OVER (PARTITION BY staffID 
                                                    ORDER BY task_num) AS rank
                          FROM cumulative_count_late)
SELECT staffID, taskID, NumOfDayToComplete,
       CASE 
         WHEN rank > third_late_task THEN rank - third_late_task
         ELSE NULL END AS Cnt
FROM task_third_rank
--2. Out ra những lần win liên tiếp của từng staff ID
SE