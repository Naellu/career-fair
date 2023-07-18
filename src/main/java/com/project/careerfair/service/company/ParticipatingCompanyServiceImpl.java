package com.project.careerfair.service.company;

import com.project.careerfair.domain.Company;
import com.project.careerfair.domain.Industry;
import com.project.careerfair.domain.Posting;
import com.project.careerfair.mapper.company.CompanyMapper;
import com.project.careerfair.mapper.posting.PostingMapper;
import com.project.careerfair.service.admin.ExhibitionInfoService;
import com.project.careerfair.service.industry.IndustryService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Slf4j
@RequiredArgsConstructor
public class ParticipatingCompanyServiceImpl implements ParticipatingCompanyService {

    private final CompanyMapper companyMapper;

    private final IndustryService industryService;

    private final ExhibitionInfoService exhibitionInfoService;

    private final PostingMapper postingMapper;

    @Override
    public Map<String, Object> getList(String search, String type, Integer industryId, Integer roundValue, Integer page) {
        //페이지 네이션
        Integer pageSize = page; //8,16,27
        Integer startNum = 0; // 0~8 0~16 0~27

        // 총 개수
        Integer count = companyMapper.countApprovedList(search, type, industryId, roundValue);

        // 산업 목록
        List<Industry> industryList = industryService.getIndustryList();

        List<Company> companyList = companyMapper.getApprovedList(startNum, pageSize, search, type, industryId, roundValue);

        return Map.of("companyList", companyList, "industryList", industryList, "count", count);
    }

    @Override
    public Map<String, Object> getDetail(Integer companyId, Integer page) {
        //기업
        Company company = companyMapper.getDetail(companyId);

        // 산업 목록
        List<Industry> industryList = industryService.getIndustryList();

        // 회차
        Integer round = exhibitionInfoService.getCurrentRound();

        List<Posting> nowPostingList = postingMapper.getNowPostingList(companyId, round);

        Integer pageSize = 5; // 5개씩
        Integer startNum = (page - 1) * pageSize; // 0 6 11

        //페이지네이션 정보
        //총 지난 공고 개수
        Integer count = postingMapper.countAll(companyId, round);

        // 마지막 페이지 번호
        // 총 글개수 -1 / pageSize + 1
        Integer lastPage = (count - 1) / pageSize + 1;

        // 페이지네이션 왼쪽번호 1 6 11
        Integer leftPageNum = page - 2;
        leftPageNum = Math.max(leftPageNum, 1);

        // 페이지네이션 오른쪽 번호
        Integer rightPageNum = leftPageNum + 5;
        rightPageNum = Math.min(rightPageNum, lastPage);

        // 이전페이지
        Integer prevPageNum = page - 1;

        // 다음 페이지
        Integer nextPageNum = page + 1;

        Map<String, Object> pageInfo = new HashMap<>();
        pageInfo.put("lastPage", lastPage);
        pageInfo.put("leftPageNum", leftPageNum);
        pageInfo.put("rightPageNum", rightPageNum);
        pageInfo.put("currentPageNum", page);
        pageInfo.put("prevPageNum", prevPageNum);
        pageInfo.put("nextPageNum", nextPageNum);

        List<Posting> pastPostingList = postingMapper.getPastPostingList(startNum, pageSize, companyId, round);

        return Map.of("company", company,
                "industryList", industryList,
                "round", round,
                "nowPostingList", nowPostingList,
                "pageInfo", pageInfo,
                "pastPostingList", pastPostingList);
    }
}
