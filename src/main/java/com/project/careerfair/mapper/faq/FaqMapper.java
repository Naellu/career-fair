package com.project.careerfair.mapper.faq;

import com.project.careerfair.domain.Faq;
import org.apache.ibatis.annotations.*;
import org.hibernate.validator.constraints.ru.INN;

import java.util.List;

@Mapper
public interface FaqMapper {

//    @Select("""
//            SELECT *
//            FROM TB_FAQ
//            """)
//    @ResultMap("faqResultMap")
//    List<Faq> findAll();

    @Select("""
            <script>
            <bind name="pattern" value="'%' + search + '%'" />
            
            SELECT *
            FROM TB_FAQ
            
            <where>
                <if test="(type eq 'all') or (type eq 'title')">
                   title LIKE #{pattern}
                </if>
                <if test="(type eq 'all') or (type eq 'content')">
                OR content LIKE #{pattern}
                </if>
            </where>
            
            </script>
            """)
    @ResultMap("faqResultMap")
    List<Faq> findAll(String search, String type);


    @Insert("""
            INSERT INTO TB_FAQ (title, content)
            VALUES (#{title}, #{content})
            """)
    @Options(useGeneratedKeys = true, keyProperty = "faqId")
    Integer writeNewFAQ(Faq faq);

}
