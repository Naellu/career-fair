ALTER TABLE `NOTICE` ADD COLUMN `hit` INT DEFAULT 0;

-- 외래키 임시 비활성화
SET FOREIGN_KEY_CHECKS = 0;

-- 테이블 초기화
TRUNCATE TABLE TB_NOTICE;


-- 외래 키 제약 조건 설정
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO TB_NOTICE (title, content, member_id)
VALUES
('제목1', '내용1', 'chun'),
('제목2', '내용2', 'chun'),
('제목3', '내용3', 'chun'),
('제목4', '내용4', 'chun'),
('제목5', '내용5', 'chun'),
('제목6', '내용6', 'chun'),
('제목7', '내용7', 'chun'),
('제목8', '내용8', 'chun'),
('제목9', '내용9', 'chun'),
('제목10', '내용10', 'chun'),
('제목11', '내용11', 'chun'),
('제목12', '내용12', 'chun'),
('제목13', '내용13', 'chun'),
('제목14', '내용14', 'chun'),
('제목15', '내용15', 'chun'),
('제목16', '내용16', 'chun'),
('제목17', '내용17', 'chun'),
('제목18', '내용18', 'chun'),
('제목19', '내용19', 'chun'),
('제목20', '내용20', 'chun'),
('제목21', '내용21', 'chun'),
('제목22', '내용22', 'chun'),
('제목23', '내용23', 'chun'),
('제목24', '내용24', 'chun'),
('제목25', '내용25', 'chun'),
('제목26', '내용26', 'chun'),
('제목27', '내용27', 'chun'),
('제목28', '내용28', 'chun'),
('제목29', '내용29', 'chun'),
('제목30', '내용30', 'chun'),
('제목31', '내용31', 'chun'),
('제목32', '내용32', 'chun'),
('제목33', '내용33', 'chun'),
('제목34', '내용34', 'chun'),
('제목35', '내용35', 'chun'),
('제목36', '내용36', 'chun'),
('제목37', '내용37', 'chun'),
('제목38', '내용38', 'chun'),
('제목39', '내용39', 'chun'),
('제목40', '내용40', 'chun'),
('제목41', '내용41', 'chun'),
('제목42', '내용42', 'chun'),
('제목43', '내용43', 'chun'),
('제목44', '내용44', 'chun'),
('제목45', '내용45', 'chun'),
('제목46', '내용46', 'chun'),
('제목47', '내용47', 'chun'),
('제목48', '내용48', 'chun'),
('제목49', '내용49', 'chun'),
('제목50', '내용50', 'chun'),
('제목51', '내용51', 'chun'),
('제목52', '내용52', 'chun'),
('제목53', '내용53', 'chun'),
('제목54', '내용54', 'chun'),
('제목55', '내용55', 'chun'),
('제목56', '내용56', 'chun'),
('제목57', '내용57', 'chun'),
('제목58', '내용58', 'chun'),
('제목59', '내용59', 'chun'),
('제목60', '내용60', 'chun'),
('제목61', '내용61', 'chun'),
('제목62', '내용62', 'chun'),
('제목63', '내용63', 'chun'),
('제목64', '내용64', 'chun'),
('제목65', '내용65', 'chun'),
('제목66', '내용66', 'chun'),
('제목67', '내용67', 'chun'),
('제목68', '내용68', 'chun'),
('제목69', '내용69', 'chun'),
('제목70', '내용70', 'chun');

INSERT INTO TB_NOTICE (title, content, member_id)
VALUES
('제목71', '내용71', 'chun'),
('제목72', '내용72', 'chun'),
('제목73', '내용73', 'chun'),
('제목74', '내용74', 'chun'),
('제목75', '내용75', 'chun'),
('제목76', '내용76', 'chun'),
('제목77', '내용77', 'chun'),
('제목78', '내용78', 'chun'),
('제목79', '내용79', 'chun'),
('제목80', '내용80', 'chun'),
('제목81', '내용81', 'chun'),
('제목82', '내용82', 'chun'),
('제목83', '내용83', 'chun'),
('제목84', '내용84', 'chun'),
('제목85', '내용85', 'chun'),
('제목86', '내용86', 'chun'),
('제목87', '내용87', 'chun'),
('제목88', '내용88', 'chun'),
('제목89', '내용89', 'chun'),
('제목90', '내용90', 'chun'),
('제목91', '내용91', 'chun'),
('제목92', '내용92', 'chun'),
('제목93', '내용93', 'chun'),
('제목94', '내용94', 'chun'),
('제목95', '내용95', 'chun'),
('제목96', '내용96', 'chun'),
('제목97', '내용97', 'chun'),
('제목98', '내용98', 'chun'),
('제목99', '내용99', 'chun'),
('제목100', '내용100', 'chun'),
('제목101', '내용101', 'chun'),
('제목102', '내용102', 'chun'),
('제목103', '내용103', 'chun'),
('제목104', '내용104', 'chun'),
('제목105', '내용105', 'chun'),
('제목106', '내용106', 'chun'),
('제목107', '내용107', 'chun'),
('제목108', '내용108', 'chun'),
('제목109', '내용109', 'chun'),
('제목110', '내용110', 'chun');

