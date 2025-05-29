<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>

<div class="wine-container">
<!-- 와인 리스트 페이지 -->
<div class="menu-header fade-up">
  <div class="menu-categories">
    <a class="category-link" href="${contextPath}/menu/list.do?menuType=lunch">lunch</a>
    <a class="category-link" href="${contextPath}/menu/list.do?menuType=dinner">dinner</a>
    <a class="category-link" href="${contextPath}/menu/list.do?menuType=vegan">vegan</a>
    <a class="category-link" href="${contextPath}/menu/winelist.do">winelist</a>
  </div>
</div>
  
<div class="icon_box fade-up" style="margin-top:50px;">
	<img src="${contextPath}/resources/image/noir_icon.png"/>
</div>

	  <c:forEach var="wine" items="${wineList}">

		  <div id="menuList" class="menu-list">
		      <div class="wine-item fade-up">${wine.wine_name}</div>
		      <div class="wine-item-choice fade-up">${wine.wine_type}</div>
		      <div class="wine-item-choice fade-up">${wine.region}</div>
		      <div class="wine-item-choice fade-up">${wine.vintage}</div>
		      <div class="wine-item-choice fade-up">${wine.producer}</div>
		      <div class="wine-item-choice fade-up">${wine.bottle_size}</div>
		      <div class="wine-item-choice fade-up">${wine.description}</div>
		      <div class="wine-item-choice fade-up">${wine.wine_category}</div>
		      <div class="wine-item-price fade-up">
		      	KRW <fmt:formatNumber value="${wine.price}" type="number" groupingUsed="true"/>
		      </div>
		  </div>
	  </c:forEach>
  

</div>
<style>
.wine-container {
  max-width: 900px;
  margin: 0 auto;
  padding: 60px 20px;
}

.menu-header {
  display: flex;
  justify-content: center;
  align-items: center;
  padding-bottom: 10px;
  margin-bottom: 40px;
}

.menu-categories {
  display: flex;
  gap: 20px;
  margin-bottom:30px;
}

.category-link {
  text-decoration: none;
  color: #452160;
  font-weight: bold;
  font-size: 16px;
  transition: color 0.3s;
}
.category-link:hover {
  color: #000;
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

.icon_box{
  display:flex;
  justify-content:center;
}

.icon_box img{
	width:50px;
	height:50px;
}
</style>

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
