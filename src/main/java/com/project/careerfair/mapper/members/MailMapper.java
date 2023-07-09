package com.project.careerfair.mapper.members;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface MailMapper {


    @Insert("""
			INSERT INTO AuthenticNum (authenticNUM)
			VALUES (#{randomNumber})
			""")
    Integer saveRandomNum(int randomNumber);

    @Select("""
			SELECT authenticNUM
			FROM AuthenticNum
			""")
    Integer getAuthenticatedNum();

    @Delete("""
			DELETE FROM AuthenticNum
			""")
    void deleteAuthenticatedNum();
}
