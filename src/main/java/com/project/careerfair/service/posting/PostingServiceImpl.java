package com.project.careerfair.service.posting;

import com.project.careerfair.domain.Company;
import com.project.careerfair.domain.Industry;
import com.project.careerfair.domain.Posting;
import com.project.careerfair.mapper.company.CompanyMapper;
import com.project.careerfair.mapper.exhibitionInfo.ExhibitionInfoMapper;
import com.project.careerfair.mapper.industry.IndustryMapper;
import com.project.careerfair.mapper.members.MemberMapper;
import com.project.careerfair.mapper.posting.PostingMapper;
import com.project.careerfair.mapper.scrap.ScrapMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class PostingServiceImpl implements PostingService{

    private final CompanyMapper companyMapper;
    private final ExhibitionInfoMapper ehMapper;
    private final IndustryMapper industryMapper;
    private final PostingMapper postingMapper;
    private final MemberMapper memberMapper;
    private final ScrapMapper scrapMapper;

    @Override
    public Map<String, Object> getCompanyInfo(String userId) {
        Integer round = ehMapper.getCurrentRound();

        Map<String, Object> resultMap = new HashMap<>();

        List<Company> companyList = companyMapper.getListByName("now", userId, round);
        resultMap.put("companyList", companyList);

        List<Industry> industryList = industryMapper.getIndustryList();
        resultMap.put("industryList", industryList);

        return resultMap;
    }

    @Override
    public Map<String, Object> getPostingInfo(String memberId, Integer currentPage, String status) {
        Map<String, Object> resultMap = new HashMap<>();

        Integer postingCount = postingMapper.countPostingBymemberId(memberId, status);

        Map<String, Object> pageInfo = new HashMap<>();
        pageInfo.put("page", currentPage);

        Integer last = postingCount/10 + 1;
        pageInfo.put("last", last);

        Integer begin = 1 + (currentPage-1) / 10 * 10;
        Integer end = Math.min(begin + 9, last);

        pageInfo.put("begin", begin);
        pageInfo.put("end", end);

        Integer previous = Math.max(1, (currentPage-1) / 10 * 10);
        Integer next = Math.min(last, (currentPage-1) / 10 * 10 +11);
        pageInfo.put("previous",previous);
        pageInfo.put("next",next);

        Integer startIndex = currentPage * 10 -10;
        List<Posting> postingList = postingMapper.getPostingInfoByMemberId(memberId,startIndex, status);

        List<Company> companyList = new ArrayList<>();
        for (Posting posting : postingList){
            companyList.add(companyMapper.getDetail(posting.getCompanyId()));
        }

        resultMap.put("postingList",postingList);
        resultMap.put("companyList", companyList);
        resultMap.put("pageInfo", pageInfo);


        return resultMap;
    }

    @Override
    public Map<String, Object> getPostDetailByPostingId(Integer postingId) {

        Map<String, Object> postDetail = new HashMap<>();

        Posting posting = postingMapper.getPostDetailByPostingId(postingId);
        Company company = companyMapper.getDetail(posting.getCompanyId());
        List<Industry> industryList = industryMapper.getIndustryList();
        Industry industry = industryMapper.getIndustryList().get(posting.getIndustryId()-1);

        postDetail.put("post", posting);
        postDetail.put("company", company);
        postDetail.put("industry",industry.getIndustryName());
        postDetail.put("industryList",industryList);

        return postDetail;
    }

    @Override
    public Boolean addPosting(Posting posting) {


        Integer check = postingMapper.addPosting(posting);


        return check==1;
    }

    @Override
    public Boolean deletePosting(Posting posting) {
        
        //좋아요 삭제
        scrapMapper.deleteByPostingId(posting);

        return postingMapper.deletePosting(posting) == 1;
    }

    @Override
    public Boolean modifyPosting(Posting posting) {

        return postingMapper.modifyPosting(posting) == 1;
    }
}
