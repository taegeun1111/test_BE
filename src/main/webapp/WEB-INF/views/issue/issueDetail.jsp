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

            <c:if test="${empty login}">
                <div class="like-btn">좋아요 <span class="currentLike">${is.likeCount}</span></div>
            </c:if>

            <c:if test="${not empty login}">
                <c:if test="${i == true}">
                    <div class="like-btn like-ative">좋아요 <span class="currentLike">${is.likeCount}</span></div>
                </c:if>

                <c:if test="${i == false}">
                    <div class="like-btn">좋아요 <span class="currentLike">${is.likeCount}</span></div>
                </c:if>
            </c:if>
        </div>



    </section>

    <script>
        const $heart = document.querySelector('.like-btn');
        const originSrc = "/assets/jpg/heart(line).png";
        const changeSrc = "/assets/jpg/heart(full).png";
        let clickLike = true;

        // 주소값 변경해야 함
        const URL2 = '/issue-like';

        // jsp줘야함
        $heart.addEventListener('click', e => {
            // const heartIcon = document.querySelector('.heard-icon');
            const currentAccount = '${login.accountId}';
            const bno = '${is.boardNo}';
            console.log('bno = '+bno);
            if (!currentAccount) {
                alert('로그인을 먼저 해주세요!');
            } else {
                if (clickLike) {
                    $heart.classList.toggle('like-ative');
                    // heartIcon.src = originSrc;
                    clickLike = true;
                } else {
                    $heart.classList.toggle('like-ative');
                    // heartIcon.src = changeSrc;
                    clickLike = true;
                }
                // 여기까지 3개 파라미터가 등록되어야 함
                console.log(`아이디:\${currentAccount}, 클릭:\${clickLike}, 게시글번호:\${bno}`);

                likeClick(currentAccount, clickLike, bno);
            }
        });


        function likeClick(currentAccount, clickLike, bno) {
            const payload = {
                accountId: currentAccount,
                issueBoardNo: bno,
                clickLike: clickLike
            }

            const requestInfo = {
                method: 'POST',
                headers: {
                    'content-type': 'application/json'
                },
                body: JSON.stringify(payload)
            };

            fetch(URL2, requestInfo)
                .then(response => response.json())
                .then(data => {
                    // JSON 응답 데이터 처리
                    console.log('data : ' + data.likeCount);
                    document.querySelector('.currentLike').textContent = data.likeCount;
                });
        };



        
    </script>
</body>

</html>