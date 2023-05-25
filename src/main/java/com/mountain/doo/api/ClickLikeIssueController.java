package com.mountain.doo.api;

import com.mountain.doo.dto.issue.IssueDetailResponseDTO;
import com.mountain.doo.dto.like.IssueLikeResponseDTO;
import com.mountain.doo.service.IssueService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/issue-like")
@Slf4j
public class ClickLikeIssueController {
    private final IssueService issueService;

    @PostMapping
    public ResponseEntity<?> register(
            @Validated @RequestBody IssueLikeResponseDTO dto // 요청 바디에 보내줌
            , BindingResult result
    ){
        log.info("likeClick 비동기 클릭 발생 POST!");
        log.info("dto : {}", dto);
        if (result.hasErrors()){
            return ResponseEntity.badRequest()
                    .body(result.toString());
        }

        IssueDetailResponseDTO responseDTO = issueService.clickLike(dto);
        log.info("컨트롤러에서 보내기전 listDTO : {}",responseDTO);

        return ResponseEntity.ok().body(responseDTO);
    }


}