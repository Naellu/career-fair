package com.project.careerfair.domain;

import lombok.Data;

@Data
public class Files {
    private Integer fileId;
    private String fileName;
    private Integer noticeId;
    private Integer round;
    private Integer companyId;
    private Integer postingId;
    private Integer applicationId;

}
