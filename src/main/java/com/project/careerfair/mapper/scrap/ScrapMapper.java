package com.project.careerfair.mapper.scrap;

import com.project.careerfair.domain.Posting;
import com.project.careerfair.domain.Scrap;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ScrapMapper {
    // 스크랩 되어잇는지 체크
    Scrap scrapCheck(Integer postingId, String memberId);

    // 스크랩 넣기
    Integer insert(Integer postingId, String memberId);

    // 스크랩 삭제하기
    Integer delete(Integer postingId, String memberId);

    void deleteByPostingId(Posting posting);
}
