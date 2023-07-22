CREATE VIEW VIEW_POSTING
AS
SELECT p.*, c.company_name
FROM TB_POSTING p JOIN TB_COMPANIES c
ON p.company_id = c.company_id;


CREATE VIEW VIEW_POSTING
AS
SELECT p.*, c.company_name, f.file_name
FROM TB_POSTING p
JOIN TB_COMPANIES c ON p.company_id = c.company_id
LEFT JOIN TB_FILES f ON c.company_id = f.company_id AND f.file_name = 'logo.PNG';

SELECT * FROM VIEW_POSTING;

SELECT * FROM (SELECT * FROM VIEW_POSTING WHERE status = '채용중') c;

UPDATE TB_POSTING SET experience_level = '경력무관' WHERE experience_level = '무관';

SELECT * FROM TB_POSTING;
UPDATE TB_POSTING SET end_date = '2023-08-30' WHERE status != '마감' AND end_date= '2023-07-17';




