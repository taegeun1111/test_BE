package com.mountain.doo.entity;

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
    int secondhandReplyNo;
    int secondhandReplyContent;
    String secondhandReplyWriter;
    LocalDateTime secondhandReplyDate;
}
