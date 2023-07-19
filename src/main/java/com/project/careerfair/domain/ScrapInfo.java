package com.project.careerfair.domain;

import lombok.Data;

@Data
public class ScrapInfo {
    private Integer scrapId;

    private String memberId;
    private Integer postingId;
    private Integer round;
    private String companyName;
    private String title;
    private Integer hiringCount;
    private String startDate;
    private String endDate;
    private String status;
    private Integer applicationCount;
}


