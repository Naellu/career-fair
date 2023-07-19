package com.project.careerfair.mapper.scrap;

import com.project.careerfair.domain.Posting;
import com.project.careerfair.domain.Scrap;
import com.project.careerfair.domain.ScrapInfo;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ScrapMapper {
    // 스크랩 되어잇는지 체크
    Scrap scrapCheck(Integer postingId, String memberId);

    // 스크랩 넣기
    Integer insert(Integer postingId, String memberId);

    // 스크랩 삭제하기
    Integer delete(Integer postingId, String memberId);

    void deleteByPostingId(Posting posting);

    @Select("""
            SELECT
                scrap_id, TS.member_id member_id, TS.posting_id posting_id,
                TP.round round, company_name, title, hiring_count, start_date, end_date, TP.status status, application_count
            FROM
                TB_SCRAP TS JOIN (TB_POSTING TP JOIN TB_COMPANIES TC on TP.company_id = TC.company_id )on TS.posting_id = TP.posting_id
            WHERE TS.member_id = #{memberId}
            ORDER BY
            scrap_id DESC
            """)
    @ResultMap("scrapInfo")
    List<ScrapInfo> getListByMemberId(String memberId);

    @Delete("""
            DELETE FROM TB_SCRAP
            WHERE scrap_id = #{scrapId}
            """)
    Integer cancelScrapByScrapId(Integer scrapId);
}
