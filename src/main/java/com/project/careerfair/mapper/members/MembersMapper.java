package com.project.careerfair.mapper.members;

import com.project.careerfair.domain.Members;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface MembersMapper {
// 머지할 때 충돌 생길거 같아서 마지막 쯤에 지울게요!!
//    @Select("""
//            SELECT * FROM TB_MEMBERS
//            WHERE member_id = #{id}
//            """)
//    @ResultMap("memberMap")
//    Members selectId(String id);

}
