<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/assets/css/offer.css">

    <title>Mountain-Do</title>
    <style>

        /* 맛집 추천 독립 css */
    .article-resto {
        margin: 100px auto 50px;
    }

    .article-resto .article-wrap {
        display: flex;
        justify-content: flex-start;
        font-size: 18px;
    }
    
    .article-wrap div {
        padding-left: 15px;
        width: 450px;
        line-height: 1.9;
    }
    .article-resto .article-wrap ul {
        margin: 10px auto 20px;
    }
    /* 추후 js 걸어야 함 */
    .offer-category-select li:nth-child(2) {
        background: #b7d15a;
    }

    .offer-category-select li:nth-child(2) a {
        color: #fff;
        text-decoration: underline;
    }
    </style>
</head>

<body>
    <%@ include file="../include/header.jsp" %>
    <section class="offer-wrapper">

        <!-- offer header -->
        <div class="header-title-wrapper">
            <div class="title-wrapper">
                <div class="offer-main-title">추천 정보</div>
                <div class="offer-sub-title">보다 행복한 산행이 되시도록 산행길과 맛집을 추천해드려요.</div>
            </div>
            <div class="offer-category-select">
                <ul class="category">
                    <li><a href="/offer/offer-main">이달의 산행 추천</a></li>
                    <li><a href="/offer/offer-eat">코스별 맛집 추천</a></li>
                </ul>
            </div>
        </div>
        <main>
            <div class="container">

                <!-- 관리자 권한 -->
                <button class="article-write-btn">글쓰기</button>

                <!-- article main -->
                <section class="article article-header">
                    <h2 class="article-title">코스별 맛집 추천!</h2>
                    <!-- <p class="article-header-img"><img src="https://image.istarbucks.co.kr/common/img/coffee/coffeeCultivation_info_img01.jpg" alt="산 이미지"></p> -->
                    <div class="article-content header-content">코로나 이후 등산객과 캠핑족들이 늘어났다고 하죠!
                        마스크를 끼고 등산해야하는건 불편하지만 그래도 자연이라는 오픈된 공간이기에 많은 분들이 등산에 입문 중입니다.
                        오늘은 등린이들도 충분히 오를 수 있는 난이도 하의 등산 코스와 등산을 하는 이유인 그 주변 맛집들을 소개해볼게요.</div>
                </section>

                <hr style="border: 1px solid #d0d0d0;">

                <!--resto article main -->
                <section class="article-resto">

                    <h2 class="article-title">${text.offerTitle1}</h2>
                    <img src="/local${image.get(0).offerImage}"
                    alt="원조할아버지 이미지" class="article-image">
                            <p class="article-content"> ${text.offerContent1}</p>
                </section>

                <section class="article">
                    <h2 class="article-title">${text.offerTitle2}</h2>
                    <img src="/local${image.get(1).offerImage}"
                        alt="응봉산 이미지" class="article-image">
                    <p class="article-content">${text.offerContent2}
                    </p>
                </section>
                <section class="article">
                    <h2 class="article-title">${text.offerTitle3}</h2>
                    <img src="/local${image.get(2).offerImage}"
                        alt="아차산 이미지" class="article-image">
                    <p class="article-content">${text.offerContent3}</p>
                </section>

                <section class="article">
                    <h2 class="article-title">${text.offerTitle4}</h2>
                    <img src="/local${image.get(3).offerImage}"
                        alt="청계산 이미지" class="article-image">
                    <p class="article-content">${text.offerContent4}</p>
                </section>
            </div>
        </main>
    </section>

    <script>
        // 글쓰기 버튼
        function goToOfferWritePage() {
            location.href = '/offer/offer-writer';
        }

        const offerWriteButton = document.querySelector('.article-write-btn');
        offerWriteButton.addEventListener('click', goToOfferWritePage);
    </script>

</body>

</html>