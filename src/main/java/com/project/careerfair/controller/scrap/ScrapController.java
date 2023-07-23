package com.project.careerfair.controller.scrap;

import com.project.careerfair.service.scrap.ScrapService;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/scrap")
public class ScrapController {

    private final ScrapService scrapService;

    @GetMapping("list")
    public void getScrapList(
            Authentication authentication,
            Model model
    ){
        String memberId = authentication.getName();

        Map<String, Object> result = new HashMap<>();
        result = scrapService.getScrapList(memberId);

        model.addAllAttributes(result);

    }

    @PostMapping("cancel")
    public void cancelScrap(
            Integer scrapId,
            HttpServletResponse response

    ){
        boolean ok = scrapService.cancelScrap(scrapId);


        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out;
        try {
            out = response.getWriter();
            if(ok) {
                out.println("<script>alert('스크랩이 취소되었습니다');");
            } else{
                out.println("<script>alert('다시 시도해주세요');");
            }
            out.println("window.location.href='/scrap/list';</script>");
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
