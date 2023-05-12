package com.mountain.doo.dto.Page;

import lombok.Getter;
import lombok.ToString;

@Getter @ToString
public class PageMaker {

    private static final int PAGE_COUNT=10;

    private int begin, end, finalPage;

    private boolean prev, next;

    private int totalCount;





}
