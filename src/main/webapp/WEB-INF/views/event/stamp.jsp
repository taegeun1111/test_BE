<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/assets/css/common.css">
    <link rel="stylesheet" href="/assets/css/stamp.css">

    <title>Mountain-Do stamp</title>
</head>
<body>

 <%@ include file="../include/header.jsp" %>
    <div class="event-container">
        <div class="event-wrap">
            <div class="stamp-map">
                <div class="map-header">
                   <h1><span>${login == null ? '비회원' : login.name}</span>님의 STAMP MAP</h1>
                   <hr>
                </div>
                <div class="map-main">
                  </div>

                <div class="map-footer">출석체크</div>
            </div>
            <div class="my-stamp-wrap">
                <div class="my-stamp">
                    <ul>
                        <li>출석
                            <div>
                                <img src="https://cdn-icons-png.flaticon.com/128/753/753344.png">
                            </div>
                        </li>
                        <li class="stamp-3rd">
                            게시물
                            <div>
                                <p>${sc.boardCount}</p>
                                <p>3</p>
                             </div>
                        </li>
                        <li class="stamp-3rd">배너
                            <div>
                                <p>${sc.bannerClickCount}</p>
                                <p>3</p>
                             </div>
                        </li>
                        <li>누적 스탬프
                            <div>
                                <p id="count-stamp">${sc.totalStampCount}개</p>
                             </div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="card-wrap">
                <div class="stamp-card">
                    <ul class="card-main">
                        <li id="stamp-card">
                            <div>?</div>
                            <span>comming soon</span> 
                        </li>
                        <li>
                            <div>?</div>
                            <span>comming soon</span> 
                        </li>
                        <li>
                            <div>?</div>
                            <span>comming soon</span> 
                        </li>
                        <li>
                            <div>?</div>
                            <span>comming soon</span> 
                        </li>
                        <li>
                            <div>?</div>
                            <span>comming soon</span> 
                        </li>
                        <li>
                            <div>?</div>
                            <span>comming soon</span> 
                        </li>
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
      </script>

</body>
</html>