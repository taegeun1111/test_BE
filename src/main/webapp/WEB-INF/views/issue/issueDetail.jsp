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
                            <div class="view-count">${is.viewCount}</div>
                        </div>
                    </div>
                </div>

                <div class="like-it-count">
                    <div class="heart"><img src="/assets/jpg/heart(line).png" alt="좋아요" class="heard-icon">좋아요 ${is.likeCount}</div>
                    <!-- 댓글 안되면 삭제하기 -->
                    <div class="comment"><img src="/assets/jpg/bubble(line).png" alt="댓글" class="comment-icon">댓글 10</div>
                </div>
            </div>

        </div>

        <div class="content-wrapper">
            <div class="issue-content">
                ${is.content}
            </div>
        </div>

        <!-- 댓글 비동기처리하기 -->
        <section class="detail-comment-container">
            <div class="comment-title">댓글</div>
            <div class="comment-warpper">
                <div class="comment-info-wrapper">
                    <div class="comment-profile"></div>
                    <div class="comment-info">
                        <div class="comment-detail-wrapper">
                            <div class="comment-id">파이란 정운석</div>
                        </div>

                        <div class="comment-content">
                            그마저도 힘들면 천문봉에서 주차장(찦차)으로 되돌아가는 코스를 잡아도 된다.
                        </div>

                        <div class="comment-write-time">
                            <div class="comment-write-date">2023-05-16</div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="comment-write-wrapper">
                <div class="write-id">두루룽</div>
                <textarea name="" id="comment-write-area" cols="" rows="" placeholder="댓글을 입력하세요."></textarea>
                <button type="submit" class="submit-btn">등록</button>
            </div>
        </section>



    </section>

</body>

</html>