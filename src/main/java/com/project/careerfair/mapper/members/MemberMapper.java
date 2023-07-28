package com.project.careerfair.mapper.members;

import com.project.careerfair.domain.Members;
import org.apache.ibatis.annotations.*;

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

    @Select("""
            SELECT member_id
            FROM TB_MEMBERS
            WHERE 
            member_id = #{id}
            AND
            email = #{email}
            """)
    String checkUser(String id, String email);

    @Update("""
            UPDATE TB_MEMBERS
            SET password = #{password}
            WHERE 
            member_id = #{id} 
            AND 
            email = #{email}
            """)
    Integer updatePw(String id, String email, String password);

    void active(Object memberId);

    void setTypeToCompany();

    String getAuth(String memberId);

    @Select("""
            SELECT 
            member_id
            FROM
            TB_MEMBERS
            WHERE member_id = #{memberId}
            AND email = #{email}
            """)
    String findMemberId(String email, String memberId);

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
                password = #{password},
            </if>
              email = #{email}
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
