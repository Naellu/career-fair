package com.project.careerfair.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Education {

    private Integer educationId;
    private String schoolName;
    private String major;
    private String entryDate;
    private String graduationDate;
    private String status;

    private Integer resumeId;

}
