package com.project.careerfair.controller.company;

import com.project.careerfair.domain.JobApplication;
import com.project.careerfair.domain.Members;
import com.project.careerfair.service.jobApplication.JobApplicationService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import software.amazon.awssdk.services.s3.S3Client;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("jobApplication")
public class JobApplicationController {

    private final JobApplicationService service;

    private final S3Client amazonS3;

    @Value("${aws.s3.bucketName}")
    private String bucketName;

    // 포스팅 id에 지원한 지원자들 보여주기
    @GetMapping("list")
    public void getList(@RequestParam("postingId") Integer postingId, Model model) {
        List<JobApplication> list = service.getList(postingId);
        model.addAttribute("postingList", list);
    }

    // 포스팅 id에 지원한 지원자들의 정보 보기 및 지원 상태 변경, 쪽지 보내기
    @GetMapping("get")
    public void getDetails(@RequestParam("memberId") String memberId, Model model,
                           @RequestParam("applicationId") Integer applicationId,
                           @RequestParam("postingId") Integer postingId) {
        List<Members> memberList = service.getDetails(memberId);
        model.addAttribute("memberDetail", memberList);
        model.addAttribute("fileApplicationId", applicationId);
        model.addAttribute("postingId", postingId);
        List<String> files = service.getFileDetails(applicationId);

        model.addAttribute("fileName", files);

//        Integer applicationId = service.getApplicationIdByMemberId(memberId);
//        model.addAttribute("fileApplicationId", applicationId);
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

//    @GetMapping("fileDetail/{applicationId}")
//    public void getFileDetail(@PathVariable("applicationId") Integer applicationId, Model model) {
//        model.addAttribute("applicationId", applicationId);
//
//
////        return "redirect:/jobApplication/fileDownload/" + files.getFileName();
//    }
//
//    @GetMapping("/fileDownload/{fileName}")
//    public ResponseEntity<InputStreamResource> downloadFile(@PathVariable String fileName) {
//        GetObjectRequest getObjectRequest = GetObjectRequest.builder()
//                .bucket(bucketName)
//                .key(fileName)
//                .build();
//
//        try {
//            ResponseBytes responseBytes = amazonS3.getObjectAsBytes(getObjectRequest);
//
//            HttpHeaders headers = new HttpHeaders();
//            headers.setContentDispositionFormData("attachment", fileName);
//            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
//
//            return ResponseEntity.ok()
//                    .headers(headers)
//                    .body(new InputStreamResource(responseBytes.asInputStream()));
//        } catch (Exception e) {
//            e.printStackTrace();
//            return ResponseEntity.notFound().build();
//        }
//    }

}
