package com.mountain.doo.entity.reply;

import lombok.*;

import java.time.LocalDateTime;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SecondhandReply {

    private long secondhandReplyNo;
    private long secondhandBoardNo;
    private String secondhandReplyContent;
    private String secondhandReplyWriter;
    private LocalDateTime secondhandReplyDate;
    private String profileImg;
}
