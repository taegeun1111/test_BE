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

                    <h1><span id="account_id">${stamp.accountId}</span>&nbsp;님의 STAMP MAP</h1>
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
                                <c:if test="${stamp.attendCount==true}">
                                    <div class="none-check">
                                        <img src="https://cdn-icons-png.flaticon.com/128/7543/7543187.png" class="none-check">
                                    </div>  
                                </c:if>
                                <c:if test="${stamp.attendCount==false}">
                                    <div class="none-check">
                                        <img src="https://cdn-icons-png.flaticon.com/128/753/753344.png" class="none-check">
                                    </div>
                                </c:if>
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

        const sessionId = document.getElementById('account_id');
        const accountId = sessionId.innerText;
        
        // 스탬프 맵 생성
        const totalStampCount = `${stamp.totalStampCount}`;
    
        const mapMain = document.querySelector('.map-main');
        
        for (let i = 0; i < 18; i++) {
            const stampShape = document.createElement('div');
            stampShape.classList.add('stamp-shape');
            mapMain.appendChild(stampShape);
        }
        
        function createStampShapes(totalStampCount) {
            console.log("createStampShapes 들어왔따요!!! / "+totalStampCount);
            const stampShapes = document.querySelectorAll('.stamp-shape');
            
            for (let i = 0; i < totalStampCount; i++) {
                stampShapes[i].classList.add('stamp-img-shape');
            }
        }

        
        // 럭키카드 생성
        const cardMain = document.querySelector('.card-main');
        const stampCards = [];

        for (let i = 0; i < 6; i++) {
            const cardShape = document.createElement('li');
            cardShape.classList.add('stamp-card');

            const cardImageDiv = document.createElement('div');
            const cardImage = document.createElement('img');
            const cardText = document.createElement('span');
            cardText.textContent = 'LUCKY CARD';
            cardImage.src = 'https://cdn-icons-png.flaticon.com/128/4714/4714846.png';
            cardImageDiv.appendChild(cardImage);
            cardShape.appendChild(cardImageDiv);
            cardShape.appendChild(cardText);
            cardMain.appendChild(cardShape);

            stampCards.push(cardShape);
        }

        
        const receivedValue = `${stamp.totalStampCount}`; 
        console.log("스탬프 친구 몇개?", receivedValue);

        function activateLuckyCard(card) {
        card.addEventListener('mouseenter', function() {
            if (!card.classList.contains('disabled')) {
                card.style.cursor = 'pointer';
                card.style.backgroundColor = 'lemonchiffon';
            }
        });

        card.addEventListener('mouseleave', function() {
            if (!card.classList.contains('disabled')) {
                card.style.cursor = 'default';
                card.style.backgroundColor = 'lightgray';
            }
        });

        card.addEventListener('click', function() {
            if (!card.classList.contains('disabled')) {
                // 현재 카드가 이미 활성화된 카드일 경우에만 실행
                if (card === activatedCard) {
                    alert('🎁축하합니다! 경품에 당첨되셨습니다!');
                } else {
                    alert('아쉽지만 꽝입니다.');
                }

                deactivateAllCardsExcept(card); // 클릭된 카드를 제외하고 모든 카드를 비활성화하는 함수 호출
            }
        });
    }

    function deactivateLuckyCard(card) {
        card.classList.add('disabled');
        card.style.cursor = 'default';
        card.style.backgroundColor = 'gray';
        card.removeEventListener('mouseenter', null);
        card.removeEventListener('mouseleave', null);
        card.removeEventListener('click', null);
    }

    function deactivateAllCardsExcept(exceptCard) {
        stampCards.forEach(card => {
            if (card !== exceptCard) {
                deactivateLuckyCard(card);
            }
        });
    }

        let activatedCard;

        if (receivedValue >= 18) {
            stampCards.forEach(card => {
                activateLuckyCard(card);
            });

            const randomIndex = Math.floor(Math.random() * stampCards.length);
            activatedCard = stampCards[randomIndex];
            console.log("랜덤인덱:", randomIndex);

        } else {
            stampCards.forEach(card => {
                deactivateLuckyCard(card);
            });
        }
        

        // 출석하기 클릭
        
        const attendanceButton = document.querySelector('.map-footer-login');
        if (attendanceButton) {
            attendanceButton.addEventListener('click', changeAttendanceImage);
        } 
        function changeAttendanceImage() {
                    attendanceButton.classList.add('map-footer-loginCK');
                    const attendanceImage = document.querySelector('.my-stamp li:first-child img');
                    attendanceImage.src = 'https://cdn-icons-png.flaticon.com/128/753/753344.png';
                    attendanceImage.alt = 'Check Done';
                    
                    localStorage.setItem('attendanceDone', 'true');
                    const attendanceChkButton = document.querySelector('.none-check');
                    attendanceChkButton.classList.add('done-check');
                
         }

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
                StampNumber(accountId);
            })
            .catch(function(error) {
                console.error('클릭 실패');
            });
        }


        // 배너 클릭 횟수 카운트 비동기 
        var bannerClickCount = `${stamp.bannerClickCount}`;
        var clickSideBars = document.querySelectorAll('.side-banner');
        var clickCountElement = document.getElementById('clickCount');
        var stampCount = document.getElementById('count-stamp');

        clickSideBars.forEach(function(clickSideBar) {
            clickSideBar.addEventListener('click', function() {
                // if (bannerClickCount < 3) {
                sendTrueToServer();

                // }
                });
                });

    

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
                .then(response => response.json())
                .then(res => {
                    console.log('res: ', res);
                
                    bannerClickCount=res.bannerClickCount;

                    clickCountElement.textContent = bannerClickCount;
                    var accountId = res.accountId;
                    console.log('accountId: ', accountId);

                    StampNumber(accountId);

                })
                
            }

            function StampNumber(accountId){
                fetch('/event/stamp-count', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                        accountId : accountId
                    })
                })
                .then(response => response.json())
                .then(res => {
                    console.log('res가숫자제대로뜨려나: ', res);
                
                    stampCount.innerHTML = res;
                    createStampShapes(res);
                })
                
            }

            StampNumber(accountId);


    </script>

</body>

</html>