package com.project.careerfair.service.Note;

import com.project.careerfair.domain.Note;

import java.util.List;

public interface NoteService {

    List<Note> getListByUserId(String userId);
}
