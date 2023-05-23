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
                <script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=478691db78642ec3c56d8b3e645f0257&libraries=services"></script>

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
        </div>
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
                        tag +=
                            "         <a id='replyModBtn' class='btn btn-sm btn-outline-dark' data-bs-toggle='modal' data-bs-target='#replyModifyModal'>수정</a>&nbsp;" +
                            "         <a id='replyDelBtn' class='btn btn-sm btn-outline-dark' href='#'>삭제</a>";
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

        //-----------------------------------
        // 삭제
        // 댓글 삭제+수정모달 이벤트 처리 함수
        function replyRemoveClickEvent() {

            const $replyData = document.querySelector('.comment-write-wrapper');

            $replyData.onclick = e => {

                e.preventDefault();

                // 삭제할 댓글의 PK값 읽기
                const rno = e.target.closest('#replyContent').dataset.replyid;

                if (e.target.matches('#replyDelBtn')) {
                    // console.log('삭제버튼 클릭!!');

                    if (!confirm('정말 삭제합니까?')) return;

                    // console.log(rno);

                    // 서버에 삭제 비동기 요청
                    fetch(URL + '/' + rno, {
                        method: 'DELETE'
                    }).then(res => {
                        if (res.status === 200) {
                            alert('댓글이 정상 삭제됨!');
                            return res.json();
                        } else {
                            alert('댓글 삭제 실패!');
                        }
                    }).then(responseResult => {
                        renderReplyList(responseResult);
                    });


                } else if (e.target.matches('#replyModBtn')) {
                    // console.log('수정 화면 진입!');

                    // 클릭한 수정 버튼 근처에 있는 텍스트 읽기
                    const replyText = e.target.parentElement.previousElementSibling.textContent;
                    // console.log(replyText);

                    // 모달에 모달바디에 textarea에 읽은 텍스트를 삽입
                    document.getElementById('modReplyText').value = replyText;

                    // 다음 수정완료 처리를 위해 미리 
                    // 수정창을 띄울 때 댓글번호를 모달에 붙여놓자
                    const $modal = document.querySelector('.modal');
                    $modal.dataset.rno = rno;
                }
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
            replyRemoveClickEvent();
        })();


        //지도 api 스크립트

        const infowindow = new window.kakao.maps.InfoWindow({ zIndex: 1 });

        const mapContainer = document.getElementById('location-main');
        const mapOption = {
            center: new window.kakao.maps.LatLng(37.566826, 126.9786567), // 초기값은 null로 설정
            level: 3
        };

        const map = new window.kakao.maps.Map(mapContainer, mapOption);

        const ps = new window.kakao.maps.services.Places();

        // 장소가 이미 게시글에 적혀 있는 경우
        const placeName = document.querySelector('.location-text').textContent; // 장소명을 게시글에 적힌 값으로 대체
        // console.log("placeName : ", placeName);

        function searchPlace() {
            if (placeName.trim() !== '') {
                ps.keywordSearch(placeName, placesSearchCB);
            }
        }
        searchPlace();

        function placesSearchCB(data, status, pagination) {
            if (status === window.kakao.maps.services.Status.OK) {
                const bounds = new window.kakao.maps.LatLngBounds();

                for (let i = 0; i < data.length; i++) {
                    displayMarker(data[i]);
                    bounds.extend(new window.kakao.maps.LatLng(data[i].y, data[i].x));
                }

                map.setBounds(bounds);

                // 검색된 장소 중 첫 번째 장소를 기준으로 지도의 center 값을 설정
                map.setCenter(new window.kakao.maps.LatLng(data[0].y, data[0].x));
            }
        }

        function displayMarker(place) {
            // 입력한 장소의 좌표와 일치하는 경우에만 마커를 생성하고 표시합니다
            if (place.place_name === placeName) {
                const marker = new window.kakao.maps.Marker({
                    map: map,
                    position: new window.kakao.maps.LatLng(place.y, place.x)
                });

                window.kakao.maps.event.addListener(marker, 'click', function () {
                    infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
                    infowindow.open(map, marker);
                });
            }
        }
    </script>

</body>

</html>