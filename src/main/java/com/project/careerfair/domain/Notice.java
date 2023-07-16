package com.project.careerfair.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Getter
@Setter
@ToString
public class Notice {
    private Integer noticeId;
    private String title;
    private String content;
    private LocalDateTime created;
    private String memberId;
    private Integer hit;
    private String modifierId;
    private LocalDateTime modified;

    private List<String> fileName;
}
