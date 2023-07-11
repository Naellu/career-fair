package com.project.careerfair.service.company;

import com.project.careerfair.domain.Company;
import com.project.careerfair.domain.Industry;
import com.project.careerfair.mapper.company.CompanyMapper;
import com.project.careerfair.service.admin.ExhibitionInfoService;
import com.project.careerfair.service.industry.IndustryService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@Slf4j
@RequiredArgsConstructor
public class ParticipatingCompanyServiceImpl implements ParticipatingCompanyService {

    private final CompanyMapper companyMapper;

    private final IndustryService industryService;

    private final ExhibitionInfoService exhibitionInfoService;

    @Override
    public Map<String, Object> getList(String search, String type, Integer industryId, Integer roundValue, Integer page) {
        //페이지 네이션
        Integer pageSize = page; //8,16,27
        Integer startNum = 0; // 0~8 0~16 0~27

        // 총 개수
        Integer count = companyMapper.countApprovedList(search, type, industryId, roundValue);

        // 산업 목록
        List<Industry> industryList = industryService.getIndustryList();

        // 회차
        Integer round = exhibitionInfoService.getCurrentRound();

        List<Company> companyList = companyMapper.getApprovedList(startNum, pageSize, search, type, industryId, roundValue);

        return Map.of("companyList", companyList, "industryList", industryList, "round", round, "count", count);
    }

    @Override
    public Map<String, Object> getDetail(Integer companyId) {
        //기업
        Company company = companyMapper.getDetail(companyId);

        // 산업 목록
        List<Industry> industryList = industryService.getIndustryList();

        // 회차
        Integer round = exhibitionInfoService.getCurrentRound();


        return Map.of("company", company, "industryList", industryList, "round", round);
    }
}
