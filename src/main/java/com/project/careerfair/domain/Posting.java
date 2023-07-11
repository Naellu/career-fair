package com.project.careerfair.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Posting {

    private Integer postingId;
    private String title;
    private String memberId;
    private Integer hiringCount;
    private Integer spareCount;
    private String startDate;
    private String endDate;
    private String status;
    private String address;
    private String salary;
    private String preference;
    private String benefit;
    private String requirement;
    private String etc;
    private String employmentType;
    private String experienceLevel;
    private String educationLevel;

    private Integer companyId;
    private Integer round;
    private Integer industryId;
    private Integer applicationCount;

}
