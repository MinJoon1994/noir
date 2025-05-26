<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>  


  <style>
    #kakaoMap-container {
    	width: 70%;
    	margin: 0 auto;
    }
    #map {
        width: 100%;
        height: 500px;
    }
    #kakaoMap-bottom {
        display: flex;
        justify-content: space-between;
    }
    #info {
        padding: 10px;
        font-size: 16px;
        margin-top: 10px;
    }
    #directions {
        margin-top: 10px;
    }
    #directions button {
		padding: 8px 20px;
		font-size: 16px;
		background-color: black;
		color: white;
		border: none;
		cursor: pointer;
    }
  </style>
  



<div id="kakaoMap-container">
	<h2 style="text-align:center;">찾아오시는길</h2>
	<div id="map"></div>
	
	<div id="kakaoMap-bottom">
		<div id="info">
		  <strong>서울대공원</strong><br>
		  <span>주소: 13829 경기 과천시 막계동 359</span>
		</div>
		
		<div id="directions">
		  <form id="routeForm" action="https://map.kakao.com/" method="get" target="_blank">
		    <input type="hidden" name="sName" value="출발지 입력"> <!-- 출발지 이름 -->
		    <input type="hidden" name="eName" value="서울대공원">  <!-- 도착지 이름 -->
		    <input type="hidden" name="eX" value="127.005987">  <!-- 도착지 경도 -->
		    <input type="hidden" name="eY" value="37.429934">   <!-- 도착지 위도 -->
		    <button type="submit">길찾기</button>
		  </form>
		</div>
	</div>
	<!-- 카카오 지도 API -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0daab6c6c751704fe920d4bc06ea282d&libraries=services"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
		  center: new kakao.maps.LatLng(37.429934, 127.005987), // 서울대공원
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
		  position: new kakao.maps.LatLng(37.429934, 127.005987),
		  map: map
		});
		
		// 마커 위에 말풍선처럼 주소 정보를 보여줌
		var infowindow = new kakao.maps.InfoWindow({
		  content: '<div style="padding:5px;font-size:14px;">서울대공원<br>경기 과천시 막계동 359</div>'
		});
		infowindow.open(map, marker);
	</script>
</div>





   
   