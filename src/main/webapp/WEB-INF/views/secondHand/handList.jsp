<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="/assets/css/handList.css">
    <%@ include file="../include/static-head.jsp" %>
</head>

<body>

    <%@ include file="../include/header.jsp" %>

    <!-- 글 영역 -->
    <div class="main-img"></div>
    <div class="review-wrapper">

        <section class="review-main-wrapper">
            <div class="title-wrapper">
                <div class="review-main-title">중고거래</div>
                <div class="review-sub-title">당신의 사용하지 않는 물품을 사고 팔아서 더 나은 가치를 창출하세요!</div>
            </div>
            <!-- <div class="hide-admin"> -->
            <!-- 공지 숨기기 나중에 활성화 시키기 id넘어올 때 -->
            <!-- <div class="hide-admin">
                    <div class="hide-admin-text">공지 숨기기</div>
                    <input type="range" max="1" id="choice" name="choice">
                </div> -->
            <!-- </div> -->
            <div id="search">
                <form action="/board/list" method="get" id="form-wrapper">

                    <div class="search-warpper">
                        <select class="form-select" name="type" id="search-type">
                            <option value="">전체</option>
                            <option value="title">제목</option>
                            <option value="content">내용</option>
                            <option value="tc">제목+내용</option>
                        </select>

                        <select class="form-select" name="secondhandType" id="secondhandType">
                            <option value="">전체</option>
                            <option value="buy">삽니다</option>
                            <option value="sell">팝니다</option>
                        </select>

                        <input type="text" class="form-control" name="keyword" value="${s.keyword}">
                    </div>
                    <button class="btn btn-primary" type="submit">
                        <i class="fas fa-search"></i>
                    </button>
                </form>
                <c:if test="${not empty login}">
                    <a href="/board/write" class="write-btn">글쓰기</a>
                </c:if>
            </div>

        </section>

        <section class="division-wrapper">
            <div class="division-boardNo">게시글 번호</div>
            <div class="division-category">카테고리</div>
            <div class="division-title">제목</div>
            <div class="division-writer">작성자</div>
            <div class="division-writen-date">작성일</div>
            <div class="division-view-count">조회</div>
            <!-- <div class="division-like-it">좋아요</div> -->
        </section>

        <!-- 작성글 영역 -->
        <section class="board-wrapper">



            <c:forEach var="is" items="${shbList}">

                <!-- 사용자글 영역 -->
                <c:if test="${is.accountId != admin}">
                    <div class="board-container">
                        <div class="board-boardNo" data-bno="${is.secondHandBoardNo}">${is.secondHandBoardNo}</div>
                        <c:if test="${is.secondhandDealType == 'BUY'}">
                            <div class="board-buy">삽니다</div>
                        </c:if>
                        <c:if test="${is.secondhandDealType == 'SELL'}">
                            <div class="board-cell">팝니다</div>
                        </c:if>
                        <div class="board-title">
                            <div class="board-region">[${is.secondhandArea}]</div>${is.secondhandTitle}
                        </div>
                        <div class="board-writer">${is.accountId}</div>
                        <div class="board-writen-date">${is.secondhandRegDate}</div>
                        <div class="board-view-count">${is.secondhandViewCount}</div>

                    </div>
                </c:if>
            </c:forEach>


        </section>


        <!-- 페이지 버튼 영역 -->
        <ul class="pagination">
            <c:if test="${maker.page.pageNo != 1}">
                <li class="page-item"><a class="page-link"
                        href="/board/list?pageNo=1&type=${s.type}&keyword=${s.keyword}&secondhandType=${s.secondhandType}">&lt;&lt;</a>
                </li>
            </c:if>

            <c:if test="${maker.prev}">
                <li class="page-item"><a
                        href="/board/list?pageNo=${maker.begin-1}&type=${s.type}&keyword=${s.keyword}&secondhandType=${s.secondhandType}"
                        class="page-link">prev</a>
                </li>
            </c:if>

            <c:forEach var="i" begin="${maker.begin}" end="${maker.end}">
                <li data-page-num="${i}" class="page-item">
                    <a class="page-link"
                        href="/board/list?pageNo=${i}&type=${s.type}&keyword=${s.keyword}&secondhandType=${s.secondhandType}">${i}</a>
                </li>
            </c:forEach>

            <c:if test="${maker.next}">
                <li class="page-item"><a
                        href="/board/list?pageNo=${maker.end+1}&type=${s.type}&keyword=${s.keyword}&secondhandType=${s.secondhandType}"
                        class="page-link">next</a></li>
            </c:if>

            <c:if test="${maker.page.pageNo != maker.finalPage}">
                <li class="page-item"><a class="page-link"
                        href="/board/list?pageNo=${maker.finalPage}&type=${s.type}&keyword=${s.keyword}&secondhandType=${s.secondhandType}">&gt;&gt;</a>
                </li>
            </c:if>
        </ul>
    </div>

    <script>
        //현재 위치한 페이지에 active 스타일 부여하기
        function appendPageActive() {

            // 현재 내가 보고 있는 페이지 넘버
            const curPageNum = '${maker.page.pageNo}';
            console.log("현재페이지: ", curPageNum);

            // 페이지 li태그들을 전부 확인해서 
            // 현재 위치한 페이지 넘버와 텍스트컨텐츠가 일치하는
            // li를 찾아서 class active 부여
            const $ul = document.querySelector('.pagination');

            for (let $li of [...$ul.children]) {
                if (curPageNum === $li.dataset.pageNum) {
                    $li.classList.add('active');
                    break;
                }
            }

        }

        // 셀렉트옵션 검색타입 태그 고정
        function fixSearchOption() {
            const $select = document.getElementById('search-type');
            const $typeSelect = document.getElementById('secondhandType');

            for (let $opt of [...$select.children]) {
                if ($opt.value === '${s.type}') {
                    $opt.setAttribute('selected', 'selected');
                    break;
                }
            }

            for (let $opt2 of [...$typeSelect.children]) {
                if ($opt2.value === '${s.secondhandType}') {
                    $opt2.setAttribute('selected', 'selected');
                    break;
                }
            }
        }



        const clickBoards = document.querySelectorAll('.board-container');

        for (const clickBoard of clickBoards) {
            clickBoard.addEventListener('click', e => {
                console.log(clickBoard);
                const bno = clickBoard.querySelector('.board-boardNo').dataset.bno;
                window.location.href = '/board/detail?bno=' + bno +
                    '&pageNo=${s.pageNo}&type=${s.type}&keyword=${s.keyword}&secondhandType=${s.secondhandType}';
            })
        };



        appendPageActive();
        fixSearchOption();
        fixSearchType();
    </script>
</body>

</html>