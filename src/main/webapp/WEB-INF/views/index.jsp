<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <%@ include file="include/static-head.jsp" %>
  <link rel="stylesheet" href="/assets/css/index.css">
</head>

<body>

  <%@ include file="include/header.jsp" %>
  <div class="index-container">

    <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
      <div class="carousel-inner">

        <!-- 1번 이미지 -->
        <div class="carousel-item active">
          <div class="row">
            <div class="col-4">
              <div class="main-text">
                <div class="main-logo"><img src="/assets/jpg/logo(white).png" alt=""></div>
                <div class="main-title-wrapper">
                  <h1 class="main-title">함께하는 등산이<br>좋은등산이 될 수 있도록</h1>
                  <a href="/club/list" class="gobtn">
                    산행 신청하러 가기
                    <img src="/assets/jpg/than.png" alt="">
                  </a>
                </div>
                <h2 class="sub-title">Mountain Climbing Together</h2>
              </div>
            </div>
            <div class="col-8">
              <img src="/assets/jpg/메인이미지1.jpg" class="d-block" alt="...">
            </div>
          </div>

          <div class="button-container">
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls"
              data-bs-slide="prev" style="cursor: pointer;">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls"
              data-bs-slide="next" style="cursor: pointer;">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Next</span>
            </button>
          </div>
        </div>


        <!-- 2번 이미지 -->
        <div class="carousel-item">
          <div class="row">
            <div class="col-4">
              <div class="main-text">
                <div class="main-logo"><img src="/assets/jpg/logo(white).png" alt=""></div>
                <div class="main-title-wrapper">
                  <h1 class="main-title">더 나은<br>가치를 창출하기 위해</h1>
                  <a href="/board/list" class="gobtn">
                    중고거래 하러 가기
                    <img src="/assets/jpg/than.png" alt="">
                  </a>
                </div>
                <h2 class="sub-title">Mountain Climbing Together</h2>
              </div>
            </div>
            <div class="col-8">
              <img src="/assets/jpg/메인이미지2.png" class="img2" alt="...">
            </div>
          </div>

          <div class="button-container">
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls"
              data-bs-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="visually-hidden" style="cursor: pointer;">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls"
              data-bs-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="visually-hidden" style="cursor: pointer;">Next</span>
            </button>
          </div>
        </div>

        <!-- 3번 이미지 -->
        <div class="carousel-item">
          <div class="row">
            <div class="col-4">
              <div class="main-text">
                <div class="main-logo"><img src="/assets/jpg/logo(white).png" alt=""></div>
                <div class="main-title-wrapper">
                  <h1 class="main-title">이벤트를 통해<br>상품에 응모해보세요</h1>
                  <a href="/event/stamp" class="gobtn">
                    스탬프 찍으러 가기
                    <img src="/assets/jpg/than.png" alt="">
                  </a>
                </div>
                <h2 class="sub-title">Mountain Climbing Together</h2>
              </div>
            </div>
            <div class="col-8">
              <img src="/assets/jpg/메인이미지3.png" class="img3" alt="...">
            </div>
          </div>

          <div class="button-container">
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls"
              data-bs-slide="prev" style="cursor: pointer;">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls"
              data-bs-slide="next" style="cursor: pointer;">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Next</span>
            </button>
          </div>
        </div>


      </div>

    </div>
  </div>
</body>

</html>