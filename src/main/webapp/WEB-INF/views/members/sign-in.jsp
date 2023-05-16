<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="common.css">
    <link rel="stylesheet" href="sign-in.css">
    <link rel="stylesheet" href="../members/ex/header.css">
    <title>Mountain-Do</title>
</head>

<body>
    <header class="header-container">
        <div class="header-wrapper">
            <ul class="category-wrapper">
                <li><a href="offer-menu.html" class="">추천 정보</a></li>
                <li><a href="" class="">커뮤니티</a></li>
                <li><a href="" class="">모임</a></li>
                <li>


                    <a href="" class="">중고거래</a></li>
                <li><a href="" class="">스탬프</a></li>
            </ul>
            <!-- <img src="jpg/logo(white).png" alt="" class="logo"> -->

            <ul class="login-wrapper">
                <li><a href="sign-up.html" class="signUp-btn">Sign up</a></li>
                <li><a href="sign-in.html" class="signIn-btn">Sign in</a></li>
            </ul>
        </div>
    </header>

    <div class="container">
        <div class="sign-in-wrap">
            <div id="sign-in-header">
                <div class="header">
                    <h1 class="head1">Mountain-Do</h1>
                </div>
                <div class="head2">
                    <p> 정보공유, 모임참여, 물품거래 등<br>
                        로그인을 통해 더 많은 혜택을 누려보세요.</p>
                </div>
            </div>

            <div class="sign-in-body">
                <form action="/members/sign-in" name="signIn" id="signInForm" method="post">
                    <ul>
                        <div class="signIn-input">
                            <li>
                                <div>
                                    <input type="text" name="account-id" id="accound-id" class="form-control"
                                        maxlength="15" required="required" aria-required="true"
                                        placeholder="아이디 입력">
                                    <span id="idChk"></span>
                                </div>
                            </li>
                            <li>
                                <input type="password" name="password" id="password" size="17" maxlength="20"
                                    class="form-control" maxlength="20" required="required" aria-required="true"
                                    placeholder="비밀번호 입력">
                            </li>
                        </div>
                        <div id="sign-btn">
                            <li>
                                <div id="btn" class="sign-in-btn">
                                    <button class="sign-btn">로그인</button>
                                </div>
                            </li>
                            </div>
                        </form>
                            <div class="line_lr"> 신규 이용 고객 </div>
                            <div id="sign-btn">
                            <li>
                                <div id="btn" class="sign-up-btn">
                                    <a href="sign-up.html" class="sign-btn">회원가입</a>
                                </div>
                            </li>
                            </div>
                    </div>
                    </ul>

            </div>
        </div>
    </div>
    </div>

    <script>

    </script>

</body>

</html>