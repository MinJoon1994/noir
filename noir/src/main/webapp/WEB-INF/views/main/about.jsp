<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>

<style>
/* 전체 레이아웃 정리 */
section {
  padding: 60px 20px;
  text-align: center;
  margin-bottom:100px;
}

.section1 {
  width:80%;
  margin-right:auto;
  margin-left:auto;
  position: relative;
  background-image: url('<c:url value="/resources/image/about/background1.png"/>');
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  color: white;
  padding: 100px 30px;
  text-align: center;
  z-index: 1;
  overflow: hidden;
}

/* 어두운 오버레이 */
.section1::before {
  content: '';
  position: absolute;
  top: 0; left: 0; right: 0; bottom: 0;
  background-color: rgba(0, 0, 0, 0.5);  /* 어두운 반투명 오버레이 */
  z-index: 0;
}

.section1 * {
  position: relative;
  z-index: 2;
}

.section2 {
  width:80%;
  margin-right:auto;
  margin-left:auto;
  position: relative;
  background-image: url('<c:url value="/resources/image/about/background2.png"/>');
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  color: white;
  padding: 100px 30px;
  text-align: center;
  z-index: 1;
  overflow: hidden;
}

/* 어두운 오버레이 */
.section2::before {
  content: '';
  position: absolute;
  top: 0; left: 0; right: 0; bottom: 0;
  background-color: rgba(0, 0, 0, 0.5);  /* 어두운 반투명 오버레이 */
  z-index: 0;
}

.section2 * {
  position: relative;
  z-index: 2;
}

.about-header h1 {
  font-size: 2.8rem;
  font-weight: bold;
  margin-bottom: 50px;
  color: white;
}

.about-header p {
  font-size: 1.2rem;
  color: white;
}


.about-team h2,
.about-location h2 {
  font-size: 2rem;
  margin-bottom: 20px;
  color: #2c2c2c; /* 포인트 컬러 */
}

.about-philosophy h2{
  font-size: 2rem;
  margin-bottom: 20px;
  color: whtie; /* 포인트 컬러 */
}

.about-philosophy p {
  font-size: 1.1rem;
  line-height: 1.6;
  max-width: 800px;
  margin: 0 auto;
  color: white;
}

/* 팀 멤버 그리드 */
.team-grid {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 40px;
  margin-top: 40px;
}

.team-member {
  width: 200px;
  text-align: center;
}

.team-member img {
  width: 100%;
  height: auto;
  border-radius: 12px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
  object-fit: cover;
}

.team-member h3 {
  margin-top: 12px;
  font-size: 1.2rem;
  color: #333;
}

.team-member p {
  font-size: 0.95rem;
  color: #777;
}

/* 위치 섹션 */
.about-location p {
  font-size: 1rem;
  color: #444;
  line-height: 1.5;
}

#map {
  margin-top: 20px;
  width: 100%;
  height: 300px;
  background-color: #eee;
  border-radius: 8px;
}

/* 반응형 대응 */
@media (max-width: 768px) {
  .team-grid {
    flex-direction: column;
    align-items: center;
  }

  .team-member {
    width: 80%;
  }
}

.fade-up {
  opacity: 0;
  transform: translateY(50px);
  transition: opacity 1.2s ease-out, transform 1.2s ease-out;
}

.fade-up.show {
  opacity: 1;
  transform: translateY(0);
}

.section3{
	width:80%;
	margin-right:auto;
	margin-left:auto;
}
</style>

<section class="about-header section1 fade-up">
  <h1>About NOIR</h1>
  <p>
    NOIR는 1998년, 서울 강남의 조용한 골목 한 켠에서 단 6개의 테이블로 시작되었습니다.<br>
    당시 스물일곱의 젊은 셰프 박세진은, 매일 새벽마다 시장을 돌며 직접 식재료를 고르고, 손님 한 사람 한 사람을 위한 메뉴를 만들었습니다.<br><br>

    그렇게 시작된 NOIR는 오랜 시간 동안 한결같은 철학을 지켜왔습니다. 화려한 기술보다 기본에 충실한 조리, 시선을 사로잡기보다 마음을 움직이는 플레이팅,<br>
    그리고 무엇보다 ‘맛’이 남기는 여운에 집중합니다.<br><br>

    NOIR는 단순한 식사를 넘어, 한 사람의 하루를 위한 가장 조용하고 깊은 쉼표가 되기를 바랍니다.<br>
    당신의 시간이 천천히 흐르는 이곳에서, 미각과 감각, 그리고 기억에 오래 남을 순간을 경험해보세요.
  </p>
</section>

