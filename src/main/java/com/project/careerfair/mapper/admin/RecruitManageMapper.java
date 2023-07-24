package com.project.careerfair.mapper.admin;

import com.project.careerfair.domain.Members;
import com.project.careerfair.domain.Posting;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface RecruitManageMapper {

    @Select("""
            SELECT * FROM
            TB_MEMBERS
            WHERE member_id = #{memberId}
            """)
    @ResultMap("recruitMap")
    List<Members> getManageId();

    @Select("""
            <script>
            <bind name="pattern" value="'%' + search + '%'" />
            SELECT 
                  posting_id 
                , member_id 
                , title 
                , hiring_count 
                , spare_count 
                , start_date 
                , end_date 
                , status 
                , round
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
            FROM 
                TB_POSTING 
                <where>
                <if test="search != null">
                <if test="type eq 'all'">
                  AND (member_id LIKE #{pattern} OR title LIKE #{pattern} OR address LIKE #{pattern})
                </if>
                <if test="type eq 'memberId'">
                  AND member_id LIKE #{pattern}
                </if>
                <if test="type eq 'title'">
                  AND title LIKE #{pattern}
                </if>
                <if test="type eq 'address'">
                  AND address LIKE #{pattern}
                </if>
                </if>
                </where>
                <if test="round != null">
                AND round = #{round}
                </if>
            ORDER BY posting_id DESC
            LIMIT #{startNum}, #{pageSize}
            </script>
            """)
    @ResultMap("postingMap")
    List<Posting> getPostId(Integer startNum, Integer pageSize, String search, String type, Integer round);

    @Select("""
            <script>
            <bind name="pattern" value="'%' + search + '%'" />
            SELECT 
            COUNT(*)
            FROM 
            TB_POSTING		
              <where>
              <if test="(type eq 'all') or (type eq 'memberId')">
              member_id LIKE #{pattern} 
              </if>
              <if test="(type eq 'all') or (type eq 'title')">
              title LIKE #{pattern} 
              </if>
              <if test="(type eq 'all') or (type eq 'address')">
              address LIKE #{pattern} 
              </if>
              </where>
            </script>
            """)
    Integer countAll(String type, String search);

    @Insert("""
            INSERT INTO TB_POSTING(status)
            VALUES(#{status})
            """)
    int endJobMapper(Posting posting);

    String getManageId(String memberId);

//    @Delete("""
//            DELETE
//            FROM
//            TB_POSTING
//            WHERE
//            posting_id = #{postingId}
//            AND round = #{round}
//            """)
//    int removeForm(Integer postingId, Integer round);

//    @Delete("""
//            DELETE
//            FROM
//            TB_FILES
//            WHERE file_name = #{fileName}
//            """)
//    void removeFileId(String fileName);


//    @Select("""
//            SELECT
//            file_name
//            FROM
//            TB_FILES
//            WHERE application_id = #{appicaitonId}
//            """)
//    List<String> selectFileId(Integer appicaitonId);
}
