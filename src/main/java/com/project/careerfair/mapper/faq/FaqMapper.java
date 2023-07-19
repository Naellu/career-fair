package com.project.careerfair.mapper.faq;

import com.project.careerfair.domain.Faq;
import org.apache.ibatis.annotations.*;
import org.hibernate.validator.constraints.ru.INN;

import java.util.List;

@Mapper
public interface FaqMapper {

    @Select("""
            SELECT *
            FROM TB_FAQ
            """)
    @ResultMap("faqResultMap")
    List<Faq> findAll();


    @Insert("""
            INSERT INTO TB_FAQ (title, content)
            VALUES (#{title}, #{content})
            """)
    @Options(useGeneratedKeys = true, keyProperty = "faqId")
    Integer writeNewFAQ(Faq faq);

}
