package com.mountain.doo.dto.reply.secondhandreply;


import com.fasterxml.jackson.annotation.JsonFormat;
import com.mountain.doo.entity.reply.FeedReply;
import lombok.*;

import java.time.LocalDateTime;


@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SecondhandReplyDetailResponseDTO {

    private long replyNo;
    private String replyContent;
    private String replyWriter;

    @JsonFormat(pattern="yyyy년 MM월 dd일 HH:mm")
    private LocalDateTime replyRegDate;

    public SecondhandReplyDetailResponseDTO(FeedReply feedReply) {
        this.replyNo = feedReply.getFeedReplyNo();
        this.replyContent = feedReply.getFeedReplyContent();
        this.replyWriter = feedReply.getFeedReplyWriter();
        this.replyRegDate = feedReply.getFeedReplyDate();
    }
}