package com.project.careerfair.mapper.posting;

import com.project.careerfair.domain.Posting;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface PostingMapper {

    // 기업별 현재 포스팅 
    List<Posting> getNowPostingList(Integer companyId);

    // 기업별 현재 포스팅 수
    Integer countAll(Integer companyId);

    // 기업별 과거 포스팅
    List<Posting> getPastPostingList(Integer startNum, Integer pageSize, Integer companyId);

    @Select("""
            SELECT * FROM TB_POSTING
            WHERE member_id = #{memberId}
            ORDER BY posting_id DESC
            LIMIT #{startIndex}, 10
            """)
    @ResultMap("postingMap")
    List<Posting> getPostingInfoByMemberId(String memberId, Integer startIndex, String status);

    @Select("""
            SELECT COUNT(*)
            FROM TB_POSTING
            WHERE member_id = #{memberId}
            """)
    Integer countPostingBymemberId(String memberId, String status);

    @Select("""
            SELECT * FROM TB_POSTING
            WHERE posting_id = #{postingId}
            """)
    @ResultMap("postingMap")
    Posting getPostDetailByPostingId(Integer postingId);

    @Insert("""
            INSERT INTO TB_POSTING(
            company_id, member_id, round, title, 
            industry_id, hiring_count, spare_count, 
            start_date, end_date, status, address, salary, 
            preferences, benefits, requirements, etc, 
            employment_type, experience_level, education_level)
            VALUES(
            #{companyId}, #{memberId}, #{round}, #{title},      
            #{industryId}, #{hiringCount}, #{spareCount},
            #{startDate}, #{endDate}, #{status}, #{address}, #{salary},
            #{preference}, #{benefit}, #{requirement}, #{etc},
            #{employmentType}, #{experienceLevel}, #{educationLevel}
            )
            """)
    @ResultMap("postingMap")
    Integer addPosting(Posting posting);


    // 유저 채용공고 목록
    List<Posting> getNowPostingsAll(Integer[] industrIds, String[] experienceLevels, String[] educationLevels, String[] employmentTypes, String type, String search);


    @Delete("""
            DELETE FROM TB_POSTING
            WHERE
            posting_id = #{postingId} AND
            NOT (application_count != 0 && status = '채용중') 
            """)
    int deletePosting(Posting posting);


    // 유저 채용공고 목록
    List<Posting> getNowPostingsAll(Integer pageSize, Integer startNum, Integer[] industrIds, String[] experienceLevels, String[] educationLevels, String[] employmentTypes, String type, String search);

    // 채용공고 목록 수
    Integer getNowPostingsCount(Integer[] industrIds, String[] experienceLevels, String[] educationLevels, String[] employmentTypes, String type, String search);

    @Update("""
            UPDATE TB_POSTING
            SET 
                title = #{title},
                status = #{status},
                industry_id = #{industryId},
                hiring_count = #{hiringCount}, 
                spare_count = #{spareCount},
                start_date = #{startDate},
                end_date = #{endDate},
                address = #{address},
                salary = #{salary},
                preferences = #{preference},
                benefits = #{benefit},
                requirements = #{requirement},
                etc = #{etc},
                employment_type = #{employmentType},
                experience_level = #{experienceLevel},
                education_level = #{educationLevel}
            WHERE
                posting_id = #{postingId}
            """)
    int modifyPosting(Posting posting);


}
