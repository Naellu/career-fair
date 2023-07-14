package com.project.careerfair.service.scrap;

import com.project.careerfair.mapper.scrap.ScrapMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

@Service
@Slf4j
@RequiredArgsConstructor
public class ScrapServiceImpl implements ScrapService {
    private final ScrapMapper scrapMapper;
    
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
}
