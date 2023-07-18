package com.project.careerfair.mapper.statistic;

import com.project.careerfair.domain.Posting;
import com.project.careerfair.domain.Statistic;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface StatisticMapper {

    List<Statistic> getAllPostings();

}
