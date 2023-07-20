package com.project.careerfair.domain.ExhibitionInfo;

import jakarta.validation.constraints.Min;
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
public class ExhibitionInfo {

    //@NotNull(message = "공백은 허용되지 않습니다.")
    private Integer round;

    // @NotBlank(message = "공백은 허용되지 않습니다.")
    private String location;

    //@NotBlank(message = "공백은 허용되지 않습니다.")
    // @Pattern(regexp = "\\w+@\\w+\\.\\w+", message = "이메일 형식이 올바르지 않습니다.")
    private String managerEmail;

    //@NotBlank(message = "공백은 허용되지 않습니다.")
    private String organizer;

    //@NotBlank(message = "공백은 허용되지 않습니다.")
    private String startDate;

    //@NotBlank(message = "공백은 허용되지 않습니다.")
    private String endDate;

    private String etc;

    private String bus;

    private String subway;

    //@NotBlank(message = "공백은 허용되지 않습니다.")
    private String title;

    private List<String> fileName;

    public ExhibitionInfo() {
    }

    public ExhibitionInfo(Integer round, String location, String managerEmail, String organizer, String startDate, String endDate, String etc, String bus, String subway, String title) {
        this.round = round;
        this.location = location;
        this.managerEmail = managerEmail;
        this.organizer = organizer;
        this.startDate = startDate;
        this.endDate = endDate;
        this.etc = etc;
        this.bus = bus;
        this.subway = subway;
        this.title = title;
    }
}
