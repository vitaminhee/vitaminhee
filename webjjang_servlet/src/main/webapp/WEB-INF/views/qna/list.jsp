<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문답변 리스트</title>

 <style type="text/css">
        .dataRow:hover {
            background: #e0e0e0; /* 마우스를 가져다 댔을 때 색상 변경*/
            cursor: pointer;
        }
    </style>

<script type="text/javascript">
$(function() {
	// event 처리
	$(".dataRow").click(function() {
		// 한 줄 데이터를 클릭하면 질문답변 보기로 이동시킨다. - 번호 필요
		let no = $(this).find(".no").text();
		location = "view.do?no=" + no + "&${pageObject.pageQuery}"
	});
	
});
</script>
</head>
<body>
<div class="container">
	<h3>qna list</h3>
  
	<table class="table">
		<!-- tr : table row - 테이블 한줄 -->
		<!-- 게시판 데이터의 제목 -->
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		<!-- 실제적인 데이터 표시 : 데이터가 있는 만큼 줄(tr)이 생긴다. -->
		<!-- JS로 글보기로 페이지 이동
			onclick : click 이벤트 핸들러 속성 -->
		<c:forEach items="${list}" var="vo">
    <tr class="dataRow">
        <!-- td : table data - 테이블 데이터 텍스트 -->
        <td class="no">${vo.no}</td>
        <td>
            <c:if test="${vo.levNo != 0}">
            <c:forEach begin="1" end="${vo.levNo }">
            &nbsp;
            </c:forEach>
                <i class="material-icons">subdirectory_arrow_right</i>
            </c:if>
            ${vo.title}
        </td>
        <td>${vo.name}</td>
        <td>${vo.writeDate}</td>
    </tr>
</c:forEach>

		</table>
		<c:if test="${!empty login }"> <!-- 로그인을 하면 -->
		<a href="questionForm.do?perPageNum=${pageObject.perPageNum }" class="btn btn-primary">질문</a>
		
		</c:if>
		</div>
</body>
</html>