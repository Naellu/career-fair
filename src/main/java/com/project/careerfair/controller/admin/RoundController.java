package com.project.careerfair.controller.admin;

import com.project.careerfair.domain.ExhibitionInfo;
import com.project.careerfair.service.admin.ExhibitionInfoService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.util.Map;

@Controller
@RequestMapping("/admin/round")
@PreAuthorize("hasAuthority('admin')")
@RequiredArgsConstructor
@Slf4j
public class RoundController {

    private final ExhibitionInfoService exhibitionInfoService;

    @GetMapping
    public String round(Model model) {
        Map<String, Object> exhibitionInfo = exhibitionInfoService.getCurrentInfo();

        model.addAttribute("exhibitionInfo", exhibitionInfo);

        return "admin/round/now";
    }

    @GetMapping("/reg")
    public String reg(Model model) {
        model.addAttribute("exhibitionInfo", new ExhibitionInfo());
        return "admin/round/reg";
    }

    @PostMapping("/reg")
    public String regProc(@Valid ExhibitionInfo exhibitionInfo,
                          BindingResult bindingResult,
                          @RequestParam(value = "files", required = false) MultipartFile[] files,
                          RedirectAttributes rttr) {
        Integer currentRound = exhibitionInfoService.getCurrentRound();

        Integer regRound = exhibitionInfo.getRound();

        // 검증에 실패 시 bindingResult 객체에 에러 정보 담음
        if (bindingResult.hasErrors()) {
            return "admin/round/reg";
        }

        if (regRound != null) {
            if (regRound <= currentRound) {
                bindingResult.rejectValue("round", "round.invalid", "이전회차보다 같거나 낮게 설정할 수 없습니다.");
            }
        }

        // 검증에 성공한 경우 처리 로직 실행
        // 여기 까지 오면 exhibitionInfo 객체는 검증이 통과된 상태이다.
        Boolean ok = false;

        try {
            // 등록하기
            ok = exhibitionInfoService.reg(exhibitionInfo, files);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        // 채용담당자 권한을 company로 전부 변경하기

        // 공고 전체 마감

        // 필요한 작업을 수행한 후 다른 페이지로 리다이렉트
        if (ok) {
            rttr.addFlashAttribute("message", "등록이 완료되었습니다.");
            return "redirect:/admin/round";
        } else {
            rttr.addFlashAttribute("message", "등록에 실패했습니다.");
            return "redirect:/admin/round/reg";
        }
    }


}


