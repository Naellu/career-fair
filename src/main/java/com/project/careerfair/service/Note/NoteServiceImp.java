package com.project.careerfair.service.Note;

import com.project.careerfair.domain.Note;
import com.project.careerfair.mapper.Note.NoteMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class NoteServiceImp implements NoteService {

    private final NoteMapper mapper;
    @Override
    public Map<String, Object> getListByUserId(String userId, Integer currentPage, String distinction) {
        Map<String, Object> resultMap = new HashMap<>();

        Integer noteCount = 0;

        if (distinction.equals("receive")){
            noteCount = mapper.countReceiveListByUserId(userId);
        } else if (distinction.equals("send")){
            noteCount = mapper.countSendListByUserId(userId);
        }


        Integer last = noteCount/10 + 1;

        Integer begin = 1 + (currentPage-1) / 10 * 10;
        Integer end = Math.min(begin + 9, last);

        Integer previous = Math.max(1, (currentPage-1) / 10 * 10);
        Integer next = Math.min(last, (currentPage-1) / 10 * 10 +11);

        Map<String, Object> pageInfo = new HashMap<>();
        pageInfo.put("page", currentPage);
        pageInfo.put("begin", begin);
        pageInfo.put("end", end);
        pageInfo.put("previous",previous);
        pageInfo.put("next",next);
        pageInfo.put("last", last);


        Integer startIndex = currentPage * 10 - 10;
        List<Note> noteList = new ArrayList<>();
        System.out.println(distinction);
        System.out.println(userId);
        System.out.println(startIndex);
        if (distinction.equals("receive")){
            noteList = mapper.getReceiveListByUserId(userId, startIndex);
        } else if(distinction.equals("send")){
            noteList = mapper.getSendListByUserId(userId, startIndex);
        }


        resultMap.put("noteList", noteList);
        resultMap.put("pageInfo", pageInfo);

        return resultMap;
    }

    @Override
    public Note getNoteDetail(Integer noteId) {

        return mapper.getNoteDetailByNoteId(noteId);
    }

    @Override
    public void writeNote(Note note) {
        mapper.writeNote(note);
    }

    @Override
    public Boolean deleteNot(Integer noteId) {
        Integer deleteCheck = 1;

        return mapper.deleteNoteByNoteId(noteId) == 1;
    }
}


