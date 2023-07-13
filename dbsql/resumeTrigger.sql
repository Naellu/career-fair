
# 이력서 작성 시 생성일 자동 추가
DELIMITER //

CREATE TRIGGER before_insert_date
    BEFORE INSERT ON career_fair.TB_ONLINE_RESUME FOR EACH ROW
BEGIN
    IF NEW.created IS NULL THEN
        SET NEW.created = DATE_FORMAT(NOW(), '%Y-%m-%d');
    END IF;
END; //

DELIMITER ;