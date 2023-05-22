package com.mountain.doo.dto.reply.secondhandreply;


import com.mountain.doo.entity.reply.SecondhandReply;
import lombok.*;


@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SecondhandReplyPostRequestDTO {

    private String replyContent;
    private String replyWriter;
    private long boardNo;

    public SecondhandReply secondhandReplyEntity(){
        return SecondhandReply.builder()
                .secondhandReplyContent(this.replyContent)
                .secondhandReplyWriter(this.replyWriter)
                .secondhandBoardNo(this.boardNo)
                .build();
    }
}