<section class="about-team fade-up">
  <h2>Meet Our Team</h2>
  <div class="team-grid">
    
    <div class="team-member">
      <img src="${contextPath}/resources/image/about/박세진 셰프.png" alt="박세진 셰프">
      <h3>박세진</h3>
      <p>Executive Chef</p>
    </div>
    
    <div class="team-member">
      <img src="${contextPath}/resources/image/about/이도윤 셰프.png" alt="박세진 셰프">
      <h3>이도윤</h3>
      <p>Chef de Cuisine</p>
    </div>
    
    <div class="team-member">
      <img src="${contextPath}/resources/image/about/클레어 마르탱 셰프.png" alt="박세진 셰프">
      <h3>클레어 마르탱</h3>
      <p>Sous Chef</p>
    </div>
    
    <div class="team-member">
      <img src="${contextPath}/resources/image/about/소피아밀러 총지배인.png" alt="박세진 셰프">
      <h3>소피아 밀러</h3>
      <p>General Manager</p>
    </div>
    
    <div class="team-member">
      <img src="${contextPath}/resources/image/about/다니엘 로페즈 소믈리에.png" alt="박세진 셰프">
      <h3>다니엘 로페즈</h3>
      <p>Head Sommelier</p>
    </div>
  </div>
</section>

<section class="about-philosophy section2 fade-up">

  <h2>Our Philosophy</h2>
  <p>
    NOIR는 요리를 단순한 음식 그 이상으로 여깁니다.<br>
    우리는 매일 새벽, 가장 신선하고 제철에 맞는 식재료를 직접 선별하여 그날의 메뉴를 구성합니다.<br>
    이는 일관된 맛보다는 매 순간 살아 숨 쉬는 ‘오늘’의 요리를 위한 철학입니다.
  </p>
  <br>
  <p>
    각각의 접시는 단순한 플레이팅을 넘어 하나의 이야기이자 감정입니다.<br>
    색과 질감, 온도와 향까지 – 오감을 자극하며, 당신의 기억 속에 오래도록 머무는 한 장면이 되기를 바랍니다.
  </p>
  <br>
  <p>
    우리는 당신의 저녁이 단순히 ‘맛있는’ 시간이 아닌, 느긋하게 삶을 음미하는 시간이 되기를 소망합니다.<br>
    그렇게 한 끼가, 하루를 바꾸는 조용한 울림이 될 수 있도록.
  </p>
  
</section>



<section class="about-location section3 fade-up">
  <h2>Location & hour</h2>
  <p>서울시 강남구 어딘가 123-45</p><br>
  <p>𝐋𝐮𝐧𝐜𝐡 : 𝟏𝟐:𝟑𝟎 ~ 𝟏𝟒:𝟓𝟎</p>
  <p>𝐛𝐫𝐞𝐚𝐤 : 𝟏𝟒:𝟓𝟎 ~ 𝟏𝟖:𝟑𝟎</p>
  <p>𝐝𝐢𝐧𝐧𝐞𝐫 : 𝟏𝟖:𝟑𝟎 ~ 𝟐𝟐:𝟎𝟎</p>
  
  <div id="map" style="margin-top:50px;">
  	<div id="kakaoMap-bottom">
		<div id="info">
		  <strong>NOIR 누아르</strong><br>
		</div>
		
		<div id="directions">
			<form id="routeForm" action="https://map.kakao.com/" method="get" target="_blank">
			  <input type="hidden" name="sName" value="출발지 입력"> <!-- 출발지 이름 -->
			  <input type="hidden" name="eName" value="강남역">  <!-- 도착지 이름 -->
			  <input type="hidden" name="eX" value="127.027610">  <!-- 도착지 경도 -->
			  <input type="hidden" name="eY" value="37.498095">   <!-- 도착지 위도 -->
			  <button type="submit">길찾기</button>
			</form>
		</div>
	</div>
  </div>
</section>

<!-- 카카오 지도 API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0daab6c6c751704fe920d4bc06ea282d&libraries=services"></script>
<script>
	var container = document.getElementById('map');
	var options = {
	  center: new kakao.maps.LatLng(37.498095, 127.027610), 
	  level: 3
	};
	// 지도를 해당 좌표 중심으로 생성
	var map = new kakao.maps.Map(container, options);
	
	// 지도/스카이뷰 전환 버튼을 오른쪽 상단에 표시
	var mapTypeControl = new kakao.maps.MapTypeControl();
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
	// 줌 인/아웃 버튼을 오른쪽에 표시
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	// 마커 표시
	var marker = new kakao.maps.Marker({
	  position: new kakao.maps.LatLng(37.498095, 127.027610),
	  map: map
	});
	
	// 마커 위에 말풍선처럼 주소 정보를 보여줌
	var infowindow = new kakao.maps.InfoWindow({
	  content: '<div style="margin-left:10px; width:100%; display:flex; justify-content:center; padding:5px;font-size:14px; text-align:center;"><p>누아르 | NOIR</p></div>'
	});
	infowindow.open(map, marker);
</script>

<script>
//메인 페이지 페이드아웃 -> 페이드 인 적용 익명 함수
const observer = new IntersectionObserver(entries => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('show');
        observer.unobserve(entry.target); // 한 번만 실행
      }
    });
  }, { threshold: 0.2 });

  document.querySelectorAll('.fade-up').forEach(section => {
    observer.observe(section);
  });
</script>