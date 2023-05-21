<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header -->
<header class="header-container">
    <div class="header-wrapper">
        <ul class="category-wrapper">
            <li><a href="/offer/offer-main" class="category-offer">추천 정보</a></li>
            <li><a href="/account/community" class="category-community">커뮤니티</a></li>
            <li><a href="/club/list" class="category-club">모임</a></li>
            <li><a href="" class="category-secondhand">중고거래</a></li>
            <li><a href="/event/stamp" class="category-event">스탬프</a></li>
        </ul>
        <img src="/assets/jpg/logo(white).png" alt="" class="logo">
        <c:if test="${login == null}">
             <ul class="login-wrapper">
                <li><a href="/account/sign-up" class="signUp-btn">Sign up</a></li>
                <li><a href="/account/sign-in" class="signIn-btn">Sign in</a></li>
            </ul>
        </c:if>
        <!-- Login 되면 보여질 버튼  -->
        <c:if test="${login != null}">
            <ul class="afterLogin-wrapper">
                <li class="logout-btn"><a href="/account/sign-out">Log out</a></li>

                <c:if test="${login.profile == null}">
                        <li class="myPage-btn">
                            <img src="https://cdn-icons-png.flaticon.com/128/7281/7281869.png" alt="프로필사진">
                            <a href="/account/mypage">My Page</a>
                        </li>
                    </div>     
                </c:if>
                <c:if test="${login.profile != null}">
                    <li class="myPage-btn">
                    <img src="/local${login.profile}" alt="프로필사진">
                        <a href="/account/mypage">My Page</a>
                    </li>
                </c:if>
                
            </ul>
        </c:if>
    </div>
</header>