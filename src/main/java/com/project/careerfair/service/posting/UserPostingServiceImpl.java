package com.project.careerfair.service.posting;

import com.project.careerfair.domain.Industry;
import com.project.careerfair.domain.Posting;
import com.project.careerfair.mapper.posting.PostingMapper;
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
public class UserPostingServiceImpl implements UserPostingService {

    private final PostingMapper postingMapper;

    private final IndustryService industryService;

    @Override
    public Map<String, Object> getPostings(Integer[] industrIds, String[] experienceLevels, String[] educationLevels, String[] employmentTypes, String type, String search, Integer page) {
        //페이징 시작
        Integer pageSize = 10; //10 20 30
        Integer startNum = (page - 1) * pageSize; //0 10 20

        // 총개수
        Integer count = postingMapper.getNowPostingsCount(industrIds, experienceLevels, educationLevels, employmentTypes, type, search);

        // 최종페이지
        Integer lastPage = (count - 1) / pageSize + 1;

        // 페이징 왼쪽 번호 1, 11, 21
        Integer leftPageNum = (page - 1) / pageSize * pageSize + 1;
        leftPageNum = Math.max(leftPageNum, 1);

        // 페이징 오른쪽 번호
        Integer rightPageNum = leftPageNum + 9;
        rightPageNum = Math.min(rightPageNum, lastPage);

        // 이전 페이지
        Integer prevPageNum = leftPageNum - 10;
        
        // 다음 페이지
        Integer nextPageNum = leftPageNum + 10;

        Map<String, Integer> pageInfo = new HashMap<>();
        pageInfo.put("lastPageNum", lastPage);
        pageInfo.put("leftPageNum", leftPageNum);
        pageInfo.put("rightPageNum", rightPageNum);
        pageInfo.put("currentPageNum", page);
        pageInfo.put("prevPageNum", prevPageNum);
        pageInfo.put("nextPageNum", nextPageNum);
        pageInfo.put("count", count);

        List<Posting> postingList = postingMapper.getNowPostingsAll(pageSize, startNum, industrIds, experienceLevels, educationLevels, employmentTypes, type, search);

        List<Industry> industryList = industryService.getIndustryList();

        return Map.of("postingList", postingList, "industryList", industryList, "pageInfo", pageInfo);
    }
}
