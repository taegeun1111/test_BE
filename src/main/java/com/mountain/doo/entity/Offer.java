package com.mountain.doo.entity;


import com.mountain.doo.dto.ClubWriteRequestDTO;
import lombok.*;

import java.time.LocalDateTime;

@Setter @Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Offer {
    private int offerBoardNo;
    private String accountId;
    private String offerType;
    private String offerTitle1;
    private String offerContent1;
    private String offerTitle2;
    private String offerContent2;
    private String offerTitle3;
    private String offerContent3;
    private String offerTitle4;
    private String offerContent4;

    public Offer(Offer dto){
        this.accountId=dto.getAccountId();
        this.offerType=dto.getOfferType();
        this.offerTitle1 = dto.getOfferTitle1();
        this.offerContent1 = dto.getOfferContent1();
    }
}
