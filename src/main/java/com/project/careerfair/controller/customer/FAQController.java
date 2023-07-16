package com.project.careerfair.controller.customer;

import com.project.careerfair.domain.Faq;
import com.project.careerfair.service.customer.FaqService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
