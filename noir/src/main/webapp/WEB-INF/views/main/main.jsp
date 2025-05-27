<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>

<style>
body {
  font-family: 'Noto Sans KR', sans-serif;
  margin: 0;
  padding: 0;
  background-color: #fff;
}

.main_image {
  margin: 0 auto;
  width: 80%;
  height: auto;
  display: block;
  filter: grayscale(100%);
  transition: filter 0.5s ease, transform 0.5s ease;
  border-radius: 6px;
}

.main_image:hover {
  filter: grayscale(0%);
  transform: scale(1.03); /* 너무 튀지 않게 약간만 확대 */
  z-index: 1;
}

.intro-section {
  text-align: center;
  padding: 50px 20px;
  margin-bottom:150px;
}

.intro-section h1 {
  font-size: 2.5em;
  margin-bottom: 10px;
}

.intro-section p {
  font-size: 1.1em;
  color: #555;
}

.reserve-btn {
  margin-top: 30px;
  padding: 15px 40px;
  font-size: 1em;
  background-color: black;
  color: white;
  border: none;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.reserve-btn:hover {
  background-color: #444;
}

.main_food_container {
  margin-left: auto;
  margin-right: auto;
  display: flex;
  width: 80%;
  height: 400px; /* 원하는 높이로 조정 */
  gap:10px;
  overflow: hidden;
  margin-top: 50px;
  margin-bottom: 150px;
}

.main_food_img {
  flex: 1;
  width: 100%;
  height: 100%;
  object-fit: cover;
  filter: grayscale(100%);
  transition: filter 0.4s ease, transform 0.4s ease;
  border-radius: 4px;
}

.main_food_img:hover {
  filter: grayscale(0%);
  transform: scale(1.05); /* 살짝 확대 */
  z-index: 1; /* 위로 올라오게 */
}

.about_section {
  background-color: #f9f9f9;
  padding: 60px 20px;
}

.about_inner {
  max-width: 1200px;
  margin: 0 auto;
  display: flex;
  align-items: center;
  gap: 40px;
  flex-wrap: wrap;
}

.about_image_wrapper {
  flex: 1;
  min-width: 300px;
}

.about_image {
  width: 100%;
  aspect-ratio: 3 / 4;
  object-fit: cover;
  border-radius: 8px;
  box-shadow: 0 0 10px rgba(0,0,0,0.1);
}

.about_text {
  flex: 2;
  min-width: 300px;
  text-align: left;
}

.about_text h2 {
  font-size: 2em;
  margin-bottom: 20px;
  font-weight: bold;
}

.about_text p {
  font-size: 1.1em;
  line-height: 1.8;
  color: #444;
}


.noir_background {
  margin-right:auto;
  margin-left:auto;
  position: relative;
  filter: grayscale(100%);
  width: 80%;
  height: 80vh;
  overflow: hidden;
  margin-bottom:150px;
}

.noir_scene {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;
  opacity: 0;
  transition: opacity 1.5s ease-in-out;
  z-index: 0;
}

.noir_scene.show {
  opacity: 1;
  z-index: 1;
}

</style>

<div class="main_food_container">
  <img class="main_food_img" src="${contextPath}/resources/image/main_food1.png" alt="Food 1">
  <img class="main_food_img" src="${contextPath}/resources/image/main_food2.png" alt="Food 2">
  <img class="main_food_img" src="${contextPath}/resources/image/main_food3.png" alt="Food 3">
  <img class="main_food_img" src="${contextPath}/resources/image/main_food4.png" alt="Food 4">
  <img class="main_food_img" src="${contextPath}/resources/image/main_food5.png" alt="Food 5">
</div>

<!-- 소개 + 예약 버튼 -->
<div class="intro-section">
  <h1>Welcome to NOIR</h1>
  <p>도심 속 고요함과 미각의 향연, 파인 다이닝 레스토랑 NOIR에 오신 것을 환영합니다.</p>
  <form action="${contextPath}/reservation" method="get">
    <button type="submit" class="reserve-btn">예약하러 가기</button>
  </form>
</div>


<!-- 이미지 영역 -->
<img class="main_image" src="${contextPath}/resources/image/main_page1.png" alt="Main Image">


<!-- 예약 버튼 아래에 추가 -->
<div class="about_section">
  <div class="about_inner">
    <div class="about_image_wrapper">
      <img src="${contextPath}/resources/image/main_page2.png" alt="About Noir" class="about_image">
    </div>
    <div class="about_text">
      <h2>NOIR의 이야기</h2>
      <p>
        NOIR는 1998년 서울의 작은 골목에서 단 6개의 테이블로 시작되었습니다.<br>
        미쉐린 셰프 ‘라상 블랙’의 철학 아래, 매일 새벽마다 직접 고른 식재료만을 사용합니다.<br>
        우리는 한 끼 식사가 아닌, 당신의 하루를 위한 조용한 쉼표를 준비합니다.<br>
        맛과 분위기, 그리고 시간을 담아낸 공간. 그것이 바로 NOIR입니다.
      </p>
    </div>
  </div>
</div>


<div class="noir_background">
  <img src="${contextPath}/resources/image/main_image1.png" class="noir_scene show">
  <img src="${contextPath}/resources/image/main_image2.png" class="noir_scene">
  <img src="${contextPath}/resources/image/main_image3.png" class="noir_scene">
  <img src="${contextPath}/resources/image/main_image4.png" class="noir_scene">
  <img src="${contextPath}/resources/image/main_image5.png" class="noir_scene">
</div>

<script>
const scenes = document.querySelectorAll('.noir_scene');
let currentScene = 0;

setInterval(() => {
  scenes[currentScene].classList.remove('show');
  currentScene = (currentScene + 1) % scenes.length;
  scenes[currentScene].classList.add('show');
}, 3500); // 5초마다 장면 변경

</script>