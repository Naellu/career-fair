package com.project.careerfair.mapper.faq;

import com.project.careerfair.domain.Faq;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface FaqMapper {

    @Select("""
            SELECT *
            FROM TB_FAQ
            """)
    @ResultMap("faqResultMap")
    List<Faq> findAll();

}
