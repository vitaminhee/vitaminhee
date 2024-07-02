<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 게시판 글보기</title>
<style type="text/css">
/* 이곳을 주석입니다. Ctrl + Shift + C로 자동 주석 가능. 그러나 푸는 건 안된다.
	선택자 {스타일 항목 : 스타일 값;스타일 항목 : 스타일 값;...}
	기본 선택자 : a - a tag, .a - a라는 클래스(여러개), #a - a라는 아이디(한개)
	다수 선택자 : ","로 선택. a, #a : a tag와 a라는 아이디
	상태 선택자 : ":". ":hover" - 마우스가 올라갔을 때.
				 "a:hover" - a tag 위에 마우스가 올라갔을 때
	선택의 상속 : a .data - a tag 안에 data class의 태그를 찾는다.
 */
 
 /* box 속성의 객체를 가운데 정렬 시키기 - table */
 table {
 	/* table의 여백 주기 - 데이터를 반복적으로 사용 : 맨위에서 부터 시계 방향으로(상우하좌) 
 	   길이나 크기를 지정할 때 0이 아니면 단위를 꼭 써야합니다.(px, pt, cm, mm, m, inch, em...) */
 	margin: 0 auto;
 	width: 800px; /* 너비 지정 */
 }
 
 th, td {
	/* border-with : 1px; border-type : solid; border-color : #888
		- 데이터 특성에 따라서 항목에 찾아 들어간다.
		- 색상 : #888 
		   - 색상 이름 : red, blue, black, white, ...
		   - RGB : 16진수 #FFFFFF - #RGB : R - 0~FF : 256 등급으로 나눔
		                 #FFF - #RGB : R - 0~F : 16 등급으로 나눔
		- 선 타입 : solid - 실선, dotted - 점선, dashed - 긴 점선, double - 이중선 */
 	border: 1px solid #888; /* 테두리 */
 	padding: 5px; /* 테두리와 데이터의 공백 */
 }
 
 th {
 	background: black; /* 배경색 - #000 */
 	color: white; /* 글자색 - #fff */
 }
 
 input, select, textarea, button {
 	padding: 5px;
 }
 
 .textInput{
 	width: 98%;
 }

input, select, textarea {
	background: #ddd;
}

 input:focus, select:focus, textarea:focus{
 	background: white;
 }

</style>
</head>
<body>
	<table>
		<!-- tr : table row - 테이블 한줄 -->
		<tr>
			<!-- th : table head - 테이블 제목 텍스트 -->
			<th colspan="2">
				<h1>일반 게시판 글보기</h1>
			</th>
		</tr>
		<!-- 게시판 데이터의 제목 -->
		<tr>
			<th>번호</th>
			<td>10</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>자바란?</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>프로그래밍 언어입니다.</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>홍길동</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>2024-05-15</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>15</td>
		</tr>
		<tr>
			<td colspan="2">
				<!-- a tag : 데이터를 클릭하면 href의 정보를 가져와서 페이지 이동시킨다. -->
				<a href="updateForm.jsp"><button>수정</button></a>
				<button>삭제</button>
				<a href="list.jsp"><button>리스트</button></a>
				<form action="delete.jsp" method="post">
					<input type="hidden" name="no" value="10">
					<input name="pw" required maxlength="20"
						pattern="^.{3,20}$"
						title="3~20자 입력 가능"
						placeholder="본인 확인용 비밀번호"
					>
					<button>삭제 진행</button>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>