<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="/assets/css/issueModify.css">
    <%@ include file="../include/static-head.jsp" %>
</head>

<body>

    <%@ include file="../include/header.jsp" %>

    <form action="/review/modify" method="post">
        <section id="issue-detail-container">
            <input type="hidden" name="boardNo" value="${is.boardNo}">
            <div class="top-wrapper">
                <a href="/review/list" class="category">산악후기<img src="/assets/jpg/than.png" alt="" class="than-btn"></a>


                <textarea type="text" name="title" id="" class="title" value="${is.title}"></textarea>

                <div class="user-info-wrapper">
                    <div class="user-info">
                        <div class="user-profile"></div>
                        <div class="user-detail-wrapper">
                            <div class="user-id">${is.id}</div>
                            <div class="write-time">
                                <div class="write-date">${is.date}</div>
                                <div class="view-count">조회수 ${is.viewCount}</div>

                            </div>

                        </div>
                    </div>

                    <div class="like-it-count" style="cursor: pointer;">
                        <div class="heart"><img src="/assets/jpg/heart(line).png" alt="좋아요" class="heard-icon">좋아요
                            ${is.likeCount}</div>

                        <div class="comment"><img src="/assets/jpg/bubble(line).png" alt="댓글" class="comment-icon">댓글 10
                        </div>
                    </div>
                </div>

            </div>

            <div class="content-wrapper">
                <!-- <div class="issue-content"> -->
                <textarea type="text" name="content" id="" class="issue-content" value="${is.content}"></textarea>

            </div>

            <div class="btn-wrapper">
                <button type="submit" id="submitBtn">수정하기</button>
                <button href="/issue/detail?bno=${is.boardNo}" class="cancelBtn">취소하기</button>
            </div>
        </section>

    </form>

    <script>
        // const $heart = document.querySelector('.heart');
        // const originSrc = "/assets/jpg/heart(line).png";
        // const changeSrc = "/assets/jpg/heart(full).png";
        // let isLiked = false;

        // $heart.addEventListener('click', e => {
        //     console.log("클릭됨");
        //     const heartIcon = document.querySelector('.heard-icon');

        //     if (isLiked) {
        //         heartIcon.src = originSrc;
        //         isLiked = false;
        //     } else {
        //         heartIcon.src = changeSrc;
        //         isLiked = true;
        //     }
        // });
        const $category = document.querySelector('.category');
        $category.addEventListener('click', e => {
            if (!confirm('이전 페이지로 돌아가시겠습니까?')) {
                e.preventDefault();
            }
        })

        const $confirmBtn = document.getElementById('submitBtn');
        $confirmBtn.addEventListener('click', e => {
            if (!confirm('정말 수정하시겠습니까?')) {
                e.preventDefault();
            }
        })

        const $cancleBtn = document.querySelector('.cancelBtn');
        $cancleBtn.addEventListener('click', e => {
            if (!confirm('이전 페이지로 돌아가시겠습니까?')) {
                e.preventDefault();
            }
        })
    </script>
</body>

</html>