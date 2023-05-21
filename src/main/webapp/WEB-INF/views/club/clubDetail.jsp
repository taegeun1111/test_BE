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


            <div class="col-md-3">
                <div class="form-group">

                    <div class="profile-box">
                        <c:choose>
                            <c:when test="${login.profile != null}">
                                <img src="/${login.profile}" alt="프사">
                            </c:when>
                            <c:otherwise>
                                <img src="/assets/img/anonymous.jpeg" alt="프사">
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <label for="newReplyWriter" hidden>댓글 작성자</label>
                    <input id="newReplyWriter" name="replyWriter" type="text" class="form-control" placeholder="작성자 이름"
                        style="margin-bottom: 6px;" value="${login.nickName}" readonly>
                    <button id="replyAddBtn" type="button" class="btn btn-dark form-control">등록</button>
                </div>
            </div>
            <div class="write-id" name="replyWriter">test1</div>
            <textarea name="" id="comment-write-area" cols="" rows="" placeholder="댓글을 입력하세요."></textarea>
            <button type="submit" class="submit-btn">등록</button>

            <div class="comment-write-wrapper">
                <!-- 댓글 내용 영역 -->
            </div>


            <!-- 댓글 페이징 영역 -->
            <ul class="pagination justify-content-center">
                <!-- 
                            < JS로 댓글 페이징 DIV삽입 > 
                        -->
            </ul>

    </section>

    <script>
        // 페이지네이션 영역
        function renderPage({
            begin,
            end,
            prev,
            next,
            page,
            finalPage
        }) {

            let tag = "";

            //이전 버튼 만들기
            if (prev) {
                tag += "<li class='page-item'><a class='page-link page-active' href='" + (begin - 1) +
                    "'>이전</a></li>";
            }
            //페이지 번호 리스트 만들기
            for (let i = begin; i <= end; i++) {
                let active = '';
                if (page.pageNo === i) {
                    active = 'p-active';
                }

                tag += "<li class='page-item " + active + "'><a class='page-link page-custom' href='" + i +
                    "'>" + i + "</a></li>";
            }
            //다음 버튼 만들기
            if (next) {
                tag += "<li class='page-item'><a class='page-link page-active' href='" + (end + 1) +
                    "'>다음</a></li>";
            }

            // 페이지태그 렌더링
            const $pageUl = document.querySelector('.pagination');
            $pageUl.innerHTML = tag;

            // ul에 마지막페이지 번호 저장.
            $pageUl.dataset.fp = finalPage;

        }

        // 페이지 클릭 이벤트 핸들러
        function makePageButtonClickEvent() {
            // 페이지 버튼 클릭이벤트 처리
            const $pageUl = document.querySelector('.pagination');
            $pageUl.onclick = e => {
                if (!e.target.matches('.page-item a')) return;

                e.preventDefault(); // 태그의 기본 동작 중단

                // 누른 페이지 번호 가져오기
                const pageNum = e.target.getAttribute('href');
                // console.log(pageNum);

                // 페이지 번호에 맞는 목록 비동기 요청
                getReplyList(pageNum);
            };
        }

        //--------------------------------------------------


        //댓글 목록 렌더링 함수
        function renderReplyList({
            clubReplies,
            replyCount,
            replyPage
        }) {
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
            renderPage(replyPage);

        }

        //--------------------------------
        // 댓글 등록 처리 이벤트 함수
        function makeReplyRegisterClickEvent() {

            const $regBtn = document.querySelector('.submit-btn');

            $regBtn.onclick = e => {

                
                // const $rw = document.getElementById('newReplyWriter');
                const $rt = document.getElementById('comment-write-area');
                const $rw = 'test1';

                // 클라이언트 입력값 검증
                // if ($rt.value.trim() === '') {
                //     alert('댓글 내용은 필수입니다!');
                //     return;
                // } else if ($rw.value.trim() === '') {
                //     alert('댓글 작성자 이름은 필수입니다!');
                //     return;
                // } else if ($rw.value.trim().length < 2 || $rw.value.trim().length > 8) {
                //     alert('댓글 작성자 이름은 2~8자 사이로 작성하세요!');
                //     return;
                // }


                // # 서버로 보낼 데이터
                const payload = {
                    replyContent: $rt.value,
                    // replyWriter: $rw.value,
                    replyWriter: $rw,
                    boardNo: bno
                };

                // # GET방식을 제외하고 필요한 객체
                const requestInfo = {
                    method: 'POST',
                    headers: {
                        'content-type': 'application/json'
                    },
                    body: JSON.stringify(payload)
                };

                // # 서버에 POST요청 보내기
                fetch(URL, requestInfo)
                    .then(res => {
                        if (res.status === 200) {
                            alert('댓글이 정상 등록됨!');
                            // 입력창 비우기
                            $rt.value = '';
                            // $rw.value = '';
                            console.log("여기까지");
                            // 마지막페이지 번호
                            const lastPageNo = document.querySelector('.pagination').dataset.fp;
                            getReplyList(lastPageNo);
                        } else {
                            alert('댓글 등록에 실패함!');
                        }
                    });
            };
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
            makePageButtonClickEvent();
            makeReplyRegisterClickEvent();
        })();
    </script>

</body>

</html>