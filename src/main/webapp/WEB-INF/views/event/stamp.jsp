<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <%@ include file="../include/account-static-head.jsp" %>
    <link rel="stylesheet" href="/assets/css/stamp.css">

    <title>Mountain-Do</title>

</head>

<body>
    <%@ include file="../include/header.jsp" %>
    <div class="side-banner side-banner1"> </div>

    <div class="event-container">
        <div class="event-wrap">
            <div class="stamp-map">
                <div class="map-header">

                    <h1><span>${login == null ? '비회원' : login.name}</span>&nbsp;님의 STAMP MAP</h1>
                    <hr>
                </div>

                <div class="map-main"></div>
                
                <c:if test="${login == null}">
                    <div class="mf map-footer">로그인이 필요합니다.</div>
                </c:if>
                <c:if test="${stamp.attendCount==true}">
                    <div class="mf map-footer-login">Today Check Please!</div>  
                </c:if>
                <c:if test="${stamp.attendCount==false}">
                    <div class="mf map-footer-loginCK">Today Check Done!</div>
                </c:if>
            </div>
            <div class="my-stamp-wrap">
                <div class="my-stamp">
                    <ul>
                        <li>출석
                            <div id="myStampCheck">
                                <img src="https://cdn-icons-png.flaticon.com/128/7543/7543187.png">
                            </div>
                        </li>
                        <li class="stamp-3rd">
                            게시물
                            <div>

                                <c:if test="${login == null || stamp.boardCount == null }">
                                    <p>0</p>
                                </c:if>
                                <c:if test="${login != null}">
                                    <p id="post">${stamp.boardCount}</p>
                                </c:if>

                                <p>3</p>
                            </div>
                        </li>
                        
                        <li class="stamp-3rd">배너
                            <div>
                                <c:choose>
                                    <c:when test="${login == null || stamp.bannerClickCount == null}">
                                        <p>0</p>
                                    </c:when>
                                    <c:otherwise>
                                        <p id="clickCount">${stamp.bannerClickCount}</p>
                                    </c:otherwise>
                                </c:choose>
                                <p>3</p>
                            </div>
                        </li>

                        <li>누적 스탬프
                            <div>

                                <c:if test="${login == null || stamp.currentStampCount == null }">
                                    <p id="count-stamp">${stamp.currentStampCount}</p>
                                </c:if>
                                <c:if test="${login != null}">
                                    <p id="count-stamp">${stamp.totalStampCount}</p>
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

    <div class="side-banner side-banner2"></div>
    <script>
        
        // 스탬프 맵 생성
        const mapMain = document.querySelector('.map-main');
        const n = `${stamp.totalStampCount}`;
        for (let i = 0; i < 18; i++) {
            const stampShape = document.createElement('div');
            stampShape.classList.add('stamp-shape');
            mapMain.appendChild(stampShape);
        }

        const stampShapes = document.querySelectorAll('.stamp-shape');

        for (let i = 0; i < n; i++) {
        stampShapes[i].classList.add('stamp-img-shape');
        }


        // 럭키카드 생성
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
        
        const attendanceButton = document.querySelector('.map-footer-login');
        if (attendanceButton) {
            attendanceButton.addEventListener('click', changeAttendanceImage);
        } 
        function changeAttendanceImage() {
            const attendanceImage = document.querySelector('.my-stamp li:first-child img');
            attendanceImage.src = 'https://cdn-icons-png.flaticon.com/128/753/753344.png';
            attendanceImage.alt = 'Check Done';
            
            localStorage.setItem('attendanceDone', 'true');
        
            attendanceButton.classList.add('map-footer-loginCK');
        }


        // // 출석하기 알아서 바뀌기
        // var stampCheck = localStorage.getItem('attendanceDone');

        // if (stampCheck) {
        // var myStampCheck = document.getElementById('myStampCheck');
        // var image = myStampCheck.querySelector('img');
        // image.src = 'https://cdn-icons-png.flaticon.com/128/753/753344.png';
        // image.alt = 'Check Done';
        // }

        // 비회원 - 로그인 요청
        function goToSignInPage() {
            location.href = '/account/sign-in';
        }
        const signInButton = document.querySelector('.map-footer');
        if (signInButton) {
            signInButton.addEventListener('click', goToSignInPage);
        }


        // 출석 카운트 비동기 처리
        document.addEventListener("DOMContentLoaded", function() {
        document.querySelector('.map-footer-login').addEventListener("click", function() {
            sendStatus(true);
        });
    });

        function sendStatus(status) {
            fetch('/event/click-stamp', {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify({ status: status })
            })
            .then(function(response) {
                if (response.ok) {
                console.log('클릭 들어옴!!!!!');
                    return response.text();
                } else {
                    throw new Error("Error: " + response.status);
                }
            })
            .then(function(data) {
                console.log('클릭 들어옴!');
            })
            .catch(function(error) {
                console.error('클릭 실패');
            });
        }


        // 배너 클릭 횟수 카운트 비동기 
        var bannerClickCount = `${stamp.bannerClickCount}`;
        var clickSideBars = document.querySelectorAll('.side-banner');
        var clickCountElement = document.getElementById('clickCount');

        clickSideBars.forEach(function(clickSideBar) {
            clickSideBar.addEventListener('click', function() {
                if (bannerClickCount < 3) {
                sendTrueToServer();
                // bannerClickCount++;

                console.log('클릭 횟수:', bannerClickCount);

                // 화면에 클릭 수 업데이트
                if (clickCountElement) {
                    clickCountElement.textContent = bannerClickCount;
                }

                // 서버에 클릭 횟수를 비동기로 전송
                sendClickCountToServer(bannerClickCount);

                // bannerClickCount가 3이 되면 서버에 true 값을 보내도록 추가
                if (bannerClickCount === 3) {
                    console.log("3왔쥬 서버 보내쥬");
                }
                } else {
                alert('오늘의 광고확인을 달성하셨습니다!');
                }
                });
                });

                function sendClickCountToServer(bannerClickCount) {
                fetch('/event/banner-count', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                        bannerClickCount: bannerClickCount
                    })
                })
                .then(response => {
                    if (response.ok) {
                        console.log('클릭 횟수 전송 성공');
                    } else {
                        console.log('클릭 횟수 전송 실패');
                    }
                })
                .catch(error => {
                    console.error('클릭 횟수 전송 중 에러 발생:', error);
                });
            }

            function sendTrueToServer() {
                fetch('/event/banner-count', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                        bannerClickCount : true
                    })
                })
                .then(response => {
                    if (response.ok) {
                        console.log('true 값 전송 성공');
                    } else {
                        console.log('true 값 전송 실패');
                    }
                })
                .catch(error => {
                    console.error('true 값 전송 중 에러 발생:', error);
                });
            }




        // // 스탬프 수에 맞춰 카드 활성화 시키기
        // const targetDiv = document.querySelector('.card-wrap .stamp-card ul li');
        // const receivedValue = 18; // 서버에서 받은 값

        // console.log(targetDiv);

        // if (receivedValue === 18) {
        
        // // hover 효과
        // targetDiv.addEventListener('mouseenter', function() {
        //     targetDiv.style.cursor = 'pointer'; 
        //     targetDiv.style.backgroundColor = 'lemonchiffon'; // 배경색을 레몬색상으로 변경
        // });
        
        // targetDiv.addEventListener('mouseleave', function() {
        //     targetDiv.style.cursor = 'default'; // 원래 커서로 변경
        //     targetDiv.style.backgroundColor = 'gray'; // 배경색을 다시 빨간색으로 변경
        // }); 
        
        // // 링크 추가
        // const linkElement = document.createElement('a');
        // linkElement.href = 'https://example.com'; // 링크 URL 설정
        // linkElement.textContent = 'Click Here'; // 링크 텍스트 설정
        // targetDiv.appendChild(linkElement); // <div> 내부에 링크 요소 추가
        // }

    </script>

</body>

</html>