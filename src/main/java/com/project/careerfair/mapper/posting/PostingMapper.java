package com.project.careerfair.mapper.posting;

import com.project.careerfair.domain.Posting;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;

import java.util.List;

import java.util.List;

@Mapper
public interface PostingMapper {

    List<Posting> getNowPostingList(Integer companyId);

    Integer countAll(Integer companyId);

    List<Posting> getPastPostingList(Integer startNum, Integer pageSize, Integer companyId);
    @Select("""
            SELECT * FROM TB_POSTING
            WHERE member_id = #{memberId}
            ORDER BY posting_id DESC
            LIMIT #{startIndex}, 10
            """)
    @ResultMap("postingMap")
    List<Posting> getPostingInfoByMemberId(String memberId, Integer startIndex);

    @Select("""
            SELECT COUNT(*)
            FROM TB_POSTING
            WHERE member_id = #{memberId}
            """)
    Integer countPostingBymemberId(String memberId);

}
