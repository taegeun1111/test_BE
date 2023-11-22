<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>Mountain-Do</title>
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
                  <c:if test="${login == null}">
                    <a href="/account/sign-in" class="gobtn">
                      스탬프 찍으러 가기
                      <img src="/assets/jpg/than.png" alt="">
                    </a>
                  </c:if>
                  <c:if test="${login != null}">
                    <a href="/event/stamp" class="gobtn">
                      스탬프 찍으러 가기
                      <img src="/assets/jpg/than.png" alt="">
                    </a>
                  </c:if>

                
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
      <!-- 오늘의 날씨 -->
      <!-- 2번째 영역 -->
      <section class="second-warpper">

        <section class="sec1-container">
          <div class="weather-wrap">
            <div class="weather-today-wrapper">
              <a class="region">
                <select name="weatherList" id="weather-list">
                  <option value="none">=== 선택 ===</option>
                </select>
                  <%--지역을 고를 있게 해줌--%>
              </a>
              <div class="weather-main">
                <div class="weather-icon"></div>
<%--                <img src="/assets/jpg/sunny.png" alt="">--%>
                <div class="weather-now"></div>
              </div>
              <div class="weather-detail-wrapper">
                <div class="weather-detail wind"></div>
                <div class="weather-detail humidity"></div>
<%--                <div class="weather-detail">구름 : 0m/s</div>--%>
              </div>
<%--              <div class="etc">※현재 온도는 기상청 1시간 기준으로 갱신됩니다.</div>--%>
            </div>
<%--             이하는 산악기상 --%>
            <div class="weather-mountain-wrapper">
              <a class="region" id="region-mountain">
<%--                <select name="regionList" id="region-list">--%>
<%--                  <option value="none">=== 선택 ===</option>--%>
<%--                </select>--%>
              </a>
              <div class="weather-main">
                <div class="weather-icon">
                  <img src="/assets/jpg/mountainicon.png" alt="">
                </div>
                <div class="weather-now" id="mountain-temp"></div>

              </div>
              <div class="weather-detail-wrapper">
                <div class="weather-detail" id="mountain-wind"></div>
                <div class="weather-detail" id="mountain-humidity"></div>

              </div>
<%--              <div class="etc">※현재 온도는 기상청 1시간 기준으로 갱신됩니다.</div>--%>
            </div>
          </div>
        </section>

      </section>
    </div>
  </div>
