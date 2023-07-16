package com.project.careerfair.controller.qna;

import com.project.careerfair.domain.QnaAnswer;
import com.project.careerfair.service.qna.QnaAnswerService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("answer")
@RequiredArgsConstructor
public class QnaAnswerController {

    private final QnaAnswerService service;

    @GetMapping("list")
    public List<QnaAnswer> list(@RequestParam("question") Integer questionId, Authentication authentication) {

        return service.list(questionId, authentication);
    }

    @PostMapping("add")
    public ResponseEntity<Map<String, Object>> add (
            @RequestBody QnaAnswer answer) {
        Map<String, Object> res = service.add(answer);

        return ResponseEntity.ok().body(res);
    }

    @GetMapping("id/{id}")
    public QnaAnswer get(@PathVariable("id") Integer id) {
        return service.get(id);
    }

}
