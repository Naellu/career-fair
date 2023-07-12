package com.project.careerfair.service.posting;

import com.project.careerfair.domain.Industry;
import com.project.careerfair.domain.Posting;
import com.project.careerfair.mapper.posting.PostingMapper;
import com.project.careerfair.service.industry.IndustryService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserPostingServiceImpl implements UserPostingService {

    private final PostingMapper postingMapper;

    private final IndustryService industryService;

    @Override
    public Map<String, Object> getPostings(Integer[] industrIds, String[] experienceLevels, String[] educationLevels, String[] employmentTypes, String type, String search) {

        List<Posting> postingList = postingMapper.getNowPostingsAll(industrIds, experienceLevels, educationLevels, employmentTypes, type, search);

        List<Industry> industryList = industryService.getIndustryList();

        return Map.of("postingList", postingList, "industryList", industryList);
    }
}