</body>
<script>
  // 쿠키 문자열을 가져옴
  const cookieString = document.cookie;
  console.log(cookieString)
  // 쿠키를 파싱하여 객체로 변환
  const cookies = cookieString
          .split(';')
          .map(cookie => cookie.trim().split('='))
          .reduce((acc, [key, value]) => ({ ...acc, [key]: value }), {});

  // 특정 쿠키의 값을 가져오기
  const sessionId = cookies.SESSIONID; // 여기서 'SESSIONID'는 예시일 수 있으며 실제 사용 중인 쿠키의 키여야 합니다.

  console.log(sessionId);

  // 날씨 API 호출을 위한 요청 URL 구성
  const apiUrl = "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst"; //초단기실황
  const apiUrl2 = "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst"; //단기예보조회
  <%--var serviceKey = '<%= getProperty("my.service.key") %>';--%>
  const serviceKey = "서비스키를 입력하세요 (JP)";
  const numOfRows = 1000;
  const pageNo = 1;

  //현재 날짜.시간을 바탕으로 날씨 정보
  //현재 날짜 구하는 함수
  function currentDate(){
    const currentDate = new Date();
    const year = currentDate.getFullYear().toString(); // 연도의 마지막 2자리
    const month = (currentDate.getMonth() + 1).toString().padStart(2, "0"); // 월을 2자리로, 1자리 수는 0으로 채움
    const date = currentDate.getDate().toString().padStart(2, "0"); // 날짜를 2자리로, 1자리 수는 0으로 채움
    return year+month+date;
  }
  //현재 시간 구하는 함수
  function currentTime(){
    const currentTime = new Date();
    let hour = currentTime.getHours();
    // console.log(hour);
    let fixHour = hour-1;
    // 매시각 30분에 업데이트되기 때문에 안전하게 1시간 이전의 데이터를 활용하는 방침

    // let minute = currentTime.getMinutes()
    //
    // let fixMinute = minute - 30;
    // if(fixMinute<0){
    //   // ex. 2113에서 30분을 빼면 2043이어야 함
    //   hour-=1;
    //   fixMinute+=60;
    // }
    // console.log("fixHour: " , fixHour);
    return fixHour.toString().padStart(2,"0")+"00";
  }

  let baseDate = currentDate();
  // console.log("baseDate : ", baseDate);
  let baseTime = currentTime();
  // console.log("baseTime: ", baseTime);

  // 단기예보 적용하는 시각 구하는 함수
  function forecastTime(){
    //base time : 0200, 0500, 0800, 1100, 1400, 1700, 2000, 2300 (1일 8회 업데이트됨)
    const timeArray = ['02', '05', '08', '11', '14', '17', '20', '23']
    const currentTime = new Date();
    let hour = currentTime.getHours().toString().padStart(2,"0");

    // let hour = "00";
    // console.log("currenthour : ", hour);
    switch (hour){
      case  "00":        case  "01":        case "02" :
        hour = timeArray[7]; //전날 23시 타임을 기준으로
        break;
      case  "03":        case  "04":        case  "05":
        hour = timeArray[0];
        break;
      case  "06":        case  "07":        case  "08":
        hour = timeArray[1];
        break;
      case  "09":        case  "10":        case  "11":
        hour = timeArray[2];
        break;
      case  "12":        case  "13":        case  "14":
        hour = timeArray[3];
        break;
      case  "15":         case  "16":         case  "17":
        hour = timeArray[4];
        break;
      case  "18":         case  "19":         case  "20":
        hour = timeArray[5];
        break;
      case  "21":         case  "22":         case  "23":
        hour = timeArray[6];
        break;
    }
    // console.log("forecastTime : ", hour);
    return hour+"00";
  }

  function forecastDate(){
    baseDate = currentDate();
    if(forecastTime()==="2300"){
      return baseDate = (parseInt(baseDate) -1).toString();
    }else {
      return baseDate;
    }
  }

  let baseFcDate = forecastDate();
  // console.log("baseFcDate : ", baseFcDate);
  let baseFcTime = forecastTime();
  // console.log("baseFcTime", baseFcTime);

  // console.log(requestUrl);
  // 지역을 골라 좌푯값을 얻는 함수
  let region = [
    { "area": "서울",        "nx": 60,        "ny":127      },
    { "area": "강원",        "nx": 73,        "ny":134      },
    { "area": "경기",        "nx": 60,        "ny":120      },
    { "area": "경남",        "nx": 91,        "ny":77      },
    { "area": "경북",        "nx": 89,        "ny":91      },
    { "area": "광주",        "nx": 58,        "ny":74      },
    { "area": "대구",        "nx": 89,        "ny":90      },
    { "area": "대전",        "nx": 67,        "ny":100      },
    { "area": "부산",        "nx": 98,        "ny":76      },
    { "area": "세종",        "nx": 66,        "ny":103      },
    { "area": "울산",        "nx": 102,        "ny":84      },
    { "area": "인천",        "nx": 55,        "ny":124      },
    { "area": "전남",        "nx": 51,        "ny":67      },
    { "area": "전북",        "nx": 63,        "ny":89      },
    { "area": "제주",        "nx": 52,        "ny":38      },
    { "area": "충남",        "nx": 68,        "ny":100      },
    { "area": "충북",        "nx": 69,        "ny":107      }
  ]
  // console.log(region);
  let nx, ny;
  const baseUrl = apiUrl+`?serviceKey=`+serviceKey+`&pageNo=`+pageNo+`&numOfRows=`+numOfRows+`&dataType=JSON`+`&base_date=`+baseDate+`&base_time=`+baseTime;
  const baseFcUrl = apiUrl2+`?serviceKey=`+serviceKey+`&pageNo=`+pageNo+`&numOfRows=`+numOfRows+`&dataType=JSON`+`&base_date=`+baseFcDate+`&base_time=`+baseFcTime;

  // select 엘리먼트를 가져옵니다.
  const selectElement = document.getElementById("weather-list");

  region.forEach((item) => {
    // <option> 요소 생성
    const optionElement = document.createElement("option");

    // <option> 요소에 value와 텍스트 설정
    optionElement.value = [item.nx , item.ny];
    // console.log(optionElement.value);

    optionElement.textContent = item.area;

    // <option> 요소를 <select>에 추가
    selectElement.appendChild(optionElement);
  });
  // console.log(selectElement);


  // api에서 fetch 하는 함수
  function fetchAPI(requestUrl, requestUrl2){
    fetch(requestUrl)
            .then(response => response.json())
            .then(data => {
              // 응답 데이터 처리
              const items = data.response.body.items.item;
              // console.log(items);

              // 기온, 풍속, 습도 정보 추출
              const temperature = items.find(item => item.category === "T1H").obsrValue;
              const windSpeed = items.find(item => item.category === "WSD").obsrValue;
              const humidity = items.find(item => item.category === "REH").obsrValue;

              // // 추출한 정보 활용
              console.log("기온:", temperature);
              document.querySelector('.weather-now').textContent = temperature+'℃';
              console.log("풍속:", windSpeed);
              document.querySelector('.wind').textContent = '풍속 : '+windSpeed+'m/s';
              console.log("습도:", humidity);
              document.querySelector('.humidity').textContent  = '습도 : '+humidity+'%';
            })
            .catch(error => {
              // 에러 처리
              console.error("API 호출 중 에러가 발생했습니다:", error);
            });

    fetch(requestUrl2)
            .then(response => response.json())
            .then(data => {
              // 응답 데이터 처리
              const items = data.response.body.items.item;
              // console.log(items);

              // 신적설, 강수상태
              // const snow = items.find(item => item.category === "SNO").fcstValue;
              let sky = items.find(item => item.category === "SKY").fcstValue;
              // - 하늘상태(SKY) 코드 : 맑음(1), 구름많음(3), 흐림(4)
              let pty = items.find(item => item.category === "PTY").fcstValue;
              // 강수형태:  (단기) 없음(0), 비(1), 비/눈(2), 눈(3), 소나기(4)

              // // 추출한 정보 활용
              console.log("하늘상태:", sky);
              console.log("강수형태:", pty);
              // 이미지 요소 생성
              const img = document.createElement("img");
              const div = document.querySelector('.weather-icon');
              const hasChildren = div.hasChildNodes();
              if(hasChildren) {
                div.removeChild(div.firstChild);
              }
              let imgURL;
              // sky = "4";
              // pty="4";

              // 이미지 소스 설정
              if(pty==="0") {
                //강수형태 null
                if (sky === "1") {
                  //맑음
                  imgURL = "/assets/jpg/sunny.png";
                } else if (sky === "3") {
                  //구름
                  imgURL = "/assets/jpg/cloudy.png";
                } else if (sky === "4") {
                  //흐림
                  imgURL = "/assets/jpg/overcast.png";
                }
              } else if(pty==="1"){
                //비만 오는 경우
                imgURL = "/assets/jpg/rainy.png";
              } else if(pty==="2"){
                //비와 눈
                imgURL = "/assets/jpg/rainsnow.png";
              } else if(pty==="3") {
                //눈
                imgURL = "/assets/jpg/snowy.png";
              } else if(pty==="4") {
                //소나기
                imgURL = "/assets/jpg/heavyrain.png";
              }
              img.setAttribute("src", imgURL);
              // 이미지 요소를 div에 추가
              div.appendChild(img);

            })
            .catch(error => {
              // 에러 처리
              console.error("API 호출 중 에러가 발생했습니다:", error);
            });
  }

  // requestURL 저장하는 함수


  //웹페이지 로딩하면 랜덤으로 데이터 중 하나 골라서 날씨 보여줌
  window.addEventListener("load", function (){

    let requestUrl;
    let requestUrl2;
    //서울 setAttribute
    // (document.getElementById('weather-list').value = "60,127";
    const defaultIndex = 1;
    selectElement.options[defaultIndex].selected = true;
    // console.log(selectElement[defaultIndex].value);  //60,127

    const selectCoordinate = selectElement[defaultIndex].value.split(",");
    // console.log(selectCoordinate);

    nx = +selectCoordinate[0];
    ny = +selectCoordinate[1];

    // console.log("x좌표: ", nx);
    // console.log("y좌표: :", ny);

    requestUrl = baseUrl+`&nx=`+nx+`&ny=`+ny;
    requestUrl2 = baseFcUrl+`&nx=`+nx+`&ny=`+ny;

    // console.log(requestUrl)
    // console.log(requestUrl2)

   fetchAPI(requestUrl, requestUrl2);
  });

  selectElement.addEventListener("change", function () {

    let requestUrl;
    let requestUrl2;

    const selectedOption = this.options[this.selectedIndex];
    // console.log(selectedOption);
    // console.log(selectedOption.value);
    const selectCoordinate = selectedOption.value.split(",");
    // console.log(selectCoordinate);

    nx = +selectCoordinate[0];
    ny = +selectCoordinate[1];

    // console.log("x좌표: ", nx);
    // console.log("y좌표: :", ny);

    requestUrl = baseUrl+`&nx=`+nx+`&ny=`+ny;
    requestUrl2 = baseFcUrl+`&nx=`+nx+`&ny=`+ny;

    // console.log(requestUrl)
    // console.log(requestUrl2)

    fetchAPI(requestUrl, requestUrl2);
  });
