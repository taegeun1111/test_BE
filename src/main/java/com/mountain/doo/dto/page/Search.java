package com.mountain.doo.dto.page;

import com.mountain.doo.entity.SecondhandType;
import lombok.*;

@Setter
@Getter
@AllArgsConstructor
@Builder
public class Search extends Page{

    // 검색 타입, 검색 키워드
    private String type;
    private String keyword;

    public Search() {
        this.type = "";
        this.keyword = "";
        this.setAmount(10);
    }

    @Override
    public String toString() {
        return "Search{" +
                "type='" + type + '\'' +
                ", keyword='" + keyword + '\'' +
                "} " + super.toString();
    }
}
