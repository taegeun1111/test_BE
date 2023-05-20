<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/assets/css/clubWrite.css">
</head>

<body id="body-color" >
    <%@ include file="../include/header.jsp" %>

    <form action="/board/write" method="post">
        <div class="write-container">
            <div class="write-wrapper">
                <div class="title-wrapper">
                    <div class="review-main-title">게시물 작성</div>
                    <section class="select-wrapper">
                        <input type="hidden" name="accountId" value="test1">
                        <div class="type-wrapper">
                            <p class="type-title">모임종류</p>
                            <select name="secondhandDealType" id="clubRecruitType">
                                <option value="SELL">팝니다</option>
                                <option value="BUY">삽니다</option>
                            </select>
                        </div>

                        <div class="type-wrapper">
                            <p class="type-title">모임종류</p>
                            <select name="secondhandArea" id="secondhandArea">
                                <option value="서울특별시">서울특별시</option>
                                <option value="부산광역시">부산광역시</option>
                                <option value="대구광역시">대구광역시</option>
                                <option value="인천광역시">인천광역시</option>
                                <option value="광주광역시">광주광역시</option>
                                <option value="대전광역시">대전광역시</option>
                                <option value="울산광역시">울산광역시</option>
                                <option value="세종특별자치시">세종특별자치시</option>
                                <option value="강원도">강원도</option>
                                <option value="충청북도">충청북도</option>
                                <option value="충청남도">충청남도</option>
                                <option value="전라북도">전라북도</option>
                                <option value="전라남도">전라남도</option>
                                <option value="경상북도">경상북도</option>
                                <option value="경상남도">경상남도</option>
                                <option value="제주특별자치도">제주특별자치도</option>
                            </select>
                        </div>
                    </section>

                    <textarea name="secondhandTitle" id="title" cols="30" rows="10" placeholder="제목을 입력해주세요"></textarea>
                    <textarea name="secondhandContent" id="content" cols="30" rows="10" placeholder="내용을 입력해주세요"></textarea>

                    <div class="button-wrapper">
                        <button class="submit-btn">작성하기</button>
                        <a href="/baord/list" class="close-btn">취소하기</a>
                    </div>
                </div>


            </div>
        </div>
    </form>
</body>

</html>