<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="/assets/css/issueDetail.css">
    <%@ include file="../include/static-head.jsp" %>
</head>

<body>

    <%@ include file="../include/header.jsp" %>

    <section id="issue-detail-container">
        <div class="top-wrapper">
            <a href="/issue/list" class="category">산악 이슈<img src="/assets/jpg/than.png" alt="" class="than-btn"></a>
            <div class="title">
                ${is.title}
            </div>
            <div class="user-info-wrapper">
                <div class="user-info">
                    <div class="user-profile"></div>
                    <div class="user-detail-wrapper">
                        <div class="user-id">${is.writer}</div>
                        <div class="write-time">
                            <div class="write-date">${is.date}</div>
                            <div class="view-count">조회수 ${is.viewCount}</div>

                            <c:if test="${login.accountId==is.writer}">
                                <div class="modify-warpper">
                                    <a href="/issue/modify?bno=${is.boardNo}">수정</a>
                                    <a href="/issue/delete?bno=${is.boardNo}">삭제</a>
                                </div>
                            </c:if>

                        </div>
                    </div>
                </div>

                <div class="like-it-count" style="cursor: pointer;">
                    <div class="heart"><img src="/assets/jpg/heart(line).png" alt="좋아요" class="heard-icon">좋아요
                        ${is.likeCount}</div>
                </div>

            </div>

        </div>

        <div class="content-wrapper">
            <div class="issue-content">

                ${is.content}

            </div>
        </div>



    </section>

    <script>
        const $heart = document.querySelector('.heart');
        const originSrc = "/assets/jpg/heart(line).png";
        const changeSrc = "/assets/jpg/heart(full).png";
        let isLiked = false;

        // jsp줘야함
        $heart.addEventListener('click', e => {
            console.log("클릭됨");
            const heartIcon = document.querySelector('.heard-icon');

            if (isLiked) {
                heartIcon.src = originSrc;
                isLiked = false;
            } else {
                heartIcon.src = changeSrc;
                isLiked = true;
            }
        });


        
    </script>
</body>

</html>