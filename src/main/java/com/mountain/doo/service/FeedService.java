package com.mountain.doo.service;


import com.mountain.doo.dto.feed.FeedDetailResponseDTO;
import com.mountain.doo.dto.feed.FeedListResponseDTO;
import com.mountain.doo.dto.feed.FeedRewriteRequestDTO;
import com.mountain.doo.dto.feed.FeedWriteRequestDTO;
import com.mountain.doo.dto.like.ReviewLikeResponseDTO;
import com.mountain.doo.dto.page.ClubSearch;
import com.mountain.doo.dto.page.Page;
import com.mountain.doo.dto.page.Search;
import com.mountain.doo.entity.Feed;
import com.mountain.doo.repository.FeedMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

import static java.util.stream.Collectors.*;


@Service
@RequiredArgsConstructor
public class FeedService {

    //repository에 의존

    private final FeedMapper feedRepository;


    // 게시글 전체목록 처리
    public List<FeedListResponseDTO> getList(Page page){
        return feedRepository.findAll(page)
                .stream()
                .map(FeedListResponseDTO::new)
                .collect(toList());
    }

    // 게시글 상세조회 처리
    public FeedDetailResponseDTO getDetail(int feedNo){
        Feed feed = feedRepository.findOne(feedNo);

        //조회수 상승 처리
        feedRepository.upViewCount(feedNo);

        return new FeedDetailResponseDTO(feed);
    }

    // 글 등록 처리
    public boolean register(FeedWriteRequestDTO dto,final String savePath){
        Feed feed = new Feed(dto, savePath);
        return feedRepository.save(feed);
    };

    // 글 삭제 처리
    public boolean delete(int boardNo){
        return feedRepository.deleteFeed(boardNo);
    }

    // 글 수정 처리
    public boolean modify(FeedRewriteRequestDTO dto){
        return feedRepository.modifyFeed(new Feed(dto));
    }

    //페이징 처리 위한 count 처리
    public int getCount(Search search) {
        return feedRepository.feedCount(search);
    }

    //클릭 시 좋아요 +1 재클릭시 좋아요 -1
    public void clickLike(ReviewLikeResponseDTO dto) {
        int islike = islike(dto);

        if (dto.isClickLike()) {
            if (islike != 1) {   //클릭시 좋아요가 없다면
                feedRepository.plusLike(dto);   //좋아요 +1
            } else {
                feedRepository.minusLike(dto);  //아니면 좋아요 -1

            }

            //좋아요테이블에서 게시물 번호별 count 체크하고 게시물 테이블에 like_count 수정하기
            feedRepository.updateLikeCount(dto.getReviewBoardNo());
        }
    }

    //좋아요가 있나 없나 확인
    public int islike(ReviewLikeResponseDTO dto){
        int i = feedRepository.likeCount(dto);
        return i;
    }

}
