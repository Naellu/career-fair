package com.project.careerfair.mapper.members;

import com.project.careerfair.domain.Members;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface MembersMapper {

    @Select("""
            SELECT * FROM TB_MEMBERS
            WHERE member_id = #{id}
            """)
    @ResultMap("memberMap")
    Members selectId(String id);

}
