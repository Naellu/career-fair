 -- 회차 테이블 추가
 alter table TB_COMPANIES
add round int null comment '회차' first;

-- fk설정
alter table TB_COMPANIES
add constraint TB_COMPANIES_ibfk_3
foreign key (round) references TB_EXHIBITION_INFO (round);
        
-- 주소 분리
ALTER TABLE TB_COMPANIES
ADD COLUMN postal_code VARCHAR(10) AFTER revenue,
ADD COLUMN detail_address VARCHAR(100) AFTER address;

SELECT * FROM TB_COMPANIES;

-- INDUSTRIES 업종
INSERT INTO TB_INDUSTRIES (industry_name)
VALUES
('IT 및 소프트웨어 개발'),
('컴퓨터 하드웨어 및 전자제품'),
('인터넷 및 웹 서비스'),
('텔레커뮤니케이션 및 네트워크'),
('디지털 마케팅 및 광고'),
('금융 서비스 및 보험'),
('컨설팅 및 전략'),
('제조 및 생산'),
('의료 및 보건'),
('교육 및 교육 기관'),
('미디어 및 엔터테인먼트'),
('여행 및 호스피탈리티'),
('판매 및 소매업'),
('운송 및 물류'),
('건설 및 부동산');

CREATE VIEW VIEW_COMPANY
AS
SELECT c.*, i.industry_name, f.file_name FROM TB_COMPANIES c 
JOIN TB_INDUSTRIES i ON c.industry_id = i.industry_id
LEFT JOIN TB_FILES f ON c.company_id = f.company_id;

SELECT * FROM VIEW_COMPANY;

SELECT * FROM TB_FILES;

-- 상태변경
UPDATE TB_COMPANIES t
JOIN TB_MEMBERS m ON t.member_id = m.member_id
SET t.status = 'new_status', m.member_type = 'new_member_type'
WHERE TB_COMPANIES.company_id = 'your_company_id';

SELECT * FROM TB_FILES;
TRUNCATE TABLE TB_FILES;
DELETE FROM TB_FILES WHERE notice_id IS NULL;

 SELECT * FROM TB_COMPANIES WHERE member_id = 'chuncom' and round < 2  ORDER BY company_id DESC;