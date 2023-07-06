package com.project.careerfair.mapper.Note;

import com.project.careerfair.domain.Note;
import org.apache.ibatis.annotations.Insert;
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

    @Select("""
            SELECT * FROM TB_NOTE
            WHERE note_id = #{noteId}
            """)
    @ResultMap("noteDetail")
    Note getNoteDetailByNoteId(Note note);

    @Insert("""
            INSERT INTO 
            TB_NOTE(
                sender_id, 
                recipient_id, 
                title, 
                content
            )
            VALUES (
                #{senderId},
                #{recipientId},
                #{title},
                #{content}
            )
            """)
    void writeNote(Note note);
}
