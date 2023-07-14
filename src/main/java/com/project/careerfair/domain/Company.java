package com.project.careerfair.domain;

import jakarta.validation.constraints.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Getter
@Setter
@ToString
public class Company {
    private Integer round;
    private Integer companyId;
    private String memberId;

    @NotBlank
    private String companyName;

    @NotBlank
    @Pattern(regexp = "\\d{3}-\\d{2}-\\d{5}")
    private String registrationNumber;

    @NotNull
    @PositiveOrZero
    private Integer numberOfEmployees;

    @NotBlank
    private String establishmentDate;

    @NotNull
    private Integer revenue;

    private String postalCode;

    private String address;

    @NotBlank
    private String detailAddress;

    @NotBlank
    private String ceoName;

    private Integer industryId;

    private String status;
    private List<String> fileName;
}
