package com.project.careerfair.domain.dto.statistic;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class IndustryAgeGroupDto {

    private String industryName;
    private String ageGroup;
    private int applicantCount;

}
