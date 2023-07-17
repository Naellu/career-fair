package com.project.careerfair.controller.qna;

import com.project.careerfair.domain.QnaAnswer;
import com.project.careerfair.domain.QnaQuestion;
import com.project.careerfair.service.qna.QnaService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("qna")
public class QnaController {

    private final QnaService service;

    @GetMapping("QnaList")
    public String qnaList(Model model) {
        List<QnaQuestion> list = service.readQuestion();
        List<QnaQuestion> updatedList = new ArrayList<>();

        for (QnaQuestion question : list) {
            QnaQuestion questionWithAnswerCount = service.getAnswerCount(question.getId());
//            updatedList.add(question);
            updatedList.add(questionWithAnswerCount);
        }

        model.addAttribute("question", updatedList);
        return "qna/QnaList";
    }


    @GetMapping("/id/{id}")
    public String qnaGet(@PathVariable("id") Integer id, Model model) {

        QnaQuestion question = service.getQuestion(id);
        model.addAttribute("question", question);


        return "qna/get";
    }

    @GetMapping("add")
    public String qnaWriteForm() {

        return "qna/add";
    }

    @PostMapping("add")
    public String qnaWrite(QnaQuestion question, RedirectAttributes rttr) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentUserId = authentication.getName(); // 현재 사용자의 아이디

        // 현재 사용자의 아이디를 Question 객체의 customerId 필드에 설정합니다.
        question.setMemberId(currentUserId);

        boolean ok = service.addQuestion(question);

        if (ok) {
            rttr.addFlashAttribute("message", "게시물이 등록되었습니다.");
            return "redirect:/qna/QnaList";
        } else {
            rttr.addFlashAttribute("message", "게시물이 등록되지 않았습니다.");
            return "redirect:/qna/add";
        }
    }

    @PostMapping("remove")
    public String qnaRemove(Integer id, RedirectAttributes rttr) {

            boolean ok = service.remove(id);

            if (ok) {
                rttr.addFlashAttribute("message", "게시물이 삭제되었습니다.");
                return "redirect:/qna/QnaList";
            } else {
                rttr.addFlashAttribute("message", "게시물이 삭제되지 않았습니다.");
                return "redirect:/qna/QnaList";
            }
    }

    @GetMapping("modify/{id}")
    public String qnaModifyForm(@PathVariable ("id") Integer id, Model model) {
        model.addAttribute("question", service.getQuestion(id));

        return "qna/modify";
    }

    @PostMapping("modify/{id}")
    public String qnaModify(QnaQuestion question, RedirectAttributes rttr) {

        boolean ok = service.modify(question);

        if (ok) {
            rttr.addFlashAttribute("message", "게시물이 수정되었습니다.");
            return "redirect:/qna/id/" + question.getId();
        } else {
            rttr.addFlashAttribute("message", "게시물이 수정되지 않았습니다.");
            return "redirect:/qna/modify/" + question.getId();
        }

    }

}

