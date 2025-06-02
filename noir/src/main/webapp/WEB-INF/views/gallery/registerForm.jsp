<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>

<style>
/* 기본 스타일 */
body {
  font-family: 'Noto Sans KR', sans-serif;
  background: #fff;
  color: #111;
}

.photoForm-container{
	width:50%;
	margin-left:auto;
	margin-right:auto;	
}

form#uploadForm {
  max-width: 600px;
  margin: 40px auto;
  background: #fff;
  border: 1px solid #ddd;
  padding: 30px;
  border-radius: 10px;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
}

.form-title {
  text-align: center;
  font-size: 24px;
  font-weight: 600;
  color: #111;
  margin-bottom: 30px;
  border-bottom: 2px solid #eee;
  padding-bottom: 10px;
}

.form-group {
  margin-bottom: 20px;
}

label {
  font-weight: 500;
  display: block;
  margin-bottom: 6px;
  color: #333;
}

input[type="file"],
select {
  width: 100%;
  padding: 10px;
  border: 1px solid #bbb;
  border-radius: 6px;
  background: #fafafa;
  font-size: 14px;
}

.preview-img {
  max-width: 100%;
  border: 1px solid #ccc;
  border-radius: 6px;
  padding: 6px;
  display: none;
}

/* 버튼 */
.btn-submit {
  background-color: #111;
  color: #fff;
  padding: 12px 20px;
  font-size: 15px;
  border: none;
  border-radius: 6px;
  cursor: pointer;
  transition: 0.3s;
}

.btn-submit:hover {
  background-color: #5A2A7C; /* 포인트 컬러 */
  color: #fff;
}

/* 센터 정렬 */
.text-center {
  text-align: center;
}
</style>

<div class="photoForm-container">
	<h2 class="form-title">📸 Noir 사진 등록</h2>
	
	<form id="uploadForm" action="${contextPath}/gallery/upload.do"
	      method="post" enctype="multipart/form-data">
	
	  <div class="form-group">
	    <label for="photoFile">사진 파일 업로드</label>
	    <input type="file" id="photoFile" name="photoFile" accept="image/*" required onchange="previewImage(this)">
	  </div>
	
	  <div class="form-group">
	    <label for="photoType">사진 분류</label>
	    <select name="photoType" id="photoType" required>
	      <option value="">선택하세요</option>
	      <option value="MENU">메뉴 사진</option>
	      <option value="STAFF">직원 사진</option>
	      <option value="RESTAURANT">식당 사진</option>
	    </select>
	  </div>
	
	  <div class="form-group">
	    <label>미리보기</label><br/>
	    <img id="preview" src="" alt="미리보기" class="preview-img">
	  </div>
	
	  <div class="form-group text-center">
	    <button type="submit" class="btn-submit">사진 등록</button>
	  </div>
	
	</form>
</div>
<script>
function previewImage(input) {
  const preview = document.getElementById("preview");
  const file = input.files[0];

  if (file) {
    const reader = new FileReader();
    reader.onload = function(e) {
      preview.src = e.target.result;
      preview.style.display = 'block';
    }
    reader.readAsDataURL(file);
  } else {
    preview.src = '';
    preview.style.display = 'none';
  }
}

</script>
