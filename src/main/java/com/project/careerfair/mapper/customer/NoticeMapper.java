package com.project.careerfair.mapper.customer;

import com.project.careerfair.domain.Notice;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NoticeMapper {
    
    // 글목록
    List<Notice> getNoticeList(Integer startNum, Integer pageSize, String search, String type);

    // 글 개수
    Integer countAll(String type, String search);

    // 글 상세
    Notice getDetail(Integer noticeId);

    //이전글
    Integer getPrevNotice(Integer noticeId);

    //다음글
    Integer getNextNotice(Integer noticeId);

    //첫번째글
    Integer getFirstNotice(Integer noticeId);

    //마지막글
    Integer getLastNotice(Integer noticeId);

    int update(Notice notice);

    void insertFileName(Integer noticeId, String originalFilename);

    void deleteFileNameByNoticeIdAndFileName(Integer noticeId, String fileName);
}

