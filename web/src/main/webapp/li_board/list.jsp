<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 라이브러리 등록 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style type="text/css">
.dataRow:hover {
background: #ddd;
cursor: pointer;
}
</style>

<script type="text/javascript">
$(function () { // 페이지가 로드되었을 때 실행되는 함수
	
	
	// event 처리
	// .dataRow 클래스를 가진 요소를 클릭했을 때 실행.
	$(".dataRow").click(function() { //class를 찾아야해서
	
		alert("click"); //data가 잘 실행되는지 확인
	
	// 글 번호 찾기
	// 클릭된 .dataRow 요소 내에서 .no 클래스를 가진 자식 요소의 텍스트를 찾기
	let no = $(this).find(".no").text();
		
	alert("no=" + no); // 찾은 글 번호를 확인
	
	// 글 보기로 페이지 이동
	// 찾은 글 번호를 파라미터로 포함하여 view.jsp 페이지로 이동
	location = "view.jsp?no=" +no + "&inc=1";
	
	});
});
</script>

</head>
<body>
<div class="container"> <!-- 가운데 정렬 -->
<h3>일반 게시판 리스트</h3>
<!-- 데이터가 있는 만큼 리스트 만들기 -->
<ul class="list-group">
<!-- tag 안에 data-** 속성을 이용하여 데이터를 저장해놓을 수 있다. 
선택객체.data("no"); 번호를 받아올 수 있다-->
<!-- class가 따로따로 동작 -->
  <li class="list-group-item dataRow" data-no="10"> 
  <!-- 경계션의 색상 땜시 div -->
  <div style="padding-bottom: 3px; border-bottom: 1px dotted #aaa;
  margin-bottom: 3px;"> 
  <!-- 뱃지 오른쪽 정렬. 조회수 -->
  <span class="badge badge-secondary float-right">10</span>
  <b><span class="no">10</span>. 자바란?</b> <!-- b:굵. 데이터 안에 클래스. 글 번호를 가져옴-->
  <!--  안에 있는 데이터를 찾아보는 find를 사용한다. -->
  </div>
  <span class="float-right">2024.06.13</span>
  <p>이영환</p>
  </li> <!-- 데이터 한줄 -->
  
  <li class="list-group-item dataRow" data-no="9"> 
  <!-- 경계션의 색상 땜시 div -->
  <div style="padding-bottom: 3px; border-bottom: 1px dotted #aaa;
  margin-bottom: 3px;"> 
  <!-- 뱃지 오른쪽 정렬. 조회수 -->
  <span class="badge badge-secondary float-right">15</span>
  <b><span class="no">9</span>. 키오스크 과정</b> <!-- b:굵. 데이터 안에 클래스. 글 번호를 가져옴-->
  <!--  안에 있는 데이터를 찾아보는 find를 사용한다. -->
  </div>
  <span class="float-right">2024.06.10</span>
  <p>관리자</p>
  </li> <!-- 데이터 한줄 -->
  
</ul> 
</div>
</body>
</html>