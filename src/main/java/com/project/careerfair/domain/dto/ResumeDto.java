package com.project.careerfair.domain.dto;

import com.project.careerfair.domain.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Getter
@Setter
@ToString
public class ResumeDto {

    private Integer resumeId;
    private List<Career> careers;
    private List<Education> educations;
    private List<Certification> certifications;
    private List<WorkArea> workAreas;
    private WorkCondition workCondition;

    private String memberId;

    private String title;
    private String military;
    private String intro;
    private Integer industryId;


}
