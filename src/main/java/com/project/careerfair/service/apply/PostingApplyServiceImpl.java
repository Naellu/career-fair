package com.project.careerfair.service.apply;

import com.project.careerfair.domain.JobApplication;
import com.project.careerfair.domain.Posting;
import com.project.careerfair.mapper.jobapplication.JobApplicationMapper;
import com.project.careerfair.mapper.posting.PostingMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class PostingApplyServiceImpl implements PostingApplyService{

    private final JobApplicationMapper jobApplicationMapper;
    private final PostingMapper postingMapper;
    @Override
    public Map<String, Object> getApplyList(String memberId) {
        Map<String, Object> reusltMap = new HashMap<>();

        List<JobApplication> applyList = jobApplicationMapper.getApplyList(memberId);
        List<Posting> postingDetails = new ArrayList<>();

        for (JobApplication apply : applyList){
            postingDetails.add(postingMapper.getPostViewDetailByPostingId(apply.getPostingId()));
        }
        reusltMap.put("applyList", applyList);
        reusltMap.put("post", postingDetails);

        return reusltMap;
    }

    @Override
    public Map<String, Object> getApplyInfo(Integer applicationId) {
        Map<String, Object> result = new HashMap<>();
        JobApplication application = jobApplicationMapper.getApplyInfo(applicationId);
        result.put("application", application);
        result.put("posting", postingMapper.getPostDetailByPostingId(application.getPostingId()));


        return result;
    }
}
