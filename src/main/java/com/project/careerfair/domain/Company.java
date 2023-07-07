package com.project.careerfair.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Company {
    private Integer round;
    private Integer companyId;
    private String memberId;
    private String companyName;
    private String registrationNumber;
    private Integer numberOfEmployees;
    private String establishmentDate;
    private Integer revenue;
    private String postalCode;
    private String address;
    private String detailAddress;
    private String ceoName;
    private Integer industryId;
    private String status;
}
