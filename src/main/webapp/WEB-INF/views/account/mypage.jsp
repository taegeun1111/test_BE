<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/assets/css/common.css">
    <link rel="stylesheet" href="/assets/css/mypage.css">
    
    <title>Mountain-Do</title>

</head>

<body id="bg-color">

    <%@ include file="../include/header.jsp" %>
    <div class="title">My Page</div>
    <section class="mypage-informaiton-container">
        <div class="main-informaiton">

          <c:if test="${login.profile == null}">
               <div class="profile">
               <img src="https://cdn-icons-png.flaticon.com/128/7281/7281869.png" alt="프로필사진">
               </div>     
           </c:if>
           <c:if test="${login.profile != null}">
               <div class="profile">
                  <img src="/local${login.profile}" alt="프로필사진">
              </div>
          </c:if>


            
            <div class="name-wrapper">
                <div class="nickname">${login == null ? '스파이?' : login.name}</div>

                <div class="modify-btn">
                    <span>수정하기</span>
                </div>
            </div>
        </div>

        <div class="my-count-wrapper">
            <div class="write-count-wrapper">
                <div class="write-title">오늘 내가 쓴 글</div>
                    <div class="write-count">0${stamp.boardCount}</div>
            </div>
            <div class="comment-count-wrapper">
                <div class="comment-title">나의 댓글</div>
                <div class="comment-count">07</div>
            </div>
            <div class="stamp-count-wrapper">
                <div class="stamp-title">스탬프</div>

                <c:if test="${stamp.totalStampCount == 0}">
                    <p class="stamp-count">0</p>
                </c:if>
                <c:if test="${stamp.totalStampCount >= 1}">
                    <div class="stamp-count">00${stamp.totalStampCount}
                        <p class="total-stamp">/30</p>
                    </div>
                </c:if>
            </div>
        </div>
    </section>

    <section class="mypage-write-container">

        <section class="division-wrapper">
            <div class="division-boardNo">게시글 번호</div>
            <div class="division-title">제목</div>
            <div class="division-writer">작성자</div>
            <div class="division-writen-date">작성일</div>
            <div class="division-view-count">조회</div>
            <div class="division-like-it">좋아요</div>
        </section>

        <section class="mypage-write">

            <c:forEach var="i" items="${is}">
            <div class="board-container">
                <div class="board-boardNo">${i.issueBoardNo}</div>
                <div class="board-title">${i.issueTitle}</div>
                <div class="board-writer">${i.accountId}</div>
                <div class="board-writen-date">${i.issueRegDate}</div>
                <div class="board-view-count">${i.issueViewCount}</div>
                <div class="division-like-it">${i.issueLikeCount}</div>
            </div>
            </c:forEach>

        <c:forEach var="f" items="${fd}">
            <div class="board-container">
                <div class="board-boardNo">${f.feedBoardNo}</div>
                <div class="board-title">${f.feedTitle}</div>
                <div class="board-writer">${f.accountId}</div>
                <div class="board-writen-date">${f.feedRegDate}</div>
                <div class="board-view-count">${f.feedViewCount}</div>
                <div class="division-like-it">${f.feedLikeCount}</div>
            </div>
            </c:forEach>

        <c:forEach var="r" items="${rv}">
            <div class="board-container">
                <div class="board-boardNo">${r.reviewBoardNo}</div>
                <div class="board-title">${r.reviewTitle}</div>
                <div class="board-writer">${r.accountId}</div>
                <div class="board-writen-date">${r.reviewRegDate}</div>
                <div class="board-view-count">${r.reviewViewCount}</div>
                <div class="division-like-it">${r.reviewLikeCount}</div>
            </div>
            </c:forEach>

            <c:forEach var="c" items="${cb}">
                            <div class="board-container">
                                <div class="board-boardNo">${c.clubBoardNo}</div>
                                <div class="board-title">${c.clubTitle}</div>
                                <div class="board-writer">${c.accountId}</div>
                                <div class="board-writen-date">${c.clubRegDate}</div>
                                <div class="board-view-count">0</div>
                                <div class="division-like-it">0</div>
                            </div>
                            </c:forEach>

                    <c:forEach var="s" items="${sb}">
                        <div class="board-container">
                            <div class="board-boardNo">${s.secondHandBoardNo}</div>
                            <div class="board-title">${s.secondhandTitle}</div>
                            <div class="board-writer">${s.accountId}</div>
                            <div class="board-writen-date">${s.secondhandRegDate}</div>
                            <div class="board-view-count">${s.secondhandViewCount}</div>
                            <div class="division-like-it">0</div>
                        </div>
                        </c:forEach>
        </section>
    </section>


    <script>
        // 수정하기 버튼
        function goToModifyPage() {
            location.href = '/account/modify';
        }

        const modifyButton = document.querySelector('.modify-btn');
        modifyButton.addEventListener('click', goToModifyPage);

    </script>
</body>

</html>