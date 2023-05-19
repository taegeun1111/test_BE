package com.mountain.doo.dto.page;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Setter
@Getter
@ToString
public class SecondhandSearch extends Page {

    private String secondhandType;
    private String type;
    private String keyword;

    public SecondhandSearch() {
        this.secondhandType="";
        this.type = "";
        this.keyword = "";
    }
}
