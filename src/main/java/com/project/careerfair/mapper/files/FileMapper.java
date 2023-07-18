package com.project.careerfair.mapper.files;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface FileMapper {
    @Select("""
            SELECT file_name
            FROM TB_FILES
            WHERE application_id = #{applicationId}
            """)
    List<String> getFileNamesByApplicationId(Integer applicationId);
}
