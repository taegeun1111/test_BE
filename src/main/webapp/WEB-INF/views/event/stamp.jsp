<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <%@ include file="../include/account-static-head.jsp" %>
    <!-- <link rel="stylesheet" href="/assets/css/common.css"> -->
    <link rel="stylesheet" href="/assets/css/stamp.css">
    
    <title>Mountain-Do</title>

</head>
<body>
    <!-- <%@ include file="../include/header.jsp" %> -->
    <div class="event-container">
        <div class="event-wrap">
            <div class="stamp-map">
                <div class="map-header">

                    <h1><span>${login == null ? '비회원' : login.name}</span>&nbsp;님의 STAMP MAP</h1>
                    <hr>
                </div>
                <div class="map-main">

                </div>
                <c:if test="${login == null}">
                    <div class="map-footer">로그인이 필요합니다.</div>
                </c:if>
                <c:if test="${login != null}">
                    <div class="map-footer-login">Today Check!</div>
                </c:if>

            </div>
            <div class="my-stamp-wrap">
                <div class="my-stamp">
                    <ul>
                        <li>출석
                            <div>

                                <img src="https://cdn-icons-png.flaticon.com/128/7543/7543187.png">

                            </div>
                        </li>
                        <li class="stamp-3rd">
                            게시물
                            <div>

                                <c:if test="${login == null || sc.boardCount == null }">
                                    <p>0</p>
                                </c:if>
                                <c:if test="${login != null}">
                                    <p>${sc.boardCount}</p>
                                </c:if>

                                <p>3</p>
                            </div>
                        </li>
                        <li class="stamp-3rd">배너
                            <div>

                                <c:if test="${login == null || sc.bannerClickCount == null }">
                                    <p>0</p>
                                </c:if>
                                <c:if test="${login != null}">
                                    <p>${sc.bannerClickCount}</p>
                                </c:if>

                                <p>3</p>
                            </div>
                        </li>
                        <li>누적 스탬프
                            <div>

                                <c:if test="${login == null || sc.stampCount == null }">
                                    <p id="count-stamp">0</p>
                                </c:if>
                                <c:if test="${login != null}">
                                    <p id="count-stamp">${sc.stampCount}</p>
                                </c:if>
                            </div>

                        </li>
                    </ul>
                </div>
            </div>
            <div class="card-wrap">
                <div class="stamp-card">
                    <ul class="card-main">

                    </ul>
                </div>
            </div>
        </div>
    </div>
    <script>
        const mapMain = document.querySelector('.map-main');

        for (let i = 0; i < 18; i++) {
            const stampShape = document.createElement('div');
            stampShape.classList.add('stamp-shape');
            mapMain.appendChild(stampShape);
        }

        const cardMain = document.querySelector('.card-main');

        for (let i = 0; i < 6; i++) {
            const cardShape = document.createElement('li');
            cardShape.classList.add('stamp-card');

            const cardImageDiv = document.createElement('div');
            const cardImage = document.createElement('img');
            const cardText = document.createElement('span');
            cardText.textContent = 'LUCKY CARD';
            // cardImage.src = 'https://cdn-icons-png.flaticon.com/128/3888/3888666.png';
            cardImage.src = 'https://cdn-icons-png.flaticon.com/128/4714/4714846.png';
            cardImageDiv.appendChild(cardImage);
            cardShape.appendChild(cardImageDiv);
            cardShape.appendChild(cardText);
            cardMain.appendChild(cardShape);
        }

        // 출석하기 클릭
        function changeAttendanceImage() {
            const attendanceImage = document.querySelector('.my-stamp li:first-child img');
            attendanceImage.src = 'https://cdn-icons-png.flaticon.com/128/753/753344.png';
        }
        const attendanceButton = document.querySelector('.map-footer-login');
        attendanceButton.addEventListener('click', changeAttendanceImage);

       
        // 비회원 - 로그인 요청
        function goToSignInPage() {
            location.href = '/account/sign-in';
        }
        const signInButton = document.querySelector('.map-footer');
        signInButton.addEventListener('click', goToSignInPage);


        // 메인 스탬프 찍기
        const stampMain = document.querySelector('.map-main');
     const stampShapes = mapMain.querySelectorAll('.stamp-shape');
    const oneDayImage = document.querySelector('.my-stamp li:first-child img');

    function changeAttendanceImage() {
        attendanceImage.src = 'https://cdn-icons-png.flaticon.com/128/753/753344.png';
    }

    function checkBoardCount() {
        const boardsCount = `${sc.boardCount}`;

        if (boardCount === 3) {
            stampShapes[2].style.backgroundImage = 'url("https://cdn-icons-png.flaticon.com/128/8610/8610016.png")';
        }
    }

    function checkBannerClickCount() {
        const bannersClickCount = `${sc.bannerClickCount}`;

        if (bannerClickCount === 3) {
            stampShapes[3].style.backgroundImage = 'url("https://cdn-icons-png.flaticon.com/128/8610/8610016.png")';
        }
    }

    for (let i = 0; i < 18; i++) {
        const stampShape = document.createElement('div');
        stampShape.classList.add('stamp-shape');
        mapMain.appendChild(stampShape);
    }

    attendanceButton.addEventListener('click', () => {
        changeAttendanceImage();
        checkBoardCount();
        checkBannerClickCount();
    });
  
    </script>

</body>

</html>