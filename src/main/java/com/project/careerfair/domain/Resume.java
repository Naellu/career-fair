package com.project.careerfair.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Resume {

    private Integer resumeId;
    private String title;
    private String military;
    private String intro;
    private String created;

    private String memberId;
    private Integer industryId;

}
