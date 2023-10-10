package com.mountain.doo.api;

import com.mountain.doo.dto.AccountResponseDTO;
import com.mountain.doo.dto.feed.FeedLikeUserResponseDTO;
import com.mountain.doo.dto.feed.FeedListResponseDTO;
import com.mountain.doo.dto.page.PageMaker;
import com.mountain.doo.dto.page.Search;
import com.mountain.doo.service.FeedService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@RestController
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/api")
@CrossOrigin
public class feedApiController {
    private final FeedService feedService;
    @GetMapping("/login")
    public ResponseEntity<?> login(HttpServletRequest request) throws IOException{
        log.info("api요청");
        HttpSession session = request.getSession();
        Object loginInfo = session.getAttribute("login");
        log.info("loginInfo : {}",loginInfo);

        return ResponseEntity.ok().body(loginInfo);
    }

    @GetMapping("/list")
    public ResponseEntity<?> list(Search page){
        log.info("list api 요청");

        page.setAmount(8);
        page.setType("");
        page.setKeyword("");
        List<FeedListResponseDTO> responseDTO = feedService.getList(page);

        PageMaker maker = new PageMaker(page, feedService.getCount(page));
        log.info("responseDTO : {}",responseDTO);
        log.info("maker : {}",maker);

        return ResponseEntity.ok().body(responseDTO);
    }
}
