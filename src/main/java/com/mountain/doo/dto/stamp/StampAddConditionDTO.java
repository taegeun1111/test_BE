package com.mountain.doo.dto.stamp;

import com.mountain.doo.repository.StampMapper;
import lombok.*;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.LocalDateTime;

@Setter
@Getter
@ToString
@NoArgsConstructor
@EqualsAndHashCode
@AllArgsConstructor
@Builder
public class  StampAddConditionDTO {
    private String accountId;
    private boolean attendCount;
//    private int boardCount;
    private boolean bannerClickCount;
    private boolean clickEvent;
//    private LocalDateTime stampTime;



}