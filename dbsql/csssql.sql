SELECT i.industry_id, COUNT(i.industry_ID) FROM TB_POSTING p
RIGHT JOIN TB_INDUSTRIES i ON i.industry_id = p.industry_id
WHERE round = 1 GROUP BY industry_id;

