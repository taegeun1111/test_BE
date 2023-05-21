package com.mountain.doo.dto.reply.clubreply;


import com.fasterxml.jackson.annotation.JsonFormat;
import com.mountain.doo.entity.reply.ClubReply;
import lombok.*;

import java.time.LocalDateTime;


@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ClubReplyDetailResponseDTO {

    private long replyNo;
    private String replyContent;
    private String replyWriter;

    @JsonFormat(pattern="yyyy년 MM월 dd일 HH:mm")
    private LocalDateTime replyRegDate;

    public ClubReplyDetailResponseDTO(ClubReply clubReply) {
        this.replyNo = clubReply.getClubReplyNo();
        this.replyContent = clubReply.getClubReplyContent();
        this.replyWriter = clubReply.getClubReplyWriter();
        this.replyRegDate = clubReply.getClubReplyDate();
    }
}
