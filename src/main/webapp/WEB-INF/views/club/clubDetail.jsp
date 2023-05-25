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
            <div class="club-title">
                ${c.clubTitle}
                <c:if test="${login.accountId==c.accountId}">
                    <div class="modify-warpper">
                        <a href="/review/modify?bno=${c.clubBoardNo}">수정</a>
                        <a href="/review/delete?bno=${c.clubBoardNo}">삭제</a>
                    </div>
                </c:if>
            </div>
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
                    <div class="location-title">📍 ${c.clubArea} 📍</div>
                    <!-- 약도 api -->
                    <div id="location-main"></div>
                </div>
                <script
                    src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=478691db78642ec3c56d8b3e645f0257&libraries=services">
                </script>

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

        </div>

        <!-- 댓글 비동기처리하기 -->

        <section class="detail-comment-container">
            <div class="comment-title">댓글</div>
            <div class="comment-warpper">
                <div class="comment-info-wrapper">

                    <!-- 댓글 내용 영역 -->

                </div>

            </div>




            <!-- 댓글 작성 영역 -->

            <div class="comment-write-wrapper">
                <div class="col-md-3">
                    <div class="form-group">

                        <div class="profile-box">
                            <c:choose>
                                <c:when test="${login.profile != null}">
                                    <img src="/local${login.profile}" alt="프사" id="profile-img">
                                </c:when>
                                <c:otherwise>
                                    <img src="https://cdn-icons-png.flaticon.com/128/7281/7281869.png" alt="프로필사진"
                                        id="profile-img">
                                </c:otherwise>
                            </c:choose>
                        </div>


                        <div class="write-id" name="replyWriter">${login.accountId}</div>
                    </div>
                </div>
                <c:if test="${empty login}">
                    <span>댓글은 로그인 후 작성 가능합니다</span> <a href="/account/sign-in" id="move-login">로그인 하러 가기</a>
                </c:if>
                <c:if test="${not empty login}">
                    <textarea name="" id="comment-write-area" cols="" rows="" placeholder="댓글을 입력하세요."></textarea>
                    <button type="submit" class="submit-btn">등록</button>
                </c:if>
            </div>
        </section>

        <!-- 댓글 페이징 영역 -->
        <ul class="pagination justify-content-center">
            <!-- 
                        < JS로 댓글 페이징 DIV삽입 > 
                    -->
        </ul>
    </section>

    <script>
        //--------------------------------------------------
        //글번호
        const bno = '${c.clubBoardNo}';

        //댓글 요청 URI
        const URL = '/club-reply';

        //로그인한 회원 id
        const currentAccount = '${login.accountId}';

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
            console.log($pageUl.dataset.fp);

        }

        // 페이지 클릭 이벤트 핸들러
        function makePageButtonClickEvent() {
            console.log("페이지 클릭 이벤트");
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
            // document.getElementById('replyCnt').textContent = replyCount;
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
                        replyRegDate,
                        account: accountid,
                        profile
                    } = rep;
                    tag += `

                    <div id='replyContent' class='comment-list' data-reply-id='\${replyNo}'>
                        <div class="comment-profile">`;
                    if (profile === null) {
                        tag +=
                            `<img class='reply-profile' src='https://cdn-icons-png.flaticon.com/128/7281/7281869.png' alt='profile'>`;
                    }
                    if (profile !== null) {
                        tag += `<img class='reply-profile' src='/local\${profile}' alt='profile'>`;
                    }


                    tag += `</div>
                        <div class="text-wrapper">
                            <div class="comment-info">
                                <div class="comment-detail-wrapper">
                                    <div class="comment-id">\${replyWriter}</div>`;

                    if (currentAccount === replyWriter) {
                        tag += `<div class='btn-container'>
                                        <a id='replyModBtn' class='btn btn-sm'>수정</a>
                                        <a id='replyDelBtn' class='btn btn-sm' href='#'>삭제</a>
                                    </div>`;
                    }
                    tag += `
                               </div>
                                <div class='content-modify-wrapper'>
                                <span class="comment-content">\${replyContent}</span>
                                </div>

                                <div class="comment-write-time">
                                    <div class="comment-write-date">\${replyRegDate}</div>
                                </div>
                            </div>
                        </div>
                    </div>`;
                }
            }


            // 생성된 댓글 tag 렌더링
            document.querySelector('.comment-info-wrapper').innerHTML = tag;

            // 페이지 렌더링
            renderPage(replyPage);

        }

        //--------------------------------
        //댓글 목록 불러오기 함수
        function getReplyList(page = 1) {
            fetch(`\${URL}/\${bno}/page/\${page}`)
                .then(res => res.json())
                .then(responseResult => {
                    console.log(responseResult);
                    renderReplyList(responseResult);
                })
        }

        //--------------------------------
        // 댓글 등록 처리 이벤트 함수
        function makeReplyRegisterClickEvent() {

            const $regBtn = document.querySelector('.submit-btn');

            $regBtn.onclick = e => {


                // const $rw = document.getElementById('newReplyWriter');
                const $rt = document.getElementById('comment-write-area');
                const $rw = "${login.accountId}";

                // 클라이언트 입력값 검증
                if ($rt.value.trim() === '') {
                    alert('댓글 내용은 필수입니다!');
                    return;
                }


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

                            // 마지막페이지 번호
                            let lastPageNo = document.querySelector('.pagination').dataset.fp;
                            if (lastPageNo === '0') lastPageNo = 1;
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

            const $replyData = document.querySelector('.comment-info-wrapper');

            $replyData.onclick = e => {

                e.preventDefault();

                console.log('targer:', e.target);

                // 삭제할 댓글의 PK값 읽기
                const rno = e.target.closest('#replyContent').dataset.replyId;

                if (e.target.matches('#replyDelBtn')) {
                    // console.log('삭제버튼 클릭!!');
                    console.log('rno : ' + rno);
                    // console.log(e.target.closest('#replyContent').dataset.replyid);

                    if (!confirm('정말 삭제합니까?')) return;

                    // console.log(rno);

                    // 서버에 삭제 비동기 요청
                    fetch(URL + '/' + rno, {
                        method: 'DELETE'
                    }).then(res => {
                        if (res.status === 200) {
                            console.log(URL + '/' + rno);
                            alert('댓글이 정상 삭제됨!');
                            return res.json();
                        } else {
                            alert('댓글 삭제 실패!');
                        }
                    }).then(responseResult => {
                        renderReplyList(responseResult);
                    });


                } else if (e.target.matches('#replyModBtn')) {
                    console.log('수정 화면 진입!');
                    console.log('e.target' + e.target);
                    //교체대상 input
                    const $textSpan = e.target.closest('.comment-list').querySelector('.comment-content');

                    //input만들기
                    const $modInput = document.createElement('input');

                    $modInput.setAttribute('type', 'text'); // <input type='text'>
                    $modInput.classList.add('modify-input'); // <input type='text' class='modify-input'>
                    $modInput.setAttribute('value', $textSpan.textContent);

                    const $label = $textSpan.parentElement;
                    $label.replaceChild($modInput, $textSpan);


                    var modifyBtn = document.createElement('button');
                    modifyBtn.innerText = '수정';
                    modifyBtn.classList.add('modify-btn');

                    var cancelBtn = document.createElement('button');
                    cancelBtn.setAttribute('type', 'button');
                    cancelBtn.innerText = '취소';
                    cancelBtn.classList.add('cancle-btn');

                    $label.appendChild(modifyBtn);
                    $label.appendChild(cancelBtn);

                    const $modal = document.querySelector('.content-modify-wrapper');
                    $modal.dataset.rno = rno;

                    console.log('modifyBtn = ' + modifyBtn);
                    // console.log($modal.dataset.rno);
                    replyModifyClickEvent()
                }
            };
        }

        // 서버에 수정 비동기 요청 처리 함수
        function replyModifyClickEvent() {

            const $modBtn = document.querySelector('.modify-btn');
            if ($modBtn) {
                console.log($modBtn);
                $modBtn.onclick = e => {

                    const payload = {
                        replyNo: +document.querySelector('.content-modify-wrapper').dataset.rno,
                        boardNo: +bno,
                        content: document.querySelector('.modify-input').value
                    };

                    console.log(payload);

                    fetch(URL, {
                        method: 'PUT',
                        headers: {
                            'content-type': 'application/json'
                        },
                        body: JSON.stringify(payload)
                    }).then(res => {
                        if (res.status === 200) {
                            alert('댓글이 정상 수정되었습니다!');
                            return res.json();
                        } else {
                            alert('댓글 수정에 실패했습니다.');
                        }
                    }).then(result => {
                        console.log(result);
                        renderReplyList(result);
                    });
                };
            };
        }


        //지도 api 스크립트

        const infowindow = new window.kakao.maps.InfoWindow({
            zIndex: 1
        });

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
                    infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name +
                        '</div>');
                    infowindow.open(map, marker);
                });
            }
        }

        (function () {
            //첫 댓글 페이지 불러오기
            getReplyList();
            makePageButtonClickEvent();
            makeReplyRegisterClickEvent();
            replyRemoveClickEvent();
            replyModifyClickEvent();
        })();

    </script>

</body>

</html>