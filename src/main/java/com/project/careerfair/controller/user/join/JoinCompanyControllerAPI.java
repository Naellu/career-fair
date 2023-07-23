package com.project.careerfair.controller.user.join;

import com.project.careerfair.domain.Industry;
import com.project.careerfair.service.admin.ExhibitionInfoService;
import com.project.careerfair.service.user.join.JoinCompanyService;
import com.project.careerfair.service.industry.IndustryService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController("userCompanyJoinControllerAPI")
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/api/user/join")
public class JoinCompanyControllerAPI {

    private final JoinCompanyService joinCompanyService;

    private final IndustryService industryService;

    private final ExhibitionInfoService exhibitionInfoService;

    @GetMapping("/industry")
    public List<Industry> industryList() {
        return industryService.getIndustryList();
    }

    @GetMapping("/round")
    public Integer getList() {
        return exhibitionInfoService.getCurrentRound();
    }


    @GetMapping
    public ResponseEntity<Map<String, Object>> getCompanies(
            @RequestParam(value = "search", required = false) String search,
            @RequestParam(value = "type", required = false) String type,
            @RequestParam(value = "industryId", required = false) Integer industryId,
            @RequestParam(value = "roundValue", required = false) Integer roundValue,
            @RequestParam(value = "page", required = false) Integer page) {
        Map<String, Object> result = joinCompanyService.getList(search, type, industryId, roundValue, page);
        return ResponseEntity.ok(result);
    }

    @GetMapping("{companyId}")
    public ResponseEntity<Map<String, Object>> getDetail(
            @PathVariable("companyId") Integer companyId,
            @RequestParam("page") Integer page,
            @RequestParam("pageNow") Integer pageNow) {
        Map<String, Object> result = joinCompanyService.getDetail(companyId, page, pageNow);
        return ResponseEntity.ok(result);
    }


}