INSERT INTO TB_NOTICE (title, content, member_id, modifier_id)
VALUES
('제목제제제제제제제제제제제제제제제제제제제제제제제제제제제제제제제제제제제제제제제제제제제제제제제제', '내용112', 'chunnnnnnnnnnnnnnnnn', 'chunnnnnnnnnnnnnnnnn');


INSERT INTO TB_NOTICE (title, content, member_id, modifier_id, created, modified)
VALUES
('제목1', '내용1', 'chun', 'chun', NOW() + INTERVAL 1 SECOND, NOW() + INTERVAL 1 SECOND),
('제목2', '내용2', 'chun', 'chun', NOW() + INTERVAL 2 SECOND, NOW() + INTERVAL 2 SECOND),
('제목3', '내용3', 'chun', 'chun', NOW() + INTERVAL 3 SECOND, NOW() + INTERVAL 3 SECOND),
('제목4', '내용4', 'chun', 'chun', NOW() + INTERVAL 4 SECOND, NOW() + INTERVAL 4 SECOND),
('제목5', '내용5', 'chun', 'chun', NOW() + INTERVAL 5 SECOND, NOW() + INTERVAL 5 SECOND),
('제목6', '내용6', 'chun', 'chun', NOW() + INTERVAL 6 SECOND, NOW() + INTERVAL 6 SECOND),
('제목7', '내용7', 'chun', 'chun', NOW() + INTERVAL 7 SECOND, NOW() + INTERVAL 7 SECOND),
('제목8', '내용8', 'chun', 'chun', NOW() + INTERVAL 8 SECOND, NOW() + INTERVAL 8 SECOND),
('제목9', '내용9', 'chun', 'chun', NOW() + INTERVAL 9 SECOND, NOW() + INTERVAL 9 SECOND),
('제목10', '내용10', 'chun', 'chun', NOW() + INTERVAL 10 SECOND, NOW() + INTERVAL 10 SECOND),
('제목11', '내용11', 'chun', 'chun', NOW() + INTERVAL 11 SECOND, NOW() + INTERVAL 11 SECOND),
('제목12', '내용12', 'chun', 'chun', NOW() + INTERVAL 12 SECOND, NOW() + INTERVAL 12 SECOND),
('제목13', '내용13', 'chun', 'chun', NOW() + INTERVAL 13 SECOND, NOW() + INTERVAL 13 SECOND),
('제목14', '내용14', 'chun', 'chun', NOW() + INTERVAL 14 SECOND, NOW() + INTERVAL 14 SECOND),
('제목15', '내용15', 'chun', 'chun', NOW() + INTERVAL 15 SECOND, NOW() + INTERVAL 15 SECOND),
('제목16', '내용16', 'chun', 'chun', NOW() + INTERVAL 16 SECOND, NOW() + INTERVAL 16 SECOND),
('제목17', '내용17', 'chun', 'chun', NOW() + INTERVAL 17 SECOND, NOW() + INTERVAL 17 SECOND),
('제목18', '내용18', 'chun', 'chun', NOW() + INTERVAL 18 SECOND, NOW() + INTERVAL 18 SECOND),
('제목19', '내용19', 'chun', 'chun', NOW() + INTERVAL 19 SECOND, NOW() + INTERVAL 19 SECOND),
('제목20', '내용20', 'chun', 'chun', NOW() + INTERVAL 20 SECOND, NOW() + INTERVAL 20 SECOND),
('제목21', '내용21', 'chun', 'chun', NOW() + INTERVAL 21 SECOND, NOW() + INTERVAL 21 SECOND),
('제목22', '내용22', 'chun', 'chun', NOW() + INTERVAL 22 SECOND, NOW() + INTERVAL 22 SECOND),
('제목23', '내용23', 'chun', 'chun', NOW() + INTERVAL 23 SECOND, NOW() + INTERVAL 23 SECOND),
('제목24', '내용24', 'chun', 'chun', NOW() + INTERVAL 24 SECOND, NOW() + INTERVAL 24 SECOND),
('제목25', '내용25', 'chun', 'chun', NOW() + INTERVAL 25 SECOND, NOW() + INTERVAL 25 SECOND),
('제목26', '내용26', 'chun', 'chun', NOW() + INTERVAL 26 SECOND, NOW() + INTERVAL 26 SECOND),
('제목27', '내용27', 'chun', 'chun', NOW() + INTERVAL 27 SECOND, NOW() + INTERVAL 27 SECOND),
('제목28', '내용28', 'chun', 'chun', NOW() + INTERVAL 28 SECOND, NOW() + INTERVAL 28 SECOND),
('제목29', '내용29', 'chun', 'chun', NOW() + INTERVAL 29 SECOND, NOW() + INTERVAL 29 SECOND),
('제목30', '내용30', 'chun', 'chun', NOW() + INTERVAL 30 SECOND, NOW() + INTERVAL 30 SECOND),
('제목31', '내용31', 'chun', 'chun', NOW() + INTERVAL 31 SECOND, NOW() + INTERVAL 31 SECOND),
('제목32', '내용32', 'chun', 'chun', NOW() + INTERVAL 32 SECOND, NOW() + INTERVAL 32 SECOND),
('제목33', '내용33', 'chun', 'chun', NOW() + INTERVAL 33 SECOND, NOW() + INTERVAL 33 SECOND),
('제목34', '내용34', 'chun', 'chun', NOW() + INTERVAL 34 SECOND, NOW() + INTERVAL 34 SECOND),
('제목35', '내용35', 'chun', 'chun', NOW() + INTERVAL 35 SECOND, NOW() + INTERVAL 35 SECOND),
('제목36', '내용36', 'chun', 'chun', NOW() + INTERVAL 36 SECOND, NOW() + INTERVAL 36 SECOND),
('제목37', '내용37', 'chun', 'chun', NOW() + INTERVAL 37 SECOND, NOW() + INTERVAL 37 SECOND),
('제목38', '내용38', 'chun', 'chun', NOW() + INTERVAL 38 SECOND, NOW() + INTERVAL 38 SECOND),
('제목39', '내용39', 'chun', 'chun', NOW() + INTERVAL 39 SECOND, NOW() + INTERVAL 39 SECOND),
('제목40', '내용40', 'chun', 'chun', NOW() + INTERVAL 40 SECOND, NOW() + INTERVAL 40 SECOND),
('제목41', '내용41', 'chun', 'chun', NOW() + INTERVAL 41 SECOND, NOW() + INTERVAL 41 SECOND),
('제목42', '내용42', 'chun', 'chun', NOW() + INTERVAL 42 SECOND, NOW() + INTERVAL 42 SECOND),
('제목43', '내용43', 'chun', 'chun', NOW() + INTERVAL 43 SECOND, NOW() + INTERVAL 43 SECOND),
('제목44', '내용44', 'chun', 'chun', NOW() + INTERVAL 44 SECOND, NOW() + INTERVAL 44 SECOND),
('제목45', '내용45', 'chun', 'chun', NOW() + INTERVAL 45 SECOND, NOW() + INTERVAL 45 SECOND),
('제목46', '내용46', 'chun', 'chun', NOW() + INTERVAL 46 SECOND, NOW() + INTERVAL 46 SECOND),
('제목47', '내용47', 'chun', 'chun', NOW() + INTERVAL 47 SECOND, NOW() + INTERVAL 47 SECOND),
('제목48', '내용48', 'chun', 'chun', NOW() + INTERVAL 48 SECOND, NOW() + INTERVAL 48 SECOND),
('제목49', '내용49', 'chun', 'chun', NOW() + INTERVAL 49 SECOND, NOW() + INTERVAL 49 SECOND),
('제목50', '내용50', 'chun', 'chun', NOW() + INTERVAL 50 SECOND, NOW() + INTERVAL 50 SECOND),
('제목51', '내용51', 'chun', 'chun', NOW() + INTERVAL 51 SECOND, NOW() + INTERVAL 51 SECOND),
('제목52', '내용52', 'chun', 'chun', NOW() + INTERVAL 52 SECOND, NOW() + INTERVAL 52 SECOND),
('제목53', '내용53', 'chun', 'chun', NOW() + INTERVAL 53 SECOND, NOW() + INTERVAL 53 SECOND),
('제목54', '내용54', 'chun', 'chun', NOW() + INTERVAL 54 SECOND, NOW() + INTERVAL 54 SECOND),
('제목55', '내용55', 'chun', 'chun', NOW() + INTERVAL 55 SECOND, NOW() + INTERVAL 55 SECOND),
('제목56', '내용56', 'chun', 'chun', NOW() + INTERVAL 56 SECOND, NOW() + INTERVAL 56 SECOND),
('제목57', '내용57', 'chun', 'chun', NOW() + INTERVAL 57 SECOND, NOW() + INTERVAL 57 SECOND),
('제목58', '내용58', 'chun', 'chun', NOW() + INTERVAL 58 SECOND, NOW() + INTERVAL 58 SECOND),
('제목59', '내용59', 'chun', 'chun', NOW() + INTERVAL 59 SECOND, NOW() + INTERVAL 59 SECOND),
('제목60', '내용60', 'chun', 'chun', NOW() + INTERVAL 60 SECOND, NOW() + INTERVAL 60 SECOND),
('제목61', '내용61', 'chun', 'chun', NOW() + INTERVAL 61 SECOND, NOW() + INTERVAL 61 SECOND),
('제목62', '내용62', 'chun', 'chun', NOW() + INTERVAL 62 SECOND, NOW() + INTERVAL 62 SECOND),
('제목63', '내용63', 'chun', 'chun', NOW() + INTERVAL 63 SECOND, NOW() + INTERVAL 63 SECOND),
('제목64', '내용64', 'chun', 'chun', NOW() + INTERVAL 64 SECOND, NOW() + INTERVAL 64 SECOND),
('제목65', '내용65', 'chun', 'chun', NOW() + INTERVAL 65 SECOND, NOW() + INTERVAL 65 SECOND),
('제목66', '내용66', 'chun', 'chun', NOW() + INTERVAL 66 SECOND, NOW() + INTERVAL 66 SECOND),
('제목67', '내용67', 'chun', 'chun', NOW() + INTERVAL 67 SECOND, NOW() + INTERVAL 67 SECOND),
('제목68', '내용68', 'chun', 'chun', NOW() + INTERVAL 68 SECOND, NOW() + INTERVAL 68 SECOND),
('제목69', '내용69', 'chun', 'chun', NOW() + INTERVAL 69 SECOND, NOW() + INTERVAL 69 SECOND),
('제목70', '내용70', 'chun', 'chun', NOW() + INTERVAL 70 SECOND, NOW() + INTERVAL 70 SECOND),
('제목71', '내용71', 'chun', 'chun', NOW() + INTERVAL 71 SECOND, NOW() + INTERVAL 71 SECOND),
('제목72', '내용72', 'chun', 'chun', NOW() + INTERVAL 72 SECOND, NOW() + INTERVAL 72 SECOND),
('제목73', '내용73', 'chun', 'chun', NOW() + INTERVAL 73 SECOND, NOW() + INTERVAL 73 SECOND),
('제목74', '내용74', 'chun', 'chun', NOW() + INTERVAL 74 SECOND, NOW() + INTERVAL 74 SECOND),
('제목75', '내용75', 'chun', 'chun', NOW() + INTERVAL 75 SECOND, NOW() + INTERVAL 75 SECOND),
('제목76', '내용76', 'chun', 'chun', NOW() + INTERVAL 76 SECOND, NOW() + INTERVAL 76 SECOND),
('제목77', '내용77', 'chun', 'chun', NOW() + INTERVAL 77 SECOND, NOW() + INTERVAL 77 SECOND),
('제목78', '내용78', 'chun', 'chun', NOW() + INTERVAL 78 SECOND, NOW() + INTERVAL 78 SECOND),
('제목79', '내용79', 'chun', 'chun', NOW() + INTERVAL 79 SECOND, NOW() + INTERVAL 79 SECOND),
('제목80', '내용80', 'chun', 'chun', NOW() + INTERVAL 80 SECOND, NOW() + INTERVAL 80 SECOND),
('제목81', '내용81', 'chun', 'chun', NOW() + INTERVAL 81 SECOND, NOW() + INTERVAL 81 SECOND),
('제목82', '내용82', 'chun', 'chun', NOW() + INTERVAL 82 SECOND, NOW() + INTERVAL 82 SECOND),
('제목83', '내용83', 'chun', 'chun', NOW() + INTERVAL 83 SECOND, NOW() + INTERVAL 83 SECOND),
('제목84', '내용84', 'chun', 'chun', NOW() + INTERVAL 84 SECOND, NOW() + INTERVAL 84 SECOND),
('제목85', '내용85', 'chun', 'chun', NOW() + INTERVAL 85 SECOND, NOW() + INTERVAL 85 SECOND),
('제목86', '내용86', 'chun', 'chun', NOW() + INTERVAL 86 SECOND, NOW() + INTERVAL 86 SECOND),
('제목87', '내용87', 'chun', 'chun', NOW() + INTERVAL 87 SECOND, NOW() + INTERVAL 87 SECOND),
('제목88', '내용88', 'chun', 'chun', NOW() + INTERVAL 88 SECOND, NOW() + INTERVAL 88 SECOND),
('제목89', '내용89', 'chun', 'chun', NOW() + INTERVAL 89 SECOND, NOW() + INTERVAL 89 SECOND),
('제목90', '내용90', 'chun', 'chun', NOW() + INTERVAL 90 SECOND, NOW() + INTERVAL 90 SECOND),
('제목91', '내용91', 'chun', 'chun', NOW() + INTERVAL 91 SECOND, NOW() + INTERVAL 91 SECOND),
('제목92', '내용92', 'chun', 'chun', NOW() + INTERVAL 92 SECOND, NOW() + INTERVAL 92 SECOND),
('제목93', '내용93', 'chun', 'chun', NOW() + INTERVAL 93 SECOND, NOW() + INTERVAL 93 SECOND),
('제목94', '내용94', 'chun', 'chun', NOW() + INTERVAL 94 SECOND, NOW() + INTERVAL 94 SECOND),
('제목95', '내용95', 'chun', 'chun', NOW() + INTERVAL 95 SECOND, NOW() + INTERVAL 95 SECOND),
('제목96', '내용96', 'chun', 'chun', NOW() + INTERVAL 96 SECOND, NOW() + INTERVAL 96 SECOND),
('제목97', '내용97', 'chun', 'chun', NOW() + INTERVAL 97 SECOND, NOW() + INTERVAL 97 SECOND),
('제목98', '내용98', 'chun', 'chun', NOW() + INTERVAL 98 SECOND, NOW() + INTERVAL 98 SECOND),
('제목99', '내용99', 'chun', 'chun', NOW() + INTERVAL 99 SECOND, NOW() + INTERVAL 99 SECOND),
('제목100', '내용100', 'chun', 'chun', NOW() + INTERVAL 100 SECOND, NOW() + INTERVAL 100 SECOND),
('제목101', '내용101', 'chun', 'chun', NOW() + INTERVAL 101 SECOND, NOW() + INTERVAL 101 SECOND),
('제목102', '내용102', 'chun', 'chun', NOW() + INTERVAL 102 SECOND, NOW() + INTERVAL 102 SECOND),
('제목103', '내용103', 'chun', 'chun', NOW() + INTERVAL 103 SECOND, NOW() + INTERVAL 103 SECOND),
('제목104', '내용104', 'chun', 'chun', NOW() + INTERVAL 104 SECOND, NOW() + INTERVAL 104 SECOND),
('제목105', '내용105', 'chun', 'chun', NOW() + INTERVAL 105 SECOND, NOW() + INTERVAL 105 SECOND),
('제목106', '내용106', 'chun', 'chun', NOW() + INTERVAL 106 SECOND, NOW() + INTERVAL 106 SECOND),
('제목107', '내용107', 'chun', 'chun', NOW() + INTERVAL 107 SECOND, NOW() + INTERVAL 107 SECOND),
('제목108', '내용108', 'chun', 'chun', NOW() + INTERVAL 108 SECOND, NOW() + INTERVAL 108 SECOND),
('제목109', '내용109', 'chun', 'chun', NOW() + INTERVAL 109 SECOND, NOW() + INTERVAL 109 SECOND),
('제목110', '내용110', 'chun', 'chun', NOW() + INTERVAL 110 SECOND, NOW() + INTERVAL 110 SECOND);

 SELECT * FROM TB_FILES;
 
 -- Notice상세 with 파일명
 CREATE VIEW VIEW_NOTICE
 AS
 SELECT n.*, f.file_name FROM TB_NOTICE n LEFT JOIN TB_FILES f ON n.notice_id = f.notice_id;
 
 
SELECT * FROM VIEW_NOTICE; 
 
 -- 다음글
SELECT notice_id, title FROM TB_NOTICE WHERE notice_id > 50 ORDER BY modified ASC LIMIT 1;

-- 이전글
SELECT notice_id, title FROM TB_NOTICE WHERE notice_id < 50  ORDER BY modified DESC  LIMIT 1;
 
 
UPDATE TB_NOTICE SET
        title = '123',
        content = '123',
        modifier_id = 'chun2',
        modified = NOW()
        WHERE
        notice_id =
        1;
 
 
 
 
 
 
 
 
 
 