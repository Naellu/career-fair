package com.project.careerfair.controller.Note;

import com.project.careerfair.service.Note.NoteServiceImp;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@RequestMapping("/note")
@RequiredArgsConstructor
public class NoteController {

    private final NoteServiceImp service;

    @GetMapping("receivelist")
    public String getReceiveList(
            Model model,
            @RequestParam (value = "page", defaultValue = "1") Integer page
            ){

        String userId = "user1"; // 나중에 parameter 받아야함

        Map<String, Object> result = service.getListByUserId(userId, page);

        model.addAllAttributes(result);
        return "/note/receivelist";
    }
}
