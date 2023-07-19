package com.project.careerfair.mapper.company;

import com.project.careerfair.domain.Members;
import com.project.careerfair.domain.Posting;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface RecruitManageMapper {

    @Select("""
            SELECT * FROM
            TB_MEMBERS
            WHERE member_id = #{id}
            """)
    @ResultMap("recruitMap")
    Members getId(String id);


    @Select("""
            SELECT
              posting_id
            , title
            , hiring_count
            , spare_count
            , start_date
            , end_date
            , status
            , address
            , salary
            , preferences
            , benefits
            , requirements
            , etc
            , employment_type
            , experience_level
            , education_level
            , application_count
            ,
            (
            SELECT
            member_id
            FROM
            TB_MEMBERS
            WHERE member_id = #{id}
            )
            FROM
            TB_POSTING
            WHERE member_id = #{id}
            """)
    @ResultMap("postingMap")
    Posting getPostId(String id);

}
