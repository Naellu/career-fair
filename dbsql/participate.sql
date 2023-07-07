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


