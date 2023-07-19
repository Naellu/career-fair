package com.project.careerfair.controller.jobApplication;

import com.project.careerfair.domain.Files;
import com.project.careerfair.domain.JobApplication;
import com.project.careerfair.domain.Members;
import com.project.careerfair.domain.Resume;
import com.project.careerfair.service.jobApplication.JobApplicationService;
import com.project.careerfair.service.posting.PostingService;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("jobApplication")
public class JobApplicationController {

    private final JobApplicationService service;

    // 포스팅 id에 지원한 지원자들 보여주기
    @GetMapping("list")
    public void getList(@RequestParam("postingId") Integer postingId, Model model) {
        List<JobApplication> list = service.getList(postingId);
        model.addAttribute("postingList", list);
    }

    // 포스팅 id에 지원한 지원자들의 정보 보기 및 지원 상태 변경, 쪽지 보내기
    @GetMapping("get")
    public void getDetails(@RequestParam("memberId") String memberId, Model model) {
        List<Members> memberList = service.getDetails(memberId);

        model.addAttribute("memberDetail", memberList);
    }

    // 지원자 상태 변경
    @PostMapping("update")
    public String updateStatus(@RequestParam("memberId") String memberId,
                               @RequestParam("applicationId") Integer applicationId,
                               @RequestParam("applicationStatus") String applicationStatus,
                               @RequestParam("postingId") Integer postingId) {
        service.updateStatus(memberId, applicationId, applicationStatus, postingId);

        return "redirect:/jobApplication/list?postingId=" + postingId;
    }



    @GetMapping("fileDetail/{applicationId}")
    public void getFileDetail(@PathVariable("applicationId") Integer applicationId, Model model) {
        List<Files> fileList = service.getFileDetails(applicationId);

        model.addAttribute("fileList", fileList);
    }

    @GetMapping("/fileDownload/{fileName}")
    public ResponseEntity<byte[]> download(@PathVariable String fileName) throws IOException {
        return service.getObject(fileName);
    }

}
