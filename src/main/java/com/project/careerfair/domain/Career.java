package com.project.careerfair.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Career {

    private Integer careerId;
    private String companyName;
    private String entryDate;
    private String resignationDate;
    private String description;
    private String position;
    private String etc;

    private Integer resumeId;
}
