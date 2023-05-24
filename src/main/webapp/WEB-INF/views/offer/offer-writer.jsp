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

    <form action="/offer/offer-write" method="post" id="write-form" enctype="multipart/form-data">
        <input type="hidden" name="id" value="test1">
        <div class="write-container">
            <div class="write-wrapper">
                <div class="title-wrapper">
                    <div class="review-main-title">게시물 작성</div>
                    <select name="offerType" id="categorySelect" class="categorySelect">
                        <option value="산 추천"  >산 추천</option>
                        <option value="맛집 추천">맛집 추천</option>
                    </select>
                    <div class="section section1">
                        <textarea name="offerTitle1" id="title" cols="30" rows="10" placeholder="제목을 입력해주세요"></textarea>
                        <div>
                            <label for="file">
                                <div class="btn-upload"></div>
                            </label>
                              <input type="file" name="offerImage" id="image">
                        </div>
                        <textarea name="offerContent1" id="content" cols="30" rows="10" placeholder="내용을 입력해주세요"></textarea>
                     </div>
                     <div class="section section2">
                        <textarea name="offerTitle2" id="title" cols="30" rows="10" placeholder="제목을 입력해주세요"></textarea>
                        <div>
                            <label for="file" >
                                <div class="btn-upload"></div>
                            </label>
                              <input type="file" name="offerImage" id="image">
                        </div>
                        <textarea name="offerContent2" id="content" cols="30" rows="10" placeholder="내용을 입력해주세요"></textarea>
                     </div>
                     <div class="section section3">
                        <textarea name="offerTitle3" id="title" cols="30" rows="10" placeholder="제목을 입력해주세요"></textarea>
                        <div>
                            <label for="file">
                                <div class="btn-upload"></div>
                            </label>
                              <input type="file" name="offerImage" id="image" >
                        </div>
                        <textarea name="offerContent3" id="content" cols="30" rows="10" placeholder="내용을 입력해주세요"></textarea>
                     </div>
                     <div class="section section4">
                        <textarea name="offerTitle4" id="title" cols="30" rows="10" placeholder="제목을 입력해주세요"></textarea>
                        <div>
                            <label for="file">
                                <div class="btn-upload"></div>
                            </label>
                              <input type="file" name="offerImage" id="image" >
                        </div>
                        <textarea name="offerContent4" id="content" cols="30" rows="10" placeholder="내용을 입력해주세요"></textarea>
                     </div>
                    <div class="button-wrapper">
                        <button class="submit-btn" type="submit">작성하기</button>
                        <a href="/offer/offer-main" class="close-btn">취소하기</a>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>

</html>