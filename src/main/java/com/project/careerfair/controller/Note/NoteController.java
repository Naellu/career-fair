package com.project.careerfair.controller.Note;

import com.project.careerfair.domain.Note;
import com.project.careerfair.service.Note.NoteServiceImp;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

@Controller
@RequestMapping("/note")
@RequiredArgsConstructor
public class NoteController {

    private final NoteServiceImp service;

    @GetMapping("/list/receive")
    public String getReceiveList(
            Model model,
            @RequestParam(value = "page", defaultValue = "1") Integer page
    ) {

        String userId = "user7"; // 나중에 parameter 받아야함

        Map<String, Object> result = service.getListByUserId(userId, page);

        model.addAllAttributes(result);
        return "/note/list/receive";
    }

    @GetMapping("detail")
    public void getNoteDetail(
            Model model,
            Note note) {

        Note noteDetail = service.getNoteDetail(note);
        model.addAttribute("noteInfo", noteDetail);
    }

    @GetMapping("write")
    public void writeNoteForm(
            Note note
    ) {

    }

    @PostMapping("write")
    public void writeNoteProcess(
            Note note,
            HttpServletResponse response
    ){
        System.out.println(note);
        service.writeNote(note);

        // 클라이언트에게 닫기 요청을 보냄
        response.setContentType("text/html");
        PrintWriter out;
        try {
            out = response.getWriter();
            out.println("<script>window.close();</script>");
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
