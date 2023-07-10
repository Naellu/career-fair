package com.project.careerfair.service.user;

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
    public Map<String, Object> getList(String search, String type, Integer industryId, Integer roundValue) {
        log.info("log {}, {}, {}, {} ", search, type, industryId, roundValue);

      /*  Integer pageSize = 10; // 10개씩
        Integer startNum = (page - 1) * pageSize; // 0 10 20

        //페이지네이션 정보
        //총 글 개수
        Integer count = companyMapper.countAll(type, search, status);

        // 마지막 페이지 번호
        // 총 글개수 -1 / pageSize + 1
        Integer lastPage = (count - 1) / pageSize + 1;

        // 페이지네이션 왼쪽번호 1 11 21 31
        Integer leftPageNum = (page - 1) / pageSize * pageSize + 1;
        leftPageNum = Math.max(leftPageNum, 1);

        // 페이지네이션 오른쪽 번호
        Integer rightPageNum = leftPageNum + 9;
        rightPageNum = Math.min(rightPageNum, lastPage);

        // 이전페이지
        Integer prevPageNum = leftPageNum - 10;
        prevPageNum = Math.max(leftPageNum - 10, 1);

        // 다음 페이지
        Integer nextPageNum = leftPageNum + 10;

        Map<String, Object> pageInfo = new HashMap<>();
        pageInfo.put("lastPageNum", lastPage);
        pageInfo.put("leftPageNum", leftPageNum);
        pageInfo.put("rightPageNum", rightPageNum);
        pageInfo.put("currentPageNum", page);
        pageInfo.put("prevPageNum", prevPageNum);
        pageInfo.put("nextPageNum", nextPageNum);*/

        // 산업 목록
        List<Industry> industryList = industryService.getIndustryList();

        // 회차
        Integer round = exhibitionInfoService.getCurrentRound();

        List<Company> companyList = companyMapper.getApprovedList();
        // "pageInfo", pageInfo,
        return Map.of("companyList", companyList, "industryList", industryList, "round", round);
    }
}
