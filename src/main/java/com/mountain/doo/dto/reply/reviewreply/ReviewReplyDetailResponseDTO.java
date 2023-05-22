package com.mountain.doo.dto.reply.reviewreply;


import com.fasterxml.jackson.annotation.JsonFormat;
import com.mountain.doo.entity.reply.ReviewReply;
import lombok.*;

import java.time.LocalDateTime;


@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReviewReplyDetailResponseDTO {

    private long replyNo;
    private String replyContent;
    private String replyWriter;

    @JsonFormat(pattern="yyyy년 MM월 dd일 HH:mm")
    private LocalDateTime replyRegDate;

    public ReviewReplyDetailResponseDTO(ReviewReply reviewReply) {
        this.replyNo = reviewReply.getReviewReplyNo();
        this.replyContent = reviewReply.getReviewReplyContent();
        this.replyWriter = reviewReply.getReviewReplyWriter();
        this.replyRegDate = reviewReply.getReviewReplyDate();
    }
}
