package com.project.careerfair.service.Note;

import com.project.careerfair.domain.Note;
import com.project.careerfair.mapper.Note.NoteMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class NoteServiceImp implements NoteService {

    private final NoteMapper mapper;
    @Override
    public List<Note> getListByUserId(String userId) {
        return mapper.getRecieveListByUserId(userId);
    }
}
