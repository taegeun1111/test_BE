package com.mountain.doo.dto.page;

import lombok.*;

@Getter @Setter @ToString
@AllArgsConstructor

public class Page {
    private int pageNo; //클라가 보낸 페이지 번호
    private int amount; //클라가 보낸 목록게시물 수 (한 페이지에 몇개씩 보여줄 지)

    public Page(){
        this.pageNo=1;
        this.amount=6;
    }

    public void setAmount(int amount){
        if(amount<6||amount>10){
            this.amount=6;
            return;
        }
//        amount가 7,8,9일 때
        this.amount=amount;
    }

    public void setPageNo(int pageNo){
        if(pageNo<1||pageNo>Integer.MAX_VALUE){
            this.pageNo=1;
            return;
        }
        this.pageNo=pageNo;
    }

    public int getPageStart(){
        return (pageNo-1)*amount;
    }

}
