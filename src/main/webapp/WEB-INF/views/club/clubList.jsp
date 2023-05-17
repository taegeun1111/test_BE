<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="/assets/css/club-list.css">
    <%@ include file="../include/static-head.jsp" %>
</head>

<body>

    <%@ include file="../include/header.jsp" %>

    <section class="club-container">
        <div class="club-warpper">
            <div class="write-btn-wrapper"><button class="write-btn">글쓰기</button></div>
            <c:forEach var="b" items="${bList}">
                <div class="club-list-wrapper">
                    <div class="club-title">${b.clubTitle}</div>
                    <div class="icon-detail">
                        <div class="mountain-sec">
                            <img src="/assets/jpg/mountain.png" alt="" class="mountain-icon">
                            <p class="mountain-text">4명</p>
                        </div>
                        <div class="mountain-sec">
                            <img src="/assets/jpg/people.png" alt="" class="people-icon">
                            <p class="people-text">${b.clubRecruitType}</p>
                        </div>
                        <div class="mountain-sec">
                            <img src="/assets/jpg/calendar.png" class="calendar-icon">
                            <p class="calendar-text">${b.clubRegdate}</p>
                        </div>
                        <div class="mountain-sec">
                            <img src="/assets/jpg/location.png" alt="" class="location-icon">
                            <p class="location-text">${b.clubArea}</p>
                        </div>
                    </div>
                    <div class="club-content">
                        ${b.clubContent}
                    </div>

                    <div class="now-count-wrapper">
                        <div class="now-text">현재 모집인원</div>
                        <div class="now-count">1/4<p id="lower-size">명</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <section class="pagination-container">
                <div class="prev-btn"><img src="/assets/jpg/less.png" alt="" class="less-icon"> 이전</div>
                <ul class="pagination-wrapper">
                    <li class="pagination button-active"><a href="">1</a></li>
                    <li class="pagination"><a href="">2</a></li>
                    <li class="pagination"><a href="">3</a></li>
                    <li class="pagination"><a href="">4</a></li>
                    <li class="pagination"><a href="">5</a></li>
                </ul>
                <div class="next-btn">다음<img src="/assets/jpg/than.png" alt="" class="than-icon"></div>
            </section>
        </div>
    </section>

    <script>
        const clubListWrapper = document.querySelector('.club-list-wrapper');

        clubListWrapper.addEventListener('click', function () {
            this.classList.toggle('clicked');
        });
    </script>

</body>

</html>