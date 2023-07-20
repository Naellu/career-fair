package com.project.careerfair.service.scrap;

import com.project.careerfair.domain.Posting;
import com.project.careerfair.domain.Scrap;
import com.project.careerfair.domain.ScrapInfo;
import com.project.careerfair.mapper.posting.PostingMapper;
import com.project.careerfair.mapper.scrap.ScrapMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Slf4j
@RequiredArgsConstructor
public class ScrapServiceImpl implements ScrapService {
    private final ScrapMapper scrapMapper;
    private final PostingMapper postingMapper;
    
    // 스크랩 누르기
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Map<String, Object> scrap(Integer postingId, Authentication authentication) {

        // 삭제 쿼리 먼저
        Integer deleteCnt = scrapMapper.delete(postingId, authentication.getName());

        Integer insertCnt = 0;
        // 삭제 되지 않았다면 좋아요 없는 상태이니 추가
        if (deleteCnt != 1){
            // 스크랩
            insertCnt = scrapMapper.insert(postingId, authentication.getName());
        }

        return Map.of("scraped", insertCnt == 1);
    }

    @Override
    public Map<String, Object> getScrapList(String memberId) {

        Map<String , Object> result = new HashMap<>();

        List<ScrapInfo> scrapList = scrapMapper.getListByMemberId(memberId);
        result.put("scrapList", scrapList);

        List<Posting> postingList = new ArrayList<>();

        for (ScrapInfo scrapInfo : scrapList){
            postingList.add(postingMapper.getPostDetailByPostingId(scrapInfo.getPostingId()));
        }

        result.put("postingList", postingList);

        return result;
    }

    @Override
    public boolean cancelScrap(Integer scrapId) {
        Integer check = scrapMapper.cancelScrapByScrapId(scrapId);

        return check==1;
    }
}
