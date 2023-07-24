package com.project.careerfair.service.admin;

import com.project.careerfair.domain.*;
import com.project.careerfair.mapper.jobapplication.JobApplicationMapper;
import com.project.careerfair.mapper.posting.PostingMapper;
import com.project.careerfair.mapper.scrap.ScrapMapper;
import com.project.careerfair.service.apply.PostingApplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import software.amazon.awssdk.services.s3.S3Client;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class RecruitManageServiceImpl implements RecruitManageService{

    @Autowired
    private S3Client s3;

    @Value("${aws.s3.bucketName}")
    private String bucketName;

    @Autowired
    private ExhibitionInfoService exhibitionInfoService;

    @Autowired
    private ScrapMapper scrapMapper;

    @Autowired
    private JobApplicationMapper jobApplicationMapper;

    @Autowired
    private PostingMapper postingMapper;

    @Autowired
    private PostingApplyService postingApplyService;


    @Override
    public Map<String, Object> getPosting(Integer page, String search, String type, String roundValue ) {

        Integer round = exhibitionInfoService.getCurrentRound();

        Integer pageSize = 10; // 10개씩
        Integer startNum = (page - 1) * pageSize; // 0 10 20

        //현재페이지
        Integer currentPageNum = page;

        //페이지네이션 정보
        //총 글 개수
        Integer count = postingMapper.manageCount(type, search, roundValue, round);

        // 마지막 페이지 번호
        // 총 글개수 -1 / pageSize + 1
        Integer lastPage = (count - 1) / pageSize + 1;

        //맨처음 페이지로 가기
        Integer firstPageNum = 1;
        //맨 마지막 페이지로 가기
        Integer endPageNumber = (count / 5)+1;

        // 페이지네이션 왼쪽번호 1 11 21 31
        Integer leftPageNum = page - 5;
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
        pageInfo.put("nextPageNum", nextPageNum);
        pageInfo.put("firstPageNum",firstPageNum);

        List<Posting> postingList = postingMapper.getPostId(startNum, pageSize, search, type, roundValue, round);
        return Map.of("pageInfo",pageInfo, "postList",postingList );
    }

    @Override
    public boolean jobEndForm(Integer postingId) {
        Integer cnt = postingMapper.changeStatus(postingId);

        return cnt == 1;
    }

    @Override
    public boolean removeProcess(Integer postingId) {

        //스크랩 돼있는 공고 삭제
        scrapMapper.deleteScrap(postingId);

        Integer round = exhibitionInfoService.getCurrentRound();


        List<Integer> idList = jobApplicationMapper.getApplicationId(postingId);
        if(idList.size() > 0) {
            for (Integer applicationId :idList) {
                postingApplyService.applyCancel(applicationId);
            }
        }

        int cnt = postingMapper.removeForm(postingId,round);
        return cnt == 1;
    }

}
