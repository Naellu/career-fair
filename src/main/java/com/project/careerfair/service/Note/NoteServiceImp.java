package com.project.careerfair.service.Note;

import com.project.careerfair.domain.Note;
import com.project.careerfair.mapper.Note.NoteMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class NoteServiceImp implements NoteService {

    private final NoteMapper mapper;
    @Override
    public Map<String, Object> getListByUserId(String userId, Integer currentPage) {
        Map<String, Object> resultMap = new HashMap<>();

        Integer noteCount = mapper.countRecieveListByUserId(userId);

        Integer last = noteCount/10 + 1;

        Integer begin = 1 + (currentPage-1) / 10 * 10;
        Integer end = Math.min(begin + 9, last);

        Integer previous = Math.max(1, currentPage-10);
        Integer next = Math.min(last, currentPage+10);

        Map<String, Object> pageInfo = new HashMap<>();
        pageInfo.put("page", currentPage);
        pageInfo.put("begin", begin);
        pageInfo.put("end", end);
        pageInfo.put("previous",previous);
        pageInfo.put("next",next);
        pageInfo.put("last", last);


        Integer startIndex = currentPage * 10 - 10;
        List<Note> noteList = mapper.getRecieveListByUserId(userId, startIndex);

        resultMap.put("noteList", noteList);
        resultMap.put("pageInfo", pageInfo);

        return resultMap;
    }
}


