package com.mountain.doo.entity;

import com.mountain.doo.dto.stamp.StampAddConditionDTO;
import com.mountain.doo.repository.StampMapper;
import lombok.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Component
@Builder
public class Stamp {
//    private int stampNo;
    private String accountId;
    private boolean attendCount;  //출석카운트
    private int boardCount; //게시글 작성 카운트
    private int bannerClickCount;  //배너 클릭 카운트
    private int currentStampCount;   //현재 스탬프 개수
    private int totalStampCount;  //총 스탬프 개수
    private LocalDateTime stampTime;


}
