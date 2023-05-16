<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="/assets/css/issue-list.css">
    <%@ include file="include/static-head.jsp" %>
</head>

<body>

    <%@ include file="include/header.jsp" %>

    <!-- 글 영역 -->
    <div class="main-img"></div>
    <div class="review-wrapper">

        <section class="review-main-wrapper">
            <div class="title-wrapper">
                <div class="review-main-title">산악 이슈</div>
                <div class="review-sub-title">요즘 가장 핫한 산악 정보는?</div>
            </div>
            <div class="hide-admin">
                <div class="hide-admin">
                    <div class="hide-admin-text">공지 숨기기</div>
                    <input type="range" max="1" id="choice" name="choice">
                </div>
            </div>
        </section>

        <section class="division-wrapper">
            <div class="division-boardNo">게시글 번호</div>
            <div class="division-title">제목</div>
            <div class="division-writer">작성자</div>
            <div class="division-writen-date">작성일</div>
            <div class="division-view-count">조회</div>
            <div class="division-like-it">좋아요</div>
        </section>

        <!-- 작성글 영역 -->
        <section class="board-wrapper">

            
            <c:forEach var="is" items="${issueList}">
                <!-- 공지글 영역 -->
                <c:if test="${is.id == admin}">
                    <div class="board-container">
                        <div class="board-boardNo">
                            <div class="admin-write">공지</div>
                        </div>
                        <div class="board-title admin-write-title">${is.title}</div>
                        <div class="board-writer">관리자</div>
                        <div class="board-writen-date">${is.date}</div>
                        <div class="board-view-count">${is.viewCount}</div>
                        <div class="board-like-it">좋아요 수</div>
                    </div>
                </c:if>

                <!-- 사용자글 영역 -->
                <c:if test="${is.id != admin}">
                    <div class="board-container">
                        <div class="board-boardNo">${is.boardNo}</div>
                        <div class="board-title">${is.title}</div>
                        <div class="board-writer">${is.id}</div>
                        <div class="board-writen-date">${is.date}</div>
                        <div class="board-view-count">${is.viewCount}</div>
                        <div class="division-like-it">좋아요 수</div>
                    </div>
                </c:if>
            </c:forEach>

            <button class="write-btn">글쓰기</button>
        </section>
    </div>

    <section class="pagination-container">
        <div class="prev-btn"><img src="jpg/less.png" alt="" class="less-icon"> 이전</div>
        <ul class="pagination-wrapper">
            <li class="pagination button-active"><a href="">1</a></li>
            <li class="pagination"><a href="">2</a></li>
            <li class="pagination"><a href="">3</a></li>
            <li class="pagination"><a href="">4</a></li>
            <li class="pagination"><a href="">5</a></li>
            <li class="pagination"><a href="">6</a></li>
            <li class="pagination"><a href="">7</a></li>
            <li class="pagination"><a href="">8</a></li>
            <li class="pagination"><a href="">9</a></li>
            <li class="pagination"><a href="">10</a></li>
        </ul>
        <div class="next-btn">다음<img src="jpg/than.png" alt="" class="than-icon"></div>
    </section>
</body>

</html>