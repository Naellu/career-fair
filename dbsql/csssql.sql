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
GROUP BY notice_id
 ORDER BY modified DESC LIMIT 0, 10;


SELECT * FROM TB_MEMBERS;
DELETE FROM TB_MEMBERS WHERE member_id= 'chun2';
DELETE FROM TB_MEMBERS WHERE member_id= 'chuncom';
DELETE FROM TB_MEMBERS WHERE member_id= 'chuncom2';
DELETE FROM TB_MEMBERS WHERE member_id= 'user1';
DELETE FROM TB_MEMBERS WHERE member_id= 'user2';
DELETE FROM TB_MEMBERS WHERE member_id= 'user3';
DELETE FROM TB_MEMBERS WHERE member_id= 'user4';
DELETE FROM TB_MEMBERS WHERE member_id= 'user5';
DELETE FROM TB_MEMBERS WHERE member_id= 'user6';
DELETE FROM TB_MEMBERS WHERE member_id= 'user7';
DELETE FROM TB_MEMBERS WHERE member_id= 'user8';
DELETE FROM TB_MEMBERS WHERE member_id= 'user9';
DELETE FROM TB_MEMBERS WHERE member_id= 'user10';
-- DELETE FROM TB_MEMBERS WHERE member_id= 'anonymous';

-- SET FOREIGN_KEY_CHECKS = 0;

-- TRUNCATE TABLE TB_NOTICE;

-- TRUNCATE TABLE TB_JOB_APPLICATION;
-- TRUNCATE TABLE TB_SCRAP;
-- TRUNCATE TABLE TB_POSTING;

-- TRUNCATE TABLE TB_FILES;
-- INSERT INTO TB_FILES (round, file_name) VALUES (1, 'logo.png');
-- INSERT INTO TB_FILES (round, file_name) VALUES (1, 'info.png');

-- TRUNCATE TABLE TB_COMPANIES;

-- SET FOREIGN_KEY_CHECKS = 1;

SELECT * FROM TB_MEMBERS;


INSERT INTO TB_NOTICE (title, content, member_id, modifier_id)
VALUES
('제목1', '내용1', 'admin0', 'admin0'),
('제목2', '내용2', 'admin0', 'admin0'),
('제목3', '내용3', 'admin0', 'admin0'),
('제목4', '내용4', 'admin0', 'admin0'),
('제목5', '내용5', 'admin0', 'admin0'),
('제목6', '내용6', 'admin0', 'admin0'),
('제목7', '내용7', 'admin0', 'admin0'),
('제목8', '내용8', 'admin0', 'admin0'),
('제목9', '내용9', 'admin0', 'admin0'),
('제목10', '내용10', 'admin0', 'admin0'),
('제목11', '내용11', 'admin0', 'admin0'),
('제목12', '내용12', 'admin0', 'admin0'),
('제목13', '내용13', 'admin0', 'admin0'),
('제목14', '내용14', 'admin0', 'admin0'),
('제목15', '내용15', 'admin0', 'admin0'),
('제목16', '내용16', 'admin0', 'admin0'),
('제목17', '내용17', 'admin0', 'admin0'),
('제목18', '내용18', 'admin0', 'admin0'),
('제목19', '내용19', 'admin0', 'admin0'),
('제목20', '내용20', 'admin0', 'admin0'),
('제목21', '내용21', 'admin0', 'admin0'),
('제목22', '내용22', 'admin0', 'admin0'),
('제목23', '내용23', 'admin0', 'admin0'),
('제목24', '내용24', 'admin0', 'admin0'),
('제목25', '내용25', 'admin0', 'admin0'),
('제목26', '내용26', 'admin0', 'admin0'),
('제목27', '내용27', 'admin0', 'admin0'),
('제목28', '내용28', 'admin0', 'admin0'),
('제목29', '내용29', 'admin0', 'admin0'),
('제목30', '내용30', 'admin0', 'admin0');



SELECT * FROM career_fair.TB_NOTICE;











