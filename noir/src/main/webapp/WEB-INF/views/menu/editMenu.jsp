<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>

<!-- 메뉴 수정 -->
<div class="menu-container fade-up">

  <div class="icon_box fade-up" style="margin-top:30px; margin-bottom:20px;">
	  <img src="${contextPath}/resources/image/noir_icon.png"/>
  </div>  
  
  <div class="menu-header fade-up">
  	<h1>메뉴 관리</h1>
  </div>
  
  <div class="menu-type-buttons fade-up">
    <button onclick="goEditMenu('lunch')"><strong>LUNCH</strong></button>
    <button onclick="goEditMenu('dinner')"><strong>DINNER</strong></button>
    <button onclick="goEditMenu('vegan')"><strong>VEGAN</strong></button>
    <button onclick="goEditMenu('supplement')"><strong>SUPPLEMENT</strong></button>
  </div>


  
  <c:if test="${sessionScope.member.role eq 'ADMIN'}">
    <button onclick="location.href='${contextPath}/menu/new.do?menuType=${menuType}'" class="btn-add fade-up">메뉴 추가</button>
  </c:if>
  <div class="menu-table fade-up">
  	<table>
  		<thead>
  			<tr>
  			<c:if test="${not empty menuList}">
  				<th>순서</th>
  				<th>이름</th>
  				<th>영문명</th>
  				<th>설명</th>
  				<th>기능</th>
  			</c:if>
  			<c:if test="${not empty supplementList}">
  				<th>이름</th>
  				<th>영문명</th>
  				<th>설명</th>
  				<th>타입</th>
  				<th>가격</th>
  				<th>기능</th>
  			</c:if>
  			</tr>
  		</thead>
  		<tbody>
  			<c:if test="${not empty menuList}">
  			<c:forEach var="menu" items="${menuList}" varStatus="status">
  			<tr data-id="${menu.menu_id}" data-order="${menu.menu_order}">
  				<td style="width:150px;">
  					<div style="display:flex; gap:10px; justify-content:center; align-items:center;">
	  					<div>
	  						<span class="text-mode">${menu.menu_order}</span>
	  					</div>
				        <div style="display:flex; flex-direction:column; gap:4px;">
					        <button class="btn-order-up" onclick="moveOrder(this, 'up')">▲</button>
					        <button class="btn-order-down" onclick="moveOrder(this, 'down')">▼</button>
					    </div>
				    </div>
  				</td>
  				<td><span class="text-mode">${menu.menu_name}</span><input class="edit-mode" type="text" value="${menu.menu_name}" style="display:none;"></td>
  				<td><span class="text-mode">${menu.menu_english_name}</span><input class="edit-mode" type="text" value="${menu.menu_english_name}" style="display:none;"></td>
  				<td><span class="text-mode">${menu.menu_description}</span><input class="edit-mode" type="text" value="${menu.menu_description}" style="display:none;"></td>
				<td>
					<button class="btn-edit" onclick="toggleEdit(this)">메뉴 수정</button>
					<button class="btn-photo" onclick="location.href='${contextPath}/main.do'">사진 등록</button>
				</td>
			</tr>
  			</c:forEach>
  			</c:if>
  			
  			<c:if test="${not empty supplementList}">
  			<c:forEach var="menu" items="${supplementList}" varStatus="status">
  			<tr data-id="${menu.menu_id}">
  				<td><span class="text-mode">${menu.menu_name}</span><input class="edit-mode" type="text" value="${menu.menu_name}" style="display:none;"></td>
  				<td><span class="text-mode">${menu.menu_english_name}</span><input class="edit-mode" type="text" value="${menu.menu_english_name}" style="display:none;"></td>
  				<td><span class="text-mode">${menu.menu_description}</span><input class="edit-mode" type="text" value="${menu.menu_description}" style="display:none;"></td>
  				<td><span class="text-mode">${menu.menu_type}</span><input class="edit-mode" type="text" value="${menu.menu_type}" style="display:none;"></td>
  				<td><span class="text-mode">${menu.menu_price}</span><input class="edit-mode" type="number" value="${menu.menu_price}" style="display:none;"></td>
				<td style="display:flex; width:200px; gap:5px;">
					<button class="btn-edit" onclick="toggleEdit(this)">메뉴 수정</button>
					<button class="btn-photo" onclick="location.href='${contextPath}/main.do'">사진 등록</button>					
				</td>
			</tr>
  			</c:forEach>
  			</c:if>
  		</tbody>
  	</table>
  </div>
</div>

