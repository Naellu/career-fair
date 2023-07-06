package com.project.careerfair.service.Note;

import com.project.careerfair.domain.Note;

import java.util.List;
import java.util.Map;

public interface NoteService {

    Map<String, Object> getListByUserId(String userId, Integer pageNum);

    Note getNoteDetail(Note note);

    void writeNote(Note note);
}
