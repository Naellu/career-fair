package com.project.careerfair.controller.qna;

import com.project.careerfair.domain.QnaAnswer;
import com.project.careerfair.service.qna.QnaAnswerService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/answer/")
@RequiredArgsConstructor
public class QnaAnswerController {

    private final QnaAnswerService service;

    @GetMapping("list")
    public List<QnaAnswer> list(@RequestParam("question") Integer qnaId, Authentication authentication) {

        return service.list(qnaId, authentication);
    }

    @PostMapping("add")
    @PreAuthorize("hasAuthority('admin') or hasAuthority('company') or hasAuthority('recruiter')")
    public ResponseEntity<Map<String, Object>> add (
            @RequestBody QnaAnswer answer, Authentication authentication) {

        if (authentication == null) {
            return ResponseEntity.status(403).build();
        }
        Map<String, Object> res = service.add(answer, authentication);



        return ResponseEntity.ok().body(res);
    }

    @GetMapping("id/{id}")
    public QnaAnswer get(@PathVariable("id") Integer id) {
        return service.get(id);
    }

    @DeleteMapping("id/{id}")
    @PreAuthorize("hasAuthority('admin') or hasAuthority('company') or hasAuthority('recruiter') and @customSecurityChecker.checkQnaAnswerWriter(authentication, #id)")
    public ResponseEntity<Map<String, Object>> remove(
            @PathVariable("id") Integer id) {
        Map<String, Object> res = service.remove(id);

        return ResponseEntity.ok().body(res);
    }

}