<script>
	function goEditMenu(menuType) {
	  location.href = '${contextPath}/menu/editMenu.do?menuType=' + menuType;
	}

	function toggleEdit(button) {
	  const row = button.closest('tr');
	  const spans = row.querySelectorAll('.text-mode');
	  const inputs = row.querySelectorAll('.edit-mode');
	  const photoBtn = row.querySelector('.btn-photo'); // 사진 등록 버튼
	  const cancelBtn = row.querySelector('.btn-cancel'); // 사진 등록 버튼
	  const isEditing = button.textContent === '수정완료';

	  if (isEditing) {
	    // 수정 완료 처리 (AJAX)
	    const data = {
	      id: row.dataset.id,
	      order: inputs[0].value,
	      name: inputs[1].value,
	      englishName: inputs[2].value,
	      description: inputs[3].value,
	    };

	    if (inputs.length > 4) {
	      data.type = inputs[4].value;
	      data.price = inputs[5].value;
	    }

	    fetch('${contextPath}/menu/updateMenu', {
	      method: 'POST',
	      headers: {
	        'Content-Type': 'application/json'
	      },
	      body: JSON.stringify(data)
	    })
	    .then(res => res.json())
	    .then(result => {
	      if (result.success) {
	        alert('수정 완료!');
	        // 값 반영
	        inputs.forEach((input, i) => spans[i].textContent = input.value);
	        inputs.forEach(input => input.style.display = 'none');
	        spans.forEach(span => span.style.display = 'inline');
	        button.textContent = '메뉴 수정';

	        // 📌 사진등록 버튼 복구
	        cancelBtn.textContent = '사진 등록';
	        cancelBtn.onclick = null;
	        cancelBtn.classList.remove('btn-cancel');
	        cancelBtn.classList.add('btn-photo');
	      } else {
	        alert('수정 실패');
	      }
	    });
	  } else {
	    // 편집 모드 진입
	    inputs.forEach(input => input.style.display = 'inline');
	    spans.forEach(span => span.style.display = 'none');
	    button.textContent = '수정완료';

	    // 📌 사진등록 버튼을 '취소' 버튼으로 바꾸기
	    photoBtn.textContent = '수정 취소';
	    photoBtn.classList.remove('btn-photo');
	    photoBtn.classList.add('btn-cancel');

	    // 기존 onclick 제거하고 새로운 기능 설정
	    photoBtn.onclick = () => {
	      // 원상복구
	      inputs.forEach(input => input.style.display = 'none');
	      spans.forEach(span => span.style.display = 'inline');
	      button.textContent = '메뉴 수정';

	      photoBtn.textContent = '사진 등록';
	      photoBtn.classList.remove('btn-cancel');
	      photoBtn.classList.add('btn-photo');
	      //=======================================================================================================
	      photoBtn.onclick = null;	//사진기능 추가시 여기다가 반영
	      //=======================================================================================================
	    };
	  }
	}
	
	//이동
	function moveOrder(button, direction) {
		  const currentRow = button.closest('tr');
		  const currentId = currentRow.dataset.id;
		  const currentOrder = parseInt(currentRow.dataset.order);
				
		  let targetRow = null;

		  if (direction === 'up') {
		    targetRow = currentRow.previousElementSibling;
		  } else if (direction === 'down') {
		    targetRow = currentRow.nextElementSibling;
		  }

		  if (!targetRow || !targetRow.dataset.order) {
		    alert('이동할 수 없습니다.');
		    return;
		  }

		  const targetId = targetRow.dataset.id;
		  const targetOrder = parseInt(targetRow.dataset.order);

		  // 서버에 순서 교환 요청
		  fetch('${contextPath}/menu/swapOrder', {
		    method: 'POST',
		    headers: { 'Content-Type': 'application/json' },
		    body: JSON.stringify({
		      currentId: currentId,
		      currentOrder: currentOrder,
		      targetId: targetId,
		      targetOrder: targetOrder
		    })
		  })
		  .then(res => res.json())
		  .then(result => {
		    if (result.success) {
		      location.reload(); // 새로고침으로 정렬 다시 불러오기
		    } else {
		      alert('순서 변경 실패');
		    }
		  });
	}


	const observer = new IntersectionObserver(entries => {
	  entries.forEach(entry => {
	    if (entry.isIntersecting) {
	      entry.target.classList.add('show');
	      observer.unobserve(entry.target);
	    }
	  });
	}, { threshold: 0.2 });

	document.querySelectorAll('.fade-up').forEach(section => {
	  observer.observe(section);
	});
</script>

<style>
.menu-container {
  max-width: 80%;
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

.menu-table table {
  width: 100%;
  border-collapse: collapse;
  font-size: 14px;
}

.menu-table th, .menu-table td {
  border: 1px solid #ddd;
  padding: 10px;
  text-align: center;
}

.menu-table th {
  background-color: #452160;
  color:#fff;
  font-weight: bold;
}

.menu-table input[type="text"],
.menu-table input[type="number"],
.menu-table select {
  width: 90%;
  padding: 5px;
  font-size: 13px;
}

.menu-type-buttons {
  display: flex;
  justify-content: center;
  gap: 20px;
  margin-top: 40px;
}

.menu-type-buttons button {
  padding: 10px 24px;
  font-size: 16px;
  border: 1px solid #452160;
  background-color: white;
  color: #452160;
  border-radius: 6px;
  cursor: pointer;
  transition: 0.3s;
}

.menu-type-buttons button:hover {
  background-color: #452160;
  color: white;
}

.btn-edit{
  padding: 5px 15px;
  font-size: 16px;
  border: 1px solid #452160;
  background-color: white;
  color: #452160;
  border-radius: 6px;
  cursor: pointer;
  transition: 0.3s;
}

.btn-photo{
  padding: 5px 15px;
  font-size: 16px;
  border: 1px solid #452160;
  background-color: white;
  color: #452160;
  border-radius: 6px;
  cursor: pointer;
  transition: 0.3s;
}
.btn-cancel{
  padding: 5px 15px;
  font-size: 16px;
  border: 1px solid red;
  background-color: white;
  color: red;
  border-radius: 6px;
  cursor: pointer;
  transition: 0.3s;
}

.btn-add{
  padding: 5px 15px;
  font-size: 16px;
  border: 1px solid #452160;
  background-color: white;
  color: #452160;
  border-radius: 6px;
  cursor: pointer;
  transition: 0.3s;
  margin-bottom:20px;
  text-decoration:none;
}

.btn-order-up{
  	cursor: pointer;
	border:0px;
	background-color: white;
	color: #452160;
}

.btn-order-down{
  	cursor: pointer;
	border:0px;
	background-color: white;
	color: #452160;
}

.btn-add:hover{
  background-color: #452160;
  color: white;
}

.btn-edit:hover{
  background-color: #452160;
  color: white;
}
.btn-photo:hover{
  background-color: #452160;
  color: white;
}
.btn-cancel:hover{
  background-color: red;
  color: white;
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

