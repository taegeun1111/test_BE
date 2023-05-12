package com.mountain.doo.dto.Page;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@AllArgsConstructor
@ToString

public class Page {
    private int pageNo;
    private int amount;

    public Page() {
        this.pageNo = 1;
        this.amount = 10;

    }

    //사용자가 다른 번호 입력하면 page는 1로
    public void setPageNo(int pageNo) {
        if (pageNo != this.pageNo) {
            this.pageNo = 1;
        }
    }

    //사용자가 다른 번호 입력하면 amount 는 1로
    public void setAmount(int amount) {
        if (this.amount != amount) {
            this.amount = 10;
        }
    }

    //페이지에 게시글 몇개씩 띄울지
    public int getPageStart(){
        return (pageNo-1)*amount;
    }

}
