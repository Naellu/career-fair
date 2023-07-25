package com.project.careerfair.service.industry;

import com.project.careerfair.domain.Industry;
import com.project.careerfair.mapper.industry.IndustryMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class IndustryServiceImpl implements IndustryService{

    private final IndustryMapper industryMapper;

    @Override
    public List<Industry> getIndustryList() {
        return industryMapper.getIndustryList();
    }

    @Override
    public List<Industry> getIndustryListWithRound(Integer round) {
        return industryMapper.getIndustryListWithRound(round);
    }

    @Override
    public Industry findIndustryNameById(Integer industryId) {
        return industryMapper.findIndustryNameById(industryId);
    }


}
