select * from TB_COMPANIES WHERE status = 'approved';
  SELECT * FROM TB_COMPANIES
        WHERE status = 'approved';

SELECT DISTINCT *
FROM TB_COMPANIES
WHERE registration_number IN (
    SELECT DISTINCT registration_number
	FROM TB_COMPANIES
);

SELECT *
FROM TB_COMPANIES
WHERE registration_number IN (
    SELECT registration_number
    FROM TB_COMPANIES
    GROUP BY registration_number
    HAVING COUNT(*) = 1
)
UNION
SELECT *
FROM TB_COMPANIES
WHERE registration_number IN (
    SELECT registration_number
    FROM TB_COMPANIES
    GROUP BY registration_number
    HAVING COUNT(*) > 1
);

SELECT DISTINCT registration_number
FROM TB_COMPANIES;

 SELECT * FROM (SELECT * FROM TB_COMPANIES  WHERE status = 'approved' and round = 2) c
