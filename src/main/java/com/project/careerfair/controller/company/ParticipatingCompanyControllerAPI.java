package com.project.careerfair.controller.company;

import com.project.careerfair.domain.Industry;
import com.project.careerfair.service.admin.ExhibitionInfoService;
import com.project.careerfair.service.company.ParticipatingCompanyService;
import com.project.careerfair.service.industry.IndustryService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/api/company/")
public class ParticipatingCompanyControllerAPI {

    private final ParticipatingCompanyService participatingCompanyService;

    private final IndustryService industryService;

    private final ExhibitionInfoService exhibitionInfoService;

    @GetMapping("industry")
    public List<Industry> industryList() {
        return industryService.getIndustryList();
    }

    @GetMapping("round")
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
        Map<String, Object> result = participatingCompanyService.getList(search, type, industryId, roundValue, page);
        return ResponseEntity.ok(result);
    }

    @GetMapping("{companyId}")
    public ResponseEntity<Map<String, Object>> getDetail(
            @PathVariable("companyId") Integer companyId,
            @RequestParam("page") Integer page) {
        Map<String, Object> result = participatingCompanyService.getDetail(companyId, page);
        return ResponseEntity.ok(result);
    }


}
