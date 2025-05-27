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
    header {
        background-color: white;
        color: black;
        padding: 30px 50px 10px 50px;
        text-align: center;
        position: relative;
    }

    .header-container {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .header-left,
    .header-right {
        width: 20%;
        display: flex;
        align-items: center;
        justify-content: flex-start;
        gap: 20px;
    }

    .header-right {
        justify-content: flex-end;
    }

    .header-center {
        width: 60%;
        text-align: center;
    }

    .brand {
        font-size: 2rem;
        font-weight: bold;
        letter-spacing: 2px;
    }

    .brand-sub {
        font-size: 1rem;
        margin-top: 5px;
        color: #aaa;
    }

    nav {
        margin-top: 20px;
    }

    nav a {
        margin: 0 15px;
        color: black;
        text-decoration: none;
        font-size: 0.95rem;
        letter-spacing: 1px;
    }

    nav a:hover {
        color: #5A2A7C; /* 퍼플 강조 */
    }

    .divider {
        height: 2px;
        background: #5A2A7C; /* 강조용 퍼플 라인 */
        margin-top: 20px;
    }

    .header-link {
        color: black;
        text-decoration: none;
        font-size: 0.9rem;
    }

    .header-link:hover {
        color: #5A2A7C;
    }
    
    .brand-icon{
    	width:30px;
    	height:30px;
    	margin-right:5px;
    	padding:5px;
    }
</style>
<body>


<header>
    <div class="header-container">
        <!-- 왼쪽: 로그인/회원가입 -->
        <div class="header-left">
			<a href="#" class="header-link">Instagram</a>
        </div>

        <!-- 가운데: 브랜드 -->
        <div class="header-center">
        	<img class="brand-icon" src="${contextPath}/resources/image/noir_icon.png">
            <div class="brand">NOIR</div>
            <div class="brand-sub">누아르</div>
        </div>

        <!-- 오른쪽: SNS (아이콘은 추후 이미지나 font-awesome으로 대체 가능) -->
        <div class="header-right">
            <a href="<c:url value='/login.do'/>" class="header-link">로그인</a>
            <a href="<c:url value='/register.do'/>" class="header-link">회원가입</a>
        </div>
    </div>

    <!-- 메뉴 네비게이션 -->
    <nav>
        <a href="<c:url value='/about.do'/>">ABOUT</a>
        <a href="<c:url value='/menu.do'/>">MENU</a>
        <a href="<c:url value='/reservation/form.do'/>">RESERVATION</a>
        <a href="<c:url value='/gallery/list.do'/>">GALLERY</a>
        <a href="<c:url value='/gift.do'/>">MYPAGE</a>
        <a href="<c:url value='/gift.do'/>">REVIEW</a>
    </nav>

    <!-- 강조용 퍼플 라인 -->
    <div class="divider"></div>
</header>
</body>
</html>






