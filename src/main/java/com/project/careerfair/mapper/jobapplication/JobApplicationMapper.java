package com.project.careerfair.mapper.jobapplication;

import com.project.careerfair.domain.JobApplication;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;

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
}
