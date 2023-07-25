package com.project.careerfair.mapper.jobapplication;

import com.project.careerfair.domain.JobApplication;
import com.project.careerfair.domain.Members;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface JobApplicationMapper {
    Integer apply(JobApplication jobApplication);

    void insertFileName(Integer applicationId, String originalFilename);

    @Select("""
            SELECT * FROM TB_JOB_APPLICATION
            WHERE member_id = #{memberId}
            ORDER BY application_id DESC
            """)
    @ResultMap("applyResultMap")
    List<JobApplication> getApplyList(String memberId);

    @Select("""
            SELECT * FROM TB_JOB_APPLICATION
            WHERE application_id = #{applicationId}
            """)
    @ResultMap("applyResultMap")
    JobApplication getApplyInfo(Integer applicationId);

    @Delete("""
            DELETE FROM TB_JOB_APPLICATION
            WHERE application_id = #{applicationId}
            """)
    Integer cancelApplyByApplicationId(Integer applicationId);

    @Select("""
            SELECT * FROM TB_JOB_APPLICATION
            WHERE posting_id = #{postingId}
            ORDER BY application_id DESC
            """)
    @ResultMap("applyResultMap")
    List<JobApplication> applyList(Integer postingId);

    @Select("""
            SELECT
                    member_id id,
                    name,
                    gender,
                    phone_number phoneNumber,
                    email,
                    address 
            FROM TB_MEMBERS
            WHERE member_id = #{memberId}
            """)
    List<Members> getDetails(String memberId);

    @Select("""
            SELECT
                    file_name fileName
            FROM TB_FILES
            WHERE application_id = #{applicationId}
            """)
    List<String> getFileDetails(Integer applicationId);

    @Update("""
            UPDATE TB_JOB_APPLICATION
            SET application_status = #{applicationStatus}
            WHERE member_id = #{memberId}
            AND application_id = #{applicationId}
            AND posting_id = #{postingId}
            """)
    Integer updateStatus(String memberId, Integer applicationId, String applicationStatus, Integer postingId);

    @Select("""
            SELECT application_id FROM
            TB_JOB_APPLICATION
            WHERE posting_id = #{postingId}
            """)
    List<Integer> getApplicationId(Integer postingId);

    Integer getApplied(String memberId, Integer postingId);
}
