package com.mountain.doo.dto.page;

import lombok.*;

@Setter @Getter @ToString
@AllArgsConstructor
@Builder
public class Search extends Page{

    private String clubRecruitType;

//    검색기능 할거면 사용
//    private String keyword;

    public Search(){
        this.clubRecruitType="";
//        this.keyword="";
    }

}
