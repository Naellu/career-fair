package com.project.careerfair.service.Note;

import com.project.careerfair.domain.Note;

import java.util.Map;

public interface NoteService {

    Map<String, Object> getListByUserId(String userId, Integer currentPage, String distinction);

    Note getNoteDetail(Note note);

    void writeNote(Note note);

    Boolean deleteNot(Integer noteId);
}
