<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="/assets/css/reviewDetail.css">
    <%@ include file="../include/static-head.jsp" %>
</head>

<body id="bg-color">

    <%@ include file="../include/header.jsp" %>

    <section id="issue-detail-container">
        <div class="top-wrapper">
            <a href="/review/list" class="category">산악 리뷰<img src="/assets/jpg/than.png" alt="" class="than-btn"></a>

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
                                    <a href="/review/modify?bno=${is.boardNo}">수정</a>
                                    <a href="/review/delete?bno=${is.boardNo}">삭제</a>
                                </div>
                            </c:if>

                        </div>
                    </div>
                </div>

                <div class="like-it-count">
                    <div class="heart"><img src="/assets/jpg/heart(line).png" alt="좋아요" class="heard-icon">좋아요
                        ${is.likeCount}</div>

                    <div class="comment"><img src="/assets/jpg/bubble(line).png" alt="댓글" class="comment-icon">댓글 10
                    </div>
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
                                    <img src="/${login.profile}" alt="프사">
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

                <textarea name="" id="comment-write-area" cols="" rows="" placeholder="댓글을 입력하세요."></textarea>
                <button type="submit" class="submit-btn">등록</button>
            </div>
        </section>


        <!-- <div id="replyModifyModal" class="modify-modal">
            <input id="modReplyId" type="hidden">
            <textarea id="modReplyText" class="form-control" placeholder="수정할 댓글 내용을 입력하세요." rows=""></textarea>
            <div class="modal-footer">
                <button id="replyModBtn" type="button" class="btn">수정</button>
                <button id="modal-close" type="button" class="btn">닫기</button>
            </div>
        </div> -->

        <!-- 댓글 페이징 영역 -->
        <ul class="pagination justify-content-center">
            <!-- 
                        < JS로 댓글 페이징 DIV삽입 > 
                    -->
        </ul>


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




        //--------------------------------------------------
        //글번호
        const bno = '${is.boardNo}';

        //댓글 요청 URI
        const URL = '/review-reply';

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
            reviewReplies,
            replyCount,
            replyPage
        }) {
            // 댓글 내용 렌더링
            // 각 댓글 하나의 태그
            let tag = '';

            if (reviewReplies === null || reviewReplies.length === 0) {
                tag += "<div id='replyContent' class='card-body'>현재 등록된 댓글이 없습니다</div>";
            } else {
                for (let rep of reviewReplies) {

                    const {
                        replyNo,
                        replyWriter,
                        replyContent,
                        replyRegDate
                        // account: replyWriter,
                        // profile
                    } = rep;
                    tag += `

                    <div id='replyContent' class='comment-list' data-reply-id='\${replyNo}'>
                        <div class="comment-profile"></div>
                        <div class="text-wrapper">
                            <div class="comment-info">
                                <div class="comment-detail-wrapper">
                                    <div class="comment-id">\${replyWriter}</div>

                                    <div class='btn-container'>
                                        <a id='replyModBtn' class='btn btn-sm'>수정</a>
                                        <a id='replyDelBtn' class='btn btn-sm' href='#'>삭제</a>
                                    </div>
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

                    // modifyBtn.addEventListener('click', e => {

                    //     const $textSpan = document.createElement('span');
                    //     $textSpan.classList.add('text');
                    //     $textSpan.textContent = $modInput.value;

                    //     const $label = $modInput.parentElement;
                    //     $label.replaceChild($textSpan, $modInput);
                    // })

                    // 모달에 모달바디에 textarea에 읽은 텍스트를 삽입
                    // document.getElementById('modReplyText').value = replyText;

                    // 다음 수정완료 처리를 위해 미리 
                    // 수정창을 띄울 때 댓글번호를 모달에 붙여놓자
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
                            // 모달창 닫기
                            // document.getElementById('modal-close').click();
                            return res.json();
                        } else {
                            alert('댓글 수정에 실패했습니다.');
                        }
                    }).then(result => {
                        renderReplyList(result);
                    });
                };
            };
        }



        // document.addEventListener('DOMContentLoaded', () => {
        //     replyRemoveClickEvent();
        //     replyModifyClickEvent();
        // });

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