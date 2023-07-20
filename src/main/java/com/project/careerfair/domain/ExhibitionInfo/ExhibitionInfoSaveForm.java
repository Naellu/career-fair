package com.project.careerfair.domain.ExhibitionInfo;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Getter
@Setter
@ToString
public class ExhibitionInfoSaveForm {

    @NotNull(message = "회차의 공백이 허용되지 않습니다.")
    private Integer round;

    @NotBlank(message = "주소의 공백이 허용되지 않습니다.")
    private String location;

    @NotBlank(message = "담당자 이메일의 공백이 허용되지 않습니다.")
    @Pattern(regexp = "\\w+@\\w+\\.\\w+", message = "이메일 형식이 올바르지 않습니다.")
    private String managerEmail;

    @NotBlank(message = "개최자의 공백이 허용되지 않습니다.")
    private String organizer;

    @NotBlank(message = "개최일의 공백이 허용되지 않습니다.")
    private String startDate;

    @NotBlank(message = "폐막일의 공백이 허용되지 않습니다.")
    private String endDate;

    private String etc;

    private String bus;

    private String subway;

    @NotBlank(message = "박람회 타이틀의 공백이 허용되지 않습니다.")
    private String title;

    private List<String> fileName;
}
