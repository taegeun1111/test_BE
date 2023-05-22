<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ include file="../include/account-static-head.jsp" %>
    <link rel="stylesheet" href="/assets/css/offer-writer.css">

    <title>Mountain-Do</title>
</head>

<body id="body-color">
<%@ include file="../include/header.jsp" %>

    <form action="/offer/offer-write" method="post" id="write-form">
        <input type="hidden" name="id" value="test1">
        <div class="write-container">
            <div class="write-wrapper">
                <div class="title-wrapper">
                    <div class="review-main-title">게시물 작성</div>
                    <select name="" id="categorySelect" class="categorySelect">
                        <option value="offer-main">산 추천</option>
                        <option value="offer-restaurant">맛집 추천</option>
                    </select>
                    <div class="section section1">
                        <textarea name="title1" id="title" cols="30" rows="10" placeholder="제목을 입력해주세요"></textarea>
                        <div>
                            <label for="file">
                                <div class="btn-upload"></div>
                            </label>
                              <input type="file" name="articleImage1" id="image" required>
                        </div>
                        <textarea name="articleContent1" id="content" cols="30" rows="10" placeholder="내용을 입력해주세요"></textarea>
                     </div>
                     <div class="section section2">
                        <textarea name="title2" id="title" cols="30" rows="10" placeholder="제목을 입력해주세요"></textarea>
                        <div>
                            <label for="file">
                                <div class="btn-upload"></div>
                            </label>
                              <input type="file" name="articleImage2" id="image" required>
                        </div>
                        <textarea name="articleContent2" id="content" cols="30" rows="10" placeholder="내용을 입력해주세요"></textarea>
                     </div>
                     <div class="section section3">
                        <textarea name="title3" id="title" cols="30" rows="10" placeholder="제목을 입력해주세요"></textarea>
                        <div>
                            <label for="file">
                                <div class="btn-upload"></div>
                            </label>
                              <input type="file" name="articleImage3" id="image" required>
                        </div>
                        <textarea name="articleContent3" id="content" cols="30" rows="10" placeholder="내용을 입력해주세요"></textarea>
                     </div>
                     <div class="section section4">
                        <textarea name="title4" id="title" cols="30" rows="10" placeholder="제목을 입력해주세요"></textarea>
                        <div>
                            <label for="file">
                                <div class="btn-upload"></div>
                            </label>
                              <input type="file" name="articleImage4" id="image" required>
                        </div>
                        <textarea name="articleContent4" id="content" cols="30" rows="10" placeholder="내용을 입력해주세요"></textarea>
                     </div>
                    <div class="button-wrapper">
                        <button class="submit-btn">작성하기</button>
                        <a href="/offer/offer-main" class="close-btn">취소하기</a>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script>

        const $selected = document.getElementById('categorySelect');
        const $form = document.getElementById('write-form');

        $form.addEventListener('submit', function (event) {
            event.preventDefault(); // 폼 제출 기본 동작 중단
            const selectedValue = $selected.value;
            let link = '';
            // action 속성 설정
            if (selectedValue === 'offer-main') {
                $form.action = '/offer/offer-main';
            } else if (selectedValue === 'offer-restaurant') {
                $form.action = '/offer/offer-restaurant';
            } 

            // 폼 제출
            $form.submit();
        });
    </script>
</body>

</html>