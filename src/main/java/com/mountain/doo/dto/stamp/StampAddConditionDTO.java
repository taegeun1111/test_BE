package com.mountain.doo.dto.stamp;

import lombok.*;

@Setter
@Getter
@ToString
@NoArgsConstructor
@EqualsAndHashCode
public class StampAddConditionDTO {
    private String accountId;
    private boolean attendCount;
    private boolean boardCount;
    private boolean bannerClickCount;
    private boolean clickEvent;

}
