package com.project.careerfair.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ExhibitionInfo {
    private Integer round;
    private String location;
    private String managerEmail;
    private String organizer;
    private String startDate;
    private String endDate;
    private String etc;
}
