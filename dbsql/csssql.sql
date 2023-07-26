SELECT i.industry_id, i.industry_name,COUNT(i.industry_ID) FROM TB_POSTING p
LEFT JOIN TB_INDUSTRIES i ON i.industry_id = p.industry_id
WHERE round = 1 GROUP BY industry_id;

SELECT i.industry_id, i.industry_name, IFNULL(COUNT(p.industry_id), 0) AS count
FROM TB_INDUSTRIES i
LEFT JOIN TB_POSTING p ON i.industry_id = p.industry_id AND round = 1 AND status = '채용중'
GROUP BY i.industry_id;

SELECT posting_id, title, company_name, application_count 
FROM (SELECT * FROM VIEW_POSTING WHERE round = 1) p
WHERE application_count != 0 
ORDER BY application_count DESC 
LIMIT 5;

SELECT n.*, count(f.file_id) count FROM TB_NOTICE n 
LEFT JOIN TB_FILES f
ON n.notice_id = f.notice_id
GROUP BY notice_id;