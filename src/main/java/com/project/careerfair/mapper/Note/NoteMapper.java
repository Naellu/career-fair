package com.project.careerfair.mapper.Note;

import com.project.careerfair.domain.Note;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface NoteMapper {

    @Select("""
            SELECT note_id, sender_id, title, content, created
            FROM TB_NOTE
            WHERE recipient_id = #{userId}
            ORDER BY note_id DESC
            LIMIT #{startIndex} , 10
            """)
    @ResultMap("recieveList")
    List<Note> getRecieveListByUserId(String userId, Integer startIndex);

    @Select("""
            SELECT COUNT(*)
            FROM TB_NOTE
            WHERE recipient_id = #{userId}
            """)
    Integer countRecieveListByUserId(String userId);
}
