package com.project.careerfair.mapper.Note;

import com.project.careerfair.domain.Note;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface NoteMapper {

    @Select("""
            SELECT sender_id, title, content, created
            FROM NOTE
            WHERE recipient_id = #{userId}
            """)
    @ResultMap("recieveList")
    List<Note> getRecieveListByUserId(String userId);
}
