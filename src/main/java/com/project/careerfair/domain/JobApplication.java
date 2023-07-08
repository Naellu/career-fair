package com.project.careerfair.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class JobApplication {
    private Integer applicationId;
    private String applicationDate;
    private String applicationStatus;

    private Integer postingId;
    private String memberId;

}
