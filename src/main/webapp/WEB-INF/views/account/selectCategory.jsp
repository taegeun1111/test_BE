<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="/assets/css/selectCategory.css">
    <%@ include file="../include/static-head.jsp" %>
</head>

<body id="bg-color">

    <%@ include file="../include/header.jsp" %>

    <section class="select-btn">
        <div class="go-feed">
            <div class="go-feed-text">
                <div class="feed-title">
                    FEED&일상
                </div>
                <div class="feed-content">
                    등산을 사랑하는 이들을 위한 일상 컨텐츠 입니다. 멋진 등산 사진과
                    영상 등 다양한 등산 관련 정보를 즐길 수 있습니다. 등산에 대한 열정을 나누고 영감을 얻으세요!
                </div>
                <div class="sub-title">
                    Feed&Daily
                </div>
            </div>
            <div class="feed-img"></div>
        </div>

        <div class="go-issue">
            <div class="go-issue-text">
                <div class="issue-title">
                    산악 이슈
                </div>
                <div class="issue-content">
                    최신 산악 트렌드, 안전한 등산을 위한
                    팁과 가이드, 국내외 유명 산악가들의 이야기 등 다양한 산악 관련 소식을 즐기며, 산악 활동에 대한 지식과 열정을 공유하세요.
                </div>
                <div class="sub-title">
                    Mountain Issues
                </div>
            </div>
            <div class="issue-img"></div>
        </div>

        <div class="go-review">
            <div class="go-review-text">
                <div class="review-title">
                    산악 후기
                </div>
                <div class="review-content">
                    정기모임에서는 그룹 등산의 재미와 동기부여를 공유하며,
                    소모임에서는 개인의 독특한 산악 체험과 추억을 나누고 경험을 공유합니다.
                </div>
                <div class="sub-title">
                    Mountain Review
                </div>
            </div>
            <div class="review-img"></div>
        </div>
    </section>

    <script>
        const $feed = document.querySelector('.go-feed');
        const $issue = document.querySelector('.go-issue');
        const $review = document.querySelector('.go-review');


        $feed.addEventListener('click', e => {
            window.location.href = "/issue/list";
        });

        
        $issue.addEventListener('click', e => {
            window.location.href = "/issue/list";
        });

       
        $review.addEventListener('click', e => {
            window.location.href = "/review/list";
        });

    </script>
</body>

</html>