<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="/assets/css/communityWrite.css">
    <%@ include file="../include/static-head.jsp" %>
</head>

<body id="body-color">

    <%@ include file="../include/header.jsp" %>

    <form action="" method="post" id="write-porm">
        <input type="hidden" name="id" value="${login.accountId}">
        <div class="write-container">
            <div class="write-wrapper">
                <div class="title-wrapper">
                    <div class="review-main-title">게시물 작성</div>
                    <select name="" id="categorySelect" class="categorySelect">
                        <option value="feed">일상</option>
                        <option value="review">산악 후기</option>
                        <option value="issue">산악 이슈</option>
                    </select>
                    <textarea name="title" id="title" cols="30" rows="10" placeholder="제목을 입력해주세요"></textarea>
                    <textarea name="content" id="content" cols="30" rows="10" placeholder="내용을 입력해주세요"></textarea>

                    <div class="button-wrapper">
                        <button class="submit-btn">작성하기</button>
                        <a href="/club/list" class="close-btn">취소하기</a>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script>
        
        const $selected = document.getElementById('categorySelect');
        const $form = document.getElementById('write-porm');

        $form.addEventListener('submit', function (event) {
            event.preventDefault(); // 폼 제출 기본 동작 중단
            const selectedValue = $selected.value;
            let link = '';
            // action 속성 설정
            if (selectedValue === 'feed') {
                $form.action = '/feed/write';
            } else if (selectedValue === 'review') {
                $form.action = '/review/write';
            } else if (selectedValue === 'issue') {
                $form.action = '/issue/write';
            }

            // 폼 제출
            $form.submit();
        });
    </script>
</body>

</html>