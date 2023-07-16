package com.project.careerfair.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Certification {

    private Integer certificationId;
    private String certificationName;
    private String getDate;
    private String organization;

    private Integer resumeId;

}
