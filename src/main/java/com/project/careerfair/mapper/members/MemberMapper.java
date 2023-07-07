package com.project.careerfair.mapper.members;

import com.project.careerfair.domain.Members;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface MemberMapper {

    @Insert("""
            INSERT INTO 
            TB_MEMBERS
                   (
                     member_id
                   , password
                   , name
                   , gender
                   , is_active
                   , phone_number
                   , email
                   , member_type
                   , address
                   )
            VALUES
                  (
                    #{member_id}
                  , #{password}
                  , #{name} 
                  , #{gender}
                  , #{is_active} 
                  , #{phone_number}
                  , #{email}
                  , #{member_type}
                  , #{address} 
                  )       
            """)
    Integer signUpInsert(Members member);

    @Select("""
            SELECT 
                  member_id
                , password
                , name
                , gender
                , is_active
                , phone_number
                , email
                , member_type
                , address  
            FROM
            TB_MEMBERS
            WHERE member_id = #{member_id}
            """)
    Members selectByMemberId(String member_id);

/*    @Select("""
            SELECT
            FROM MEMBERS
            WHERE member_id = #{member_id}
            """)
    Members selectById(String username);*/

   /* @Insert("""
            INSERT INTO
            """)
    void insertAuthority(Members member);*/
}