</script>
<script>
  <%-- 산악기상 API  스크립트--%>

  // 현재 시간을 측정해 mountTime에 저장

  function currentMtTime(){
    const time = new Date();
    return time.getFullYear().toString()
            +(time.getMonth()+1).toString().padStart(2,"0")
            +time.getDate().toString()
            +time.getHours().toString().padStart(2,"0")
            +"00"
            // +time.getMinutes().toString()
    ;
  }

  const mountServiceKey = "서비스키를 입력하세요 (JP)";
  // let localArea=1;
  let mountTime=currentMtTime();


  const mountUrl = "http://apis.data.go.kr/1400377/mtweather/mountListSearch?serviceKey="
          +mountServiceKey+"&_type=json&pageNo=1&numOfRows=1000&tm="+mountTime;

  // console.log(mountUrl);


  // const mtWeather =document.querySelector('.weather-mountain-wrapper');
  const reloadTime = 7000; //7초 뒤에 다시 로딩

  mountWeather();

  window.addEventListener("load",function(){
    fetch(mountUrl)
            .then(response => response.json())
            .then(data => {
              // 응답 데이터 처리
              const items = data.response.body.items.item;

              //415개 데이터 중에 랜덤으로 하나 고름
              const index = Math.floor(Math.random()*items.length);

              document.getElementById('region-mountain').textContent = items[index].obsname;

              if(items[index].tm2m!==undefined
              &&items[index].ws2m!==undefined
              &&items[index].hm2m!==undefined) {
                document.getElementById('mountain-temp').textContent = items[index].tm2m + "°C";
                document.getElementById('mountain-wind').textContent = "풍속 : " + items[index].ws2m + "m/s";
                document.getElementById('mountain-humidity').textContent = "습도 : " + items[index].hm2m + "%";
              }else{
                document.getElementById('mountain-temp').textContent = "-"+ "°C";
                document.getElementById('mountain-wind').textContent = "풍속 : "+"-"+"m/s";
                document.getElementById('mountain-humidity').textContent = "습도 : " +"-"+ "%";
              }
            })
            .catch(error => {
              // 에러 처리
              console.error("API 호출 중 에러가 발생했습니다:", error);
            });
  });
  function mountWeather (){
    fetch(mountUrl)
            .then(response => response.json())
            .then(data => {
              // 응답 데이터 처리
              const items = data.response.body.items.item;

              //415개 데이터 중에 랜덤으로 하나 고름
              const index = Math.floor(Math.random()*items.length);
              // console.log(items[index].value)
              // if(items[index].value!=="-")
              document.getElementById('region-mountain').textContent = items[index].obsname;

              if(items[index].tm2m!==undefined
                      &&items[index].ws2m!==undefined
                      &&items[index].hm2m!==undefined) {
                document.getElementById('mountain-temp').textContent = items[index].tm2m + "°C";
                document.getElementById('mountain-wind').textContent ="풍속 : " + items[index].ws2m + "m/s";
                document.getElementById('mountain-humidity').textContent = "습도 : " +items[index].hm2m + "%";
              }else{
                document.getElementById('mountain-temp').textContent = "-"+ "°C";
                document.getElementById('mountain-wind').textContent = "풍속 : "+"-"+"m/s";
                document.getElementById('mountain-humidity').textContent = "습도 : " +"-"+ "%";
              }
            })
            .catch(error => {
              // 에러 처리
              console.error("API 호출 중 에러가 발생했습니다:", error);
            });
    setTimeout(mountWeather, reloadTime);
  }





</script>
</html>
