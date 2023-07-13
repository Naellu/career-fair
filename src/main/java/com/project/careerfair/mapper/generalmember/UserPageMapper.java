package com.project.careerfair.mapper.generalmember;

import com.project.careerfair.domain.Members;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface UserPageMapper {
    @Select("""
           SELECT * FROM TB_MEMBERS
            WHERE member_id = #{id}
            """)
    @ResultMap("userInfoMap")
    Members selectById(String id);

    @Update("""
            <script>
            UPDATE TB_MEMBERS 
            SET
            <if test="password neq null and password neq ''">
                password = #{password}
            </if>
            , email = #{email}
            , zip_code = #{zipCode}
            , address = #{address}
            , phone_number = #{phoneNumber}
            WHERE 
            member_id = #{id}        
            </script>
            """)
    int modify(Members member);

    @Update("""
            UPDATE TB_MEMBERS
            SET
            is_active = #{isActive}
            WHERE 
            member_id = #{id}
            """)
    int deleteById(String id, Integer isActive);
}
