package com.project.careerfair.mapper.customer;

import com.project.careerfair.domain.Notice;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NoticeMapper {

    List<Notice> getNoticeList(String search, String type);
}

