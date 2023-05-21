<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/assets/css/clubDetail.css">
</head>

<body>

    <%@ include file="../include/header.jsp" %>

    <section class="detail-container">
        <div class="club-list-wrapper">
            <div class="club-title">${c.clubTitle}</div>
            <div class="icon-detail">
                <div class="mountain-sec">
                    <img src="/assets/jpg/mountain.png" alt="" class="mountain-icon">
                    <p class="mountain-text">${c.clubRecruitCount}명</p>
                </div>
                <div class="mountain-sec">
                    <img src="/assets/jpg/people.png" alt="" class="people-icon">
                    <p class="people-text">${c.clubRecruitType}</p>
                </div>
                <div class="mountain-sec">
                    <img src="/assets/jpg/calendar.png" class="calendar-icon">
                    <p class="calendar-text">${c.clubRecruitDeadline}</p>
                </div>
                <div class="mountain-sec">
                    <img src="/assets/jpg/location.png" alt="" class="location-icon">
                    <p class="location-text">${c.clubArea}</p>
                </div>
            </div>

            <div class="club-content-wrapper">
                <div class="club-content">
                    ${c.clubContent}
                </div>
                <div class="location-wrapper">
                    <div class="location-title">관악산 지하주차장 2F</div>
                    <!-- 약도 api -->
                    <div id="location-main"></div>
                </div>
            </div>

            <div class="now-count-wrapper">
                <div class="count-whole-text">
                    <div class="now-text">현재 모집인원</div>
                    <div class="now-count">3/4명
                    </div>
                </div>

                <div class="now-people-warpper">
                    <div class="person">이민호</div>
                    <div class="person">이승수</div>
                    <div class="person">홍길동</div>
                </div>
            </div>

            <div class="comment-write-wrapper">
                <div class="write-id">두루룽</div>
                <textarea name="" id="comment-write-area" cols="" rows="" placeholder="댓글을 입력하세요."></textarea>
                <button type="submit" class="submit-btn">등록</button>
            </div>

    </section>

    <script>

        //댓글 목록 렌더링 함수
        function renderReplyList({
            clubReplies,
            replyCount,
            replyPage
        }){
          // 댓글 내용 렌더링
            // 각 댓글 하나의 태그
            let tag = '';

            if (clubReplies === null || clubReplies.length === 0) {
                tag += "<div id='replyContent' class='card-body'>현재 등록된 댓글이 없습니다</div>";
            } else {
                for (let rep of clubReplies) {

                    const {
                        replyNo,
                        replyWriter,
                        replyContent,
                        replyRegDate
                        // account: replyWriter,
                        // profile
                    } = rep;

                    tag += "<div id='replyContent' class='card-body' data-replyId='" + replyNo + "'>" +
                        "    <div class='row user-block'>" +
                        "       <span class='col-md-8'>" +
                        // (profile
                        //     ?`<img class='reply-profile' src='\${profile}' alt='profile'>`
                        //     : `<img class='reply-profile' src='/assets/img/anonymous.jpeg' alt='profile'>`
                        //     ) +
                        "         <b>" + replyWriter + "</b>" +
                        "       </span>" +
                        "       <span class='col-md-4 text-right'><b>" + replyRegDate +
                        "</b></span>" +
                        "    </div><br>" +
                        "    <div class='row'>" +
                        "       <div class='col-md-9'>" + replyContent + "</div>" +
                        "       <div class='col-md-3 text-right'>";

                    // if (currentAccount === replyWriter || auth === 'ADMIN') {
                    //     tag +=
                    //         "         <a id='replyModBtn' class='btn btn-sm btn-outline-dark' data-bs-toggle='modal' data-bs-target='#replyModifyModal'>수정</a>&nbsp;" +
                    //         "         <a id='replyDelBtn' class='btn btn-sm btn-outline-dark' href='#'>삭제</a>";
                    // }
                    tag += "       </div>" +
                        "    </div>" +
                        " </div>";
                }
            }


            // 생성된 댓글 tag 렌더링
            document.querySelector('.comment-write-wrapper').innerHTML = tag;

            // 페이지 렌더링
            // renderPage(pageInfo);

        }

        //글번호
        const bno = '${c.clubBoardNo}';

        //댓글 요청 URI
        const URL = '/club-reply';

        //댓글 목록 불러오기 함수
        function getReplyList(page = 1) {
            fetch(`\${URL}/\${bno}/page/\${page}`)
                .then(res => res.json())
                .then(responseResult => {
                    console.log(responseResult);
                    renderReplyList(responseResult);
                })
        }

        (function () {
            //첫 댓글 페이지 불러오기
            getReplyList();
        })();
    </script>

</body>

</html>