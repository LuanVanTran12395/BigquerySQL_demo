-- 1) Chi Phí
WITH chiphi AS (SELECT
                  FORMAT_DATE('%B, %Y', date) AS thoiGian,
                  'Chi Phí'                AS khoanMucChinh,
                  cost_category            AS khoanMucPhu,
                  -1 * SUM(cost)           AS `Thu nhập`
                FROM `project-tranvanluan-2025.mydataset.cost_sale_table`
                WHERE cost IS NOT NULL
                GROUP BY thoiGian,khoanMucPhu),

-- 2. tách combo và làm phẳng bằng UNNEST
   split_combo AS (SELECT  id,
                    FORMAT_DATE('%B, %Y',date) AS thoiGian,
                  'Thu Nhap' AS khoanMucChinh,
                  sales_amount,
                    khoanMucPhu,
            FROM `project-tranvanluan-2025.mydataset.cost_sale_table`,
                UNNEST (REGEXP_EXTRACT_ALL(course, r'KH\d{2}')) AS khoanMucPhu
            ),
--3.join course_fee
     full_rev AS (SELECT c.*, f. course_fee
                  FROM split_combo c
                      LEFT JOIN `project-tranvanluan-2025.mydataset.course_fee` f
                      ON c.khoanMucPhu = f.course
                  ORDER BY c.id),
--4. Thu Nhập
     thunhap AS (SELECT id, thoiGian,khoanMucChinh,khoanMucPhu,
                        sales_amount*(IFNULL(course_fee,1)/SUM(IFNULL(course_fee,1)) OVER (PARTITION BY id)) AS `Thu nhập`
                  FROM full_rev)
SELECT *
FROM chiphi
UNION ALL
SELECT thoiGian, khoanMucChinh, khoanMucPhu, `Thu Nhập`
FROM thunhap
ORDER BY thoiGian;