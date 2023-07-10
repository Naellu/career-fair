package com.project.careerfair.service.posting;

import com.project.careerfair.domain.Company;
import com.project.careerfair.domain.Industry;
import com.project.careerfair.mapper.company.CompanyMapper;
import com.project.careerfair.mapper.exhibitionInfo.ExhibitionInfoMapper;
import com.project.careerfair.mapper.industry.IndustryMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class PostingServiceImpl implements PostingService{

    private final CompanyMapper companyMapper;
    private final ExhibitionInfoMapper ehMapper;
    private final IndustryMapper industryMapper;

    @Override
    public Map<String, Object> getCompanyInfo(String userId) {
        Integer round = ehMapper.getCurrentRound();

        Map<String, Object> resultMap = new HashMap<>();

        List<Company> companyList = companyMapper.getListByName("now", userId, round);
        resultMap.put("company", companyList.get(0));

        List<Industry> industryList = industryMapper.getIndustryList();
        resultMap.put("industryList", industryList);

        return resultMap;
    }
}
