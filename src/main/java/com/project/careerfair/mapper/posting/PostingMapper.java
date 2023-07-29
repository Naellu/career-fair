package com.project.careerfair.mapper.posting;

import com.project.careerfair.domain.Posting;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface PostingMapper {

    // 기업별 현재 포스팅 
    List<Posting> getNowPostingList(Integer pageSizeNow, Integer startNumNow, Integer companyId, Integer round);

    Integer countNowAll(Integer companyId, Integer round);

    // 기업별 현재 포스팅 수
    Integer countAll(Integer companyId, Integer round);

    // 기업별 과거 포스팅
    List<Posting> getPastPostingList(Integer startNum, Integer pageSize, Integer companyId, Integer round);

    @Select("""
            <script>
                SELECT * FROM TB_POSTING
                <choose>
                    <when test="status=='recruitment'">
                        WHERE 
                        member_id = #{memberId} AND        
                        status = '채용중'
                    </when>
                    <when test="status=='deadline'">
                        WHERE 
                        member_id = #{memberId} AND        
                        status = '마감'
                    </when>
                    <otherwise>
                        WHERE member_id = #{memberId}
                    </otherwise>
                </choose>
                ORDER BY posting_id DESC
                LIMIT #{startIndex}, 10
            </script>
            """)
    @ResultMap("postingMap")
    List<Posting> getPostingInfoByMemberId(String memberId, Integer startIndex, String status);

    @Select("""
            <script>
            SELECT COUNT(*)
            FROM TB_POSTING
            <choose>
                    <when test="status=='recruitment'">
                        WHERE 
                        member_id = #{memberId} AND        
                        status = '채용중'
                    </when>
                    <when test="status=='deadline'">
                        WHERE 
                        member_id = #{memberId} AND        
                        status = '마감'
                    </when>
                    <otherwise>
                        WHERE member_id = #{memberId}
                    </otherwise>
                </choose>
            </script>
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

    @Delete("""
            DELETE FROM TB_POSTING
            WHERE
            posting_id = #{postingId} AND
            NOT (application_count != 0 && status = '채용중') 
            """)
    int deletePosting(Posting posting);

    // 유저 채용공고 목록
    List<Posting> getNowPostingsAll(Integer pageSize, Integer startNum, Integer[] industrIds, String[] experienceLevels, String[] educationLevels, String[] employmentTypes, String type, String search, Integer round);

    // 채용공고 목록 수
    Integer getNowPostingsCount(Integer[] industrIds, String[] experienceLevels, String[] educationLevels, String[] employmentTypes, String type, String search, Integer round);

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

    Posting getPostViewDetailByPostingId(Integer postingId);

    // 입사지원시 지원자수 증가
    void updateCount(Integer postingId);

    @Update("""
            UPDATE TB_POSTING SET status = '마감'
            WHERE posting_id = #{postingId}
            """)
    Integer changeStatus(Integer postingId);

    @Select("""
            <script>
             <bind name="pattern" value="'%' + search + '%'" />
               SELECT COUNT(*) FROM VIEW_POSTING
                 <where>
                  <if test="roundValue eq 'all'">
                  AND round &lt;= #{round}
                  </if>
                  <if test="roundValue eq 'now'">
                  AND round = #{round}
                  </if>
                  <if test="roundValue eq 'past'">
                  AND round &lt; #{round}
                  </if>
                  <choose>
                  <when test="search != null and type eq 'all'">
                  AND (member_id LIKE #{pattern} OR title LIKE #{pattern} OR address LIKE #{pattern})
                  </when>
                  <when test="search != null and type eq 'memberId'">
                  AND member_id LIKE #{pattern}
                  </when>
                  <when test="search != null and type eq 'title'">
                  AND title LIKE #{pattern}
                  </when>
                  <when test="search != null and type eq 'companyName'">
                  AND company_name LIKE #{pattern}
                  </when>
                  <otherwise>
                   AND 1 = 1
                  </otherwise>
                  </choose>
             </where>
            </script>
            """)
    Integer manageCount(String type, String search, String roundValue, Integer round);

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
                , company_name
            FROM 
             <if test="roundValue eq 'all'">
             VIEW_POSTING
             </if>
             <if test="roundValue eq 'now'">
             (SELECT * FROM VIEW_POSTING WHERE round = #{round}) n
             </if>
             <if test="roundValue eq 'past'">
             (SELECT * FROM VIEW_POSTING WHERE round &lt; #{round}) p
             </if>
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
                <if test="type eq 'companyName'">
                  AND company_name LIKE #{pattern}
                </if>
                </if>
                </where>
            ORDER BY posting_id DESC
            LIMIT #{startNum}, #{pageSize}
            </script>
            """)
    @ResultMap("managePostingMap")
    List<Posting> getPostId(Integer startNum, Integer pageSize, String search, String type, String roundValue, Integer round);

    @Delete("""
            DELETE
            FROM
            TB_POSTING
            WHERE
            posting_id = #{postingId}
            AND round = #{round}
            """)
    int removeForm(Integer postingId, Integer round);

    @Update("""
            UPDATE TB_POSTING   
            SET application_count = application_count - 1
            WHERE posting_id = #{postingId}
            """)
    void reduceApplcationCount(Integer postingId);

    // 상위 5가지
    List<Posting> getTopPosting(Integer round);
}

