<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 게시판 리스트</title>
<style type="text/css">
/* 이곳을 주석입니다. Ctrl + Shift + C로 자동 주석 가능. 그러나 푸는 건 안된다.
	선택자 {스타일 항목 : 스타일 값;스타일 항목 : 스타일 값;...}
	기본 선택자 : a - a tag, .a - a라는 클래스(여러개), #a - a라는 아이디(한개)
	다수 선택자 : ","로 선택. a, #a : a tag와 a라는 아이디
	상태 선택자 : ":". ":hover" - 마우스가 올라갔을 때.
				 "a:hover" - a tag 위에 마우스가 올라갔을 때
	선택의 상속 : a .data - a tag 안에 data class의 태그를 찾는다.
 */
.dataRow:hover{
	opacity : 70%; /* 투명도를 변경 */
	cursor: pointer;
}
 
</style>

<script type="text/javascript">
$(function(){
	// 이벤트 처리
	$(".dataRow").click(function(){
		// alert("click");
		// 글번호 필요 - 수집
		let no = $(this).find(".no").text();
		console.log("no = " + no);
		location="view.do?no=" + no + "&inc=1&${pageObject.pageQuery}";
	});
	
	// perPageNum 처리
	$("#perPageNum").change(function(){
		// alert("change perPageNum");
		// page는 1페이지 + 검색 데이터를 전부 보낸다.
		$("#searchForm").submit();
	});
	
	// 검색 데이터 세팅
	$("#key").val("${(empty pageObject.key)?'t':pageObject.key}");
	$("#perPageNum")
		.val("${(empty pageObject.perPageNum)?'10':pageObject.perPageNum}");
});
</script>

</head>
<body>
<div class="container">
	<h2>이미지 게시판 리스트</h2>
  <form action="list.do" id="searchForm">
  	<input name="page" value="1" type="hidden">
	  <div class="row">
	  	<div class="col-md-8">
	  		<div class="input-group mb-3">
			  <div class="input-group-prepend">
			      <select name="key" id="key" class="form-control">
			      	<option value="t">제목</option>
			      	<option value="c">내용</option>
			      	<option value="w">작성자</option>
			      	<option value="tc">제목/내용</option>
			      	<option value="tw">제목/작성자</option>
			      	<option value="cw">내용/작성자</option>
			      	<option value="tcw">모두</option>
			      </select>
			  </div>
			  <input type="text" class="form-control" placeholder="검색"
			   id="word" name="word" value="${pageObject.word }">
			  <div class="input-group-append">
			      <button class="btn btn-outline-primary">
			      	<i class="fa fa-search"></i>
			      </button>
			  </div>
			</div>
	  	</div>
	  	<!-- col-md-8의 끝 : 검색 -->
	  	<div class="col-md-4">
	  		<!-- 너비를 조정하기 위한 div 추가. float-right : 오른쪽 정렬 -->
	  		<div style="width: 200px;" class="float-right">
			  <div class="input-group mb-3">
			    <div class="input-group-prepend">
			      <span class="input-group-text">Rows/Page</span>
			    </div>
			    <select id="perPageNum" name="perPageNum" class="form-control">
			    	<option>6</option>
			    	<option>9</option>
			    	<option>12</option>
			    	<option>15</option>
			    </select>
			  </div>
		  </div>
	  	</div>
	  	<!-- col-md-4의 끝 : 한페이지당 표시 데이터 개수 -->
	  </div>
  </form>
  <c:if test="${empty list }"> <!-- 없으면 true -->
  <div class="jumbotron">
  <h4>데이터가 존재하지 않습니다.</h4>
  </div>
  </c:if>
  
  <c:if test="${!empty list }"> <!-- 없으면 true -->
	  <div class="row">
	  <!-- 이미지의 데이터가 있는 만큼 반복해서 표시하는 처리 시작. div가 데이터 있는 만큼 -->
	  <c:forEach items="${list }" var="vo" varStatus="vs">
	  <!-- 줄 바꿈 처리 - 찍는 index 번호가 3의 배수이면 줄바꿈 -->
	  <c:if test="${(vs.index !=0) && (vs.index % 3 == 0) }">
	  	${"</div>"}
	  	${"</div class='row'>"} <!-- 다시 한 줄을 시작함 -->
	  </c:if>
	  <!-- 데이터를 표시하는 곳의 시작 -->
	  <div class="col-md-4 dataRow">
		<div class="card" style="width:100%">
		  <img class="card-img-top" src="${vo.fileName }" alt="image">
		  <div class="card-body">
		    <strong class="card-title">
		    <span class="float-right">${vo.writeDate }</span>
		    ${vo.name }(${vo.id })
		    </strong>
		    <!-- 글 번호를 보이게 해서 숨기지 않음 -->
		    <p class="card-text"><span class="no">${vo.no}</span> ${vo.title }</p>
		  </div>
		</div>
	  	  <!-- 데이터를 표시하는 곳의 시작 -->
	  </div>
	</c:forEach>
	 <!-- 이미지의 데이터가 있는 만큼 반복해서 표시하는 처리 끝 -->
	</div>
	
	<!-- 페이지네이션 처리 -->
  <!-- list에 해당되는 데이터 뿌링 -->
	<div>
	<pageNav:pageNav listURI="list.do" pageObject="${pageObject }"></pageNav:pageNav></div>
	
	<c:if test="${!empty login }"> <!-- 로그인이 되어있 -->
	<!-- login이 되어있으면 보이게 하쟝. 권한처리(들어가지 못하게)는 ㄴㄴ -->
	
			<!-- //?perPageNum=${pageObject.perPageNum}는 
			URL에 쿼리 파라미터를 추가하는 부분.
			${pageObject.perPageNum}는 JSP의 EL을 사용하여 
			pageObject라는 객체의 perPageNum 속성 값을 동적으로 삽입.
			
			writeForm.do URL로 이동하는 링크를 생성하며, 
			perPageNum이라는 쿼리 파라미터에 pageObject 객체의 perPageNum 속성 값을 동적으로 할당
			예를 들어, pageObject.perPageNum의 값이 10이라면, 
			생성된 링크는 writeForm.do?perPageNum=10이 됨.
			
			//이 링크를 클릭하면 사용자는 writeForm.do 페이지로 이동하며,
			 perPageNum 값이 URL 쿼리 파라미터로 전달 -->
			 
	<a href="writeForm.do?perPageNum=${pageObject.perPageNum }" class="btn btn-primary">등록</a>
	</c:if>
  </c:if>
    
</div>
</body>
</html>