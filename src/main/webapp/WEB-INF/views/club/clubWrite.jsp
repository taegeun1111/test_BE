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

    <form action="/club/write" method="post">
        <div class="write-container">
            <div class="write-wrapper">
                <div class="title-wrapper">
                    <div class="review-main-title">게시물 작성</div>
                    <section class="select-wrapper">
                        <input type="hidden" name="accountId" value="test1">
                        <div class="type-wrapper">
                            <p class="type-title">모임종류</p>
                            <select name="clubRecruitType" id="clubRecruitType">
                                <option value="정기모임">정기모임</option>
                                <option value="소모임">소모임</option>
                            </select>
                        </div>

                        <div class="deadline-wrapper">
                            <p class="deadline-title">마감일자</p>
                            <input type="datetime-local" id="clubRecruitDeadline" name="clubRecruitDeadline">
                        </div>
                    </section>

                    <section class="text-wrapper">
                        <div class="count-wrapper">
                            <p class="count-title">모집인원</p>
                            <input type="number" id="clubRecruitCount" name="clubRecruitCount">
                        </div>

                        <div class="area-wrapper">
                            <p class="area-title">모임장소</p>
                            <input type="type" id="clubArea" name="clubArea">
                        </div>
                    </section>

                    <textarea name="clubTitle" id="title" cols="30" rows="10" placeholder="제목을 입력해주세요"></textarea>
                    <textarea name="clubContent" id="content" cols="30" rows="10" placeholder="내용을 입력해주세요"></textarea>

                    <div class="button-wrapper">
                        <button class="submit-btn">작성하기</button>
                        <a href="/club/list" class="close-btn">취소하기</a>
                    </div>
                </div>


            </div>
        </div>
    </form>
</body>

</html>