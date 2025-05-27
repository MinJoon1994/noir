<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<script type="text/javascript">

</script>

<style>
.slim-header {
  background-color: white;
  border-bottom: 1px solid #ddd;
  padding: 10px 30px;
}

.slim-nav-container {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.slim-nav a {
  margin-right: 20px;
  color: #333;
  text-decoration: none;
  font-size: 0.95rem;
  letter-spacing: 1px;
  transition: color 0.3s;
}

.slim-nav a:hover {
  color: #5A2A7C;
}

.slim-brand {
  display: flex;
  align-items: center;
}

.slim-brand-icon {
  width: 24px;
  height: 24px;
  margin-right: 8px;
}

.slim-brand-name {
  font-size: 1.1rem;
  font-weight: bold;
  letter-spacing: 1px;
  color: #222;
}

.main_title{
	text-decoration:none;
	color: black;
}

.main_title:hover{
	color: black;
}
</style>
<body>


<header class="slim-header">
  <div class="slim-nav-container">
  
  	<!-- 왼쪽 브랜드 -->
    <div class="slim-brand">
      <img class="slim-brand-icon" src="${contextPath}/resources/image/noir_icon.png" alt="NOIR Icon">
      <span class="slim-brand-name"><a href="${contextPath}/main.do" class="main_title">NOIR</a></span>
    </div>
  
    <!-- 오른쪽 메뉴 -->
    <nav class="slim-nav">
      <a href="<c:url value='/about.do'/>">ABOUT</a>
      <a href="<c:url value='/menu.do'/>">MENU</a>
      <a href="<c:url value='/reservation/form.do'/>">RESERVATION</a>
      <a href="<c:url value='/gallery.do'/>">GALLERY</a>
      <a href="<c:url value='/mypage.do'/>">MYPAGE</a>
      <a href="<c:url value='/review.do'/>">REVIEW</a>
    </nav>

  </div>
</header>


</body>
</html>






