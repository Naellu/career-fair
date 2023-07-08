package com.project.careerfair.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class WorkCondition {

    private Integer workConditionId;
    private String salary;
    private String employmentType;

    private Integer resumeId;

}
