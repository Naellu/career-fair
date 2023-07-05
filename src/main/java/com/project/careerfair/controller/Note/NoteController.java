package com.project.careerfair.controller.Note;

import com.project.careerfair.domain.Note;
import com.project.careerfair.service.Note.NoteServiceImp;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/note")
@RequiredArgsConstructor
public class NoteController {

    private final NoteServiceImp service;

    @GetMapping("receivelist")
    public String getReceiveList(Model model){
        String userId = "user1"; // 나중에 parameter 받아야함
        Integer pageNum = 1; // 나중에 parameter 받아야 함 (기본 값 1)

        List<Note> noteList = service.getListByUserId(userId);

        Map<String, Object> pageInfo = new HashMap<>();

        model.addAttribute("userId", userId);
        model.addAttribute("noteList", noteList);
        model.addAttribute("pageInfo", pageInfo);
        return "/note/receivelist";
    }
}
