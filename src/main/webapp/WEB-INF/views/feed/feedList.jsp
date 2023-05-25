<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="/assets/css/feedList.css">
    <%@ include file="../include/static-head.jsp" %>
</head>

<body id="bg-color">

    <%@ include file="../include/header.jsp" %>

    <!-- 글 영역 -->
    <section class="feed-container">
        <div class="main-img">
            <img src="/assets/jpg/feed이미지.jpg" alt="">
        </div>
        <section class="list-container">

            <div class="writebtn-warpper">
                <a href="/issue/write" class="write-btn">글쓰기</a>
            </div>

            <c:forEach var="f" items="${fList}">
                <div class="feed-list">
                    <div class="list-img-wrapper">
                        <img src="/local${f.feedImg}" alt="" id="list-img">
                    </div>
                    <div class="list-text">
                        <div class="text-title">${f.title}</div>
                        <div class="text-content">${f.content}</div>
                    </div>
                    <div class="like-it-count">
                        <div class="heart"><img src="/assets/jpg/heart(white).png" alt="좋아요" class="heard-icon">좋아요
                            ${f.likeCount}</div>

                        <div class="comment"><img src="/assets/jpg/bubble(white).png" alt="댓글" class="comment-icon">댓글
                            <span id="replyCnt"></span>
                        </div>
                    </div>
                </div>
            </c:forEach>


            <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                Launch demo modal
            </button>

            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                aria-hidden="true" style="margin-top: 200px;">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">${login.accountId}님의 글</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div class="mb-3">
                                    <!-- 내용 영역 -->

                                </div>

                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                        </div>
                    </div>
                </div>
            </div>


        </section>


        <!-- 페이지 버튼 영역 -->
        <ul class="pagination">
            <c:if test="${maker.page.pageNo != 1}">
                <li class="page-item"><a class="page-link" href="/feed/list?pageNo=1">&lt;&lt;</a></li>
            </c:if>

            <c:if test="${maker.prev}">
                <li class="page-item"><a href="/feed/list?pageNo=${maker.begin-1}" class="page-link">prev</a>
                </li>
            </c:if>

            <c:forEach var="i" begin="${maker.begin}" end="${maker.end}">
                <li data-page-num="${i}" class="page-item">
                    <a class="page-link" href="/feed/list?pageNo=${i}">${i}</a>
                </li>
            </c:forEach>

            <c:if test="${maker.next}">
                <li class="page-item"><a href="/issue/list?pageNo=${maker.end+1}" class="page-link">next</a></li>
            </c:if>

            <c:if test="${maker.page.pageNo != maker.finalPage}">
                <li class="page-item"><a class="page-link" href="/issue/list?pageNo=${maker.finalPage}">&gt;&gt;</a>
                </li>
            </c:if>
        </ul>
        </div>

    </section>




    <script>
        //현재 위치한 페이지에 active 스타일 부여하기
        function appendPageActive() {

            // 현재 내가 보고 있는 페이지 넘버
            const curPageNum = '${maker.page.pageNo}';
            console.log("현재페이지: ", curPageNum);

            // 페이지 li태그들을 전부 확인해서 
            // 현재 위치한 페이지 넘버와 텍스트컨텐츠가 일치하는
            // li를 찾아서 class active 부여
            const $ul = document.querySelector('.pagination');

            for (let $li of [...$ul.children]) {
                if (curPageNum === $li.dataset.pageNum) {
                    $li.classList.add('active');
                    break;
                }
            }

        }

        // 글자 수 제한
        // title 요소 선택
        const $contents = document.querySelectorAll('.text-content');
        const $titles = document.querySelectorAll('.text-title');

        // title 생략 및 ... 추가 함수
        function truncateTitle(titleElement, maxLength) {
            const title = titleElement.textContent;
            if (title.length > maxLength) {
                titleElement.textContent = title.slice(0, maxLength) + '...';
            }
        }

        // 각 title 요소에 대해 처리
        $contents.forEach(content => {
            truncateTitle(content, 50); // 최대 50글자로 제한
        });

        $titles.forEach(title => {
            truncateTitle(title, 15); // 최대 15글자로 제한
        });




        appendPageActive();


        // 각 feed-list 요소를 선택
        const feedLists = document.querySelectorAll('.feed-list');

        // 모달 요소를 선택
        const modal = document.getElementById('exampleModal');

        // 모달 내용을 채우는 함수
        function fillModalContent(title, content, srcValue) {
            console.log("fillModalContent의 srcValue : ",srcValue );
            // 모달 내용 영역을 선택
            const modalBody = modal.querySelector('.modal-body');

            // 모달 내용
            modalBody.innerHTML = `
                <form>
                    <div class="mb-3">
                        <div class="feed-list">
                            <div class="list-img-wrapper">
                                <img src="\${srcValue}" alt="" id="list-img">
                            </div>
                            <div class="list-text">
                                <div class="text-title">\${title}</div>
                                <div class="text-content">\${content}</div>
                            </div>
                        </div>
                    </div>
                </form>
            `;
        }

        // 각 feed-list에 클릭 이벤트를 추가
        feedLists.forEach(feedList => {
            feedList.addEventListener('click', (e) => {
                // 해당 feed의 제목과 내용
                const closestListImg = event.target.closest('.feed-list').querySelector('#list-img');
                const srcValue = closestListImg.getAttribute('src');
                console.log(srcValue);


                const title = feedList.querySelector('.text-title').textContent;
                const content = feedList.querySelector('.text-content').textContent;

                // 모달 내용을 채웁니다.
                fillModalContent(title, content, srcValue);

                // 모달을 활성화합니다.
                const modalInstance = new bootstrap.Modal(modal);
                modalInstance.show();
            });
        });
    </script>
</body>

</html>