package com.project.careerfair.mapper.members;

import com.project.careerfair.domain.Members;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.ResultMap;
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
                   , zip_code
                   )
            VALUES
                  (
                    #{id}
                  , #{password}
                  , #{name} 
                  , #{gender}
                  , #{isActive} 
                  , #{phoneNumber}
                  , #{email}
                  , #{authority[0]}
                  , #{address} 
                  , #{zipCode}
                  )       
            """)
    @ResultMap("signMember")
    Integer signUpInsert(Members member);

    @Select("""
           SELECT * FROM TB_MEMBERS
            WHERE member_id = #{id}
            """)
    @ResultMap("memberMap")
    Members selectByMemberId(String id);

    @Select("""
            SELECT * 
            FROM 
            TB_MEMBERS
            WHERE phone_number = #{phoneNumber}
            """)
    Members selectByPhoneNumber(String phoneNumber);

    @Select("""
            SELECT *
            FROM
            TB_MEMBERS
            WHERE email = #{email}
            """)
    Members selectByMailId(String email);

    @Select("""
            SELECT 
            member_id
            FROM
            TB_MEMBERS
            WHERE 
            email = #{email}
            AND name = #{name}
            """)
    String findId(String email, String name);

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
