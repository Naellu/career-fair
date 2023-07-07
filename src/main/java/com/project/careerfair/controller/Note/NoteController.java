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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
        String userId = "user1"; // 나중에 parameter 받아야함

        String distinction = "receive";

        Map<String, Object> result = service.getListByUserId(userId, page, distinction);

        model.addAllAttributes(result);
        return "/note/list/receive";
    }

    @GetMapping("/list/send")
    public void getSendList(
            Model model,
            @RequestParam(value = "page", defaultValue = "1") Integer page

    ){
        String userId = "user1"; // 나중에 parameter 받아야함

        String distinction = "send";

        Map<String, Object> result = service.getListByUserId(userId, page, distinction);

        model.addAllAttributes(result);
    }

    @GetMapping("detail")
    public void getNoteDetail(
            Model model,
            Note note,
            String distinction) {

        Note noteDetail = service.getNoteDetail(note);
        model.addAttribute("noteInfo", noteDetail);
        model.addAttribute("distinction", distinction);
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
        service.writeNote(note);

        // 클라이언트에게 닫기 요청을 보냄
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out;
        try {
            out = response.getWriter();
            out.println("<script>alert('쪽지 전송 완료');window.close();</script>");
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @PostMapping("delete")
    public String deleteProcess(
            Integer noteId,
            String distinction,
            RedirectAttributes rttr){


        Boolean ok = service.deleteNot(noteId);
        if(ok){
            rttr.addFlashAttribute("message", "쪽지가 삭제되었습니다.");
        } else{
            rttr.addFlashAttribute("message", "쪽지가 삭제되지않았습니다.");
        }


        return "redirect:/note/list/" + distinction;
    }

}
