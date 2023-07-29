package com.mountain.doo.dto.stamp;

import com.mountain.doo.entity.Stamp;
import lombok.*;

@Setter
@Getter
@ToString
@NoArgsConstructor
@EqualsAndHashCode
public class StampResponseDTO {
    private String accountId;
    private int attendCount;
    private int boardCount;
    private int bannerClickCount;
    private int totalStampCount;

    public StampResponseDTO(Stamp stamp){
        this.accountId=stamp.getAccountId();
        this.attendCount=stampAttend(stamp);
        this.boardCount=stamp.getBoardCount();
        this.bannerClickCount=stamp.getBannerClickCount();
        this.totalStampCount=stamp.getTotalStampCount();
    }
    public int stampAttend(Stamp stamp){
        boolean attendCount1 = stamp.isAttendCount();
        if(attendCount1){
            this.attendCount=1;
            return 1;
        }
        return 0;
    }
}