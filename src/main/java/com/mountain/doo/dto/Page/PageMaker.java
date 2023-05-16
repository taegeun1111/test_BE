package com.mountain.doo.dto.Page;

import lombok.Getter;
import lombok.ToString;

@Getter @ToString
public class PageMaker {

    // 한번에 그려낼 페이지 수
    // 1 ~ 10, 11 ~ 20
    private static final int PAGE_COUNT = 10;

    // 화면 렌더링시 페이지의 시작값과 끝값
    private int begin, end, finalPage;

    // 이전, 다음 버튼 활성화 여부
    private boolean prev, next;

    // 현재 요청 페이지 정보
    private Page page;

    // 총 게시물 수
    private int totalCount;

    public PageMaker(Page page,int totalCount){
        this.page=page;
        this.totalCount=totalCount;
        makePageInfo();
    }

    private void makePageInfo(){
        // 1. end값 계산
        this.end = (int) Math.ceil(page.getPageNo() / (double)PAGE_COUNT) * PAGE_COUNT;

        // 2. begin값 계산
        this.begin = this.end - PAGE_COUNT + 1;

        //마지막 구간 끝페이지 보정 :

        this.finalPage = (int) Math.ceil((double)totalCount / page.getAmount());

        // 마지막 페이지 구간에서만 엔드보정이 일어나야 함
        if (this.finalPage < this.end) this.end = this.finalPage;

        // 이전 버튼 활성화 여부
        this.prev = begin > 1;

        // 다음 버튼 활성화 여부
        this.next = end < this.finalPage;

    }



}
