<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/assets/css/common.css">
    <link rel="stylesheet" href="/assets/css/mypage.css">
    <%@ include file="../include/static-head.jsp" %>
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
            <div class="board-container">
                <div class="board-boardNo">9999</div>
                <div class="board-title">대체공휴일 기념 부산근교트레킹벙(오전9시)</div>
                <div class="board-writer">이동우</div>
                <div class="board-writen-date">2023.04.30</div>
                <div class="board-view-count">0</div>
                <div class="division-like-it">25</div>
            </div>

            <div class="board-container">
                <div class="board-boardNo">9999</div>
                <div class="board-title">모든 국민은 건강하고 쾌적한 환경에서 생활할 권리를 가지며, 국가와 국민은 환경보전을 위하여 노력하여야 한다.</div>
                <div class="board-writer">이동우</div>
                <div class="board-writen-date">2023.04.30</div>
                <div class="board-view-count">0</div>
                <div class="division-like-it">25</div>
            </div>

            <div class="board-container">
                <div class="board-boardNo">9999</div>
                <div class="board-title">모든 권력은 국민으로부터 나온다.</div>
                <div class="board-writer">이동우</div>
                <div class="board-writen-date">2023.04.30</div>
                <div class="board-view-count">0</div>
                <div class="division-like-it">25</div>
            </div>

            <div class="board-container">
                <div class="board-boardNo">9999</div>
                <div class="board-title">모든 권력은 국민으로부터 나온다.</div>
                <div class="board-writer">이동우</div>
                <div class="board-writen-date">2023.04.30</div>
                <div class="board-view-count">0</div>
                <div class="division-like-it">25</div>
            </div>

            <div class="board-container">
                <div class="board-boardNo">9999</div>
                <div class="board-title">모든 권력은 국민으로부터 나온다.</div>
                <div class="board-writer">이동우</div>
                <div class="board-writen-date">2023.04.30</div>
                <div class="board-view-count">0</div>
                <div class="division-like-it">25</div>
            </div>

            <div class="board-container">
                <div class="board-boardNo">9999</div>
                <div class="board-title">모든 권력은 국민으로부터 나온다.</div>
                <div class="board-writer">이동우</div>
                <div class="board-writen-date">2023.04.30</div>
                <div class="board-view-count">0</div>
                <div class="division-like-it">25</div>
            </div>
            <div class="board-container">
                <div class="board-boardNo">9999</div>
                <div class="board-title">모든 권력은 국민으로부터 나온다.</div>
                <div class="board-writer">이동우</div>
                <div class="board-writen-date">2023.04.30</div>
                <div class="board-view-count">0</div>
                <div class="division-like-it">25</div>
            </div>
            <div class="board-container">
                <div class="board-boardNo">9999</div>
                <div class="board-title">모든 권력은 국민으로부터 나온다.</div>
                <div class="board-writer">이동우</div>
                <div class="board-writen-date">2023.04.30</div>
                <div class="board-view-count">0</div>
                <div class="division-like-it">25</div>
            </div>
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