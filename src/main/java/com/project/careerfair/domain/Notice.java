package com.project.careerfair.domain;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;
import java.util.List;

@Getter
@Setter
public class Notice {
    Integer noticeId;
    String title;
    String content;
    LocalDate created;
    String memberId;
    Integer hit;

    private List<String> fileName;
}
