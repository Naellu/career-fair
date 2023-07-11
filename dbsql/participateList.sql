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

 SELECT * FROM (SELECT * FROM TB_COMPANIES  WHERE status = 'approved' and round = 2) c;


alter table TB_COMPANIES
add constraint TB_COMPANIES_ibfk_3
foreign key (round) references TB_EXHIBITION_INFO (round);

SELECT count(*) FROM TB_POSTING
WHERE company_id = 1 AND status = '마감';

DELETE FROM TB_POSTING WHERE member_id IS NULL;