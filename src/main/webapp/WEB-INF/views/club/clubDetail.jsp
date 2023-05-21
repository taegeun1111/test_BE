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

    </section>

    <script>
   
    </script>

</body>

</html>