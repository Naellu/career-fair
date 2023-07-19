package com.project.careerfair.controller.customer;

import com.project.careerfair.domain.Faq;
import com.project.careerfair.service.customer.FaqService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/faq")
public class FAQController {

    private final FaqService faqService;

    @GetMapping
    public String showFAQList(Model model) {
        List<Faq> faqList = faqService.findAll();
        model.addAttribute("faq", faqList);
        return "customer/faq/list";
    }

    @PostMapping("/add")
    public ResponseEntity<String> writeNewFAQ(@RequestBody Faq faq) {
        try {
            faqService.addNewFAQ(faq);
            return ResponseEntity.ok("성공적으로 등록 되었습니다");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("등록 중 오류가 발생하였습니다");
        }
    }

    @DeleteMapping("/delete")
    public ResponseEntity<String> delete() {
        return null;
    }
}
