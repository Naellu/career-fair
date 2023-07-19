package com.project.careerfair.mapper.Note;

import com.project.careerfair.domain.Note;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface NoteMapper {

    @Select("""
            SELECT note_id, sender_id, title, content, created
            FROM TB_NOTE
            WHERE 
            recipient_id = #{userId} AND
            status = false            
            ORDER BY note_id DESC
            LIMIT #{startIndex} , 10
            """)
    @ResultMap("noteList")
    List<Note> getUnreadListByUserId(String userId, Integer startIndex);

    @Select("""
            SELECT note_id, recipient_id, title, content, created
            FROM TB_NOTE
            WHERE sender_id = #{userId}
            ORDER BY note_id DESC
            LIMIT #{startIndex} , 10
            """)
    @ResultMap("noteList")
    List<Note> getSendListByUserId(String userId, Integer startIndex);

    @Select("""
            SELECT note_id, sender_id, title, content, created, status
            FROM TB_NOTE
            WHERE recipient_id = #{userId}
            ORDER BY note_id DESC
            LIMIT #{startIndex} , 10
            """)
    @ResultMap("noteList")
    List<Note> getReceiveListByUserId(String userId, Integer startIndex);

    @Select("""
            SELECT COUNT(*)
            FROM TB_NOTE
            WHERE 
            status = false 
            AND
            recipient_id = #{userId}
            """)
    Integer countUnreadListByUserId(String userId);
    @Select("""
            SELECT COUNT(*)
            FROM TB_NOTE
            WHERE sender_id = #{userId}
            """)
    Integer countSendListByUserId(String userId);
    @Select("""
            SELECT COUNT(*)
            FROM TB_NOTE
            WHERE recipient_id = #{userId}
            """)
    Integer countReceiveListByUserId(String userId);

    @Select("""
            SELECT * FROM TB_NOTE
            WHERE note_id = #{noteId}
            """)
    @ResultMap("noteDetail")
    Note getNoteDetailByNoteId(Integer noteId);

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

    @Delete(("""
            DELETE FROM TB_NOTE
            WHERE note_id = #{noteId}
            """))
    Integer deleteNoteByNoteId(Integer noteId);

    @Update("""
            UPDATE TB_NOTE
            SET status = true
            WHERE note_id = #{noteId}
            """)
    void readNote(Integer noteId);



}
