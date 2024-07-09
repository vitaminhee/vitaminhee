<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>
<script type="text/javascript">
$(function() {
	// event 처리
	$(".dataRow").click(function() {
		//alert("dataRow click");
	});
	
	// 주석된 코드: .dataRow 안에서 .grade 또는 .status 요소를 클릭할 때 실행
	// $(".dataRow").on("click", ".grade, .status", function() { 
	//     alert("dataRow 안에 select click");
	// });
	
	// .dataRow 안에서 .grade 또는 .status 요소의 값이 변경될 때 실행
	$(".dataRow").on("change", ".grade, .status", function() {
		//alert("값이 바뀜");
		// this - select 태그 선택. next()는 다음 태그 : 현재에 있는 건 div 태그
		// 버튼이 div 태그 안에 있는 button 태그를 찾자
		// disabled이 없으면 false로 지정
		$(this).next().find("button").prop("disabled", false);
	});
});
</script>

</head>
<body>
<div class="container">
	<h2>회원 리스트</h2>
	<table class="table">
		<thead>
			<tr>
				<th>사진</th>
				<th>아이디</th>
				<th>이름</th>
				<th>성별</th>
				<th>생년월일</th>
				<th>연락처</th>
				<th>등급</th>
				<th>상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="vo">
				<tr class="dataRow">
					<td>
						<c:if test="${ !empty vo.photo }">
							<img src="${vo.photo }" style="width: 30px; height: 30px;">
						</c:if>
						<c:if test="${ empty vo.photo }">
							<i class="fa fa-user-circle-o" style="font-size:30px"></i>
						</c:if>
					</td>
					<td class="id">${vo.id }</td>
					<td>${vo.name }</td>
					<td>${vo.gender }</td>
					<td>${vo.birth }</td>
					<td>${vo.tel }</td>
					<td>
						<form action="changeGrade.do">
						<div class="input-group mb-3">
						  <select class="form-control grade" name="gradeNo">
						  <!-- 일반 회원, 관리자에 대한 옵션.. -->
						  <option value="1" ${(vo.gradeNo == 1) ?"selected":"" }>일반회원</option> <!-- 1이면 붙이고 아니면 붙이지 말자. -->
						  <option value="9" ${(vo.gradeNo == 9) ?"selected":""}>관리자</option>
						  </select>
						  <div class="input-group-append"> <!-- 뒤에 붙이기 -->
						    <button class="btn btn-success" type="submit" disabled>변경</button>
						    <!-- disabled -  버튼 동작을 못해서 데이터가 못 넘어가게-->
						  </div>
						</div>
						</form>
					</td>
					
					<td>
						<form action="changeStatus.do">
						<div class="input-group mb-3">
						  <select class="form-control status" name="status">
						  <!-- value 값과 보여지는 값이 같으면 생략 가능. -->
						  <option value="1" ${(vo.status == "정상") ?"selected":"" }>정상</option>
						  <option value="9" ${(vo.status == "탈퇴") ?"selected":""}>탈퇴</option>
						   <option value="9" ${(vo.status == "휴면") ?"selected":""}>휴면</option>
						    <option value="9" ${(vo.status == "강퇴") ?"selected":""}>강퇴</option>
						  </select>
						  <div class="input-group-append"> <!-- 뒤에 붙이기 -->
						    <button class="btn btn-success" type="submit" disabled>변경</button>
						  </div>
						</div>
						</form>
					</td>
					
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>