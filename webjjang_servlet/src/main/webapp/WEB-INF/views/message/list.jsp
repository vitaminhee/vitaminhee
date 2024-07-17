<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>message list</title>
</head>
<body>
<div class="container">
	<h3>${(pageObject.acceptMode == 1)?"받은"
		:(pageObject.acceptMode == 2)?"보낸":"모든" } message list</h3>
	<div>
		<a href="list.do?mode=1&${pageObject.pageQuery }"
		 class="btn btn-primary">받은 message</a>
		<a href="list.do?mode=2&${pageObject.pageQuery }"
		 class="btn btn-primary">보낸 message</a>
		<a href="list.do?mode=3&${pageObject.pageQuery }"
		 class="btn btn-primary">모든 message</a>
	</div>
	<div>
		<c:if test="${ empty list }">msg가 존재하지 않습니다.</c:if>
		<c:if test="${ !empty list }">
			<ul class="list-group">
				<c:forEach items="${list }" var="vo">
					<div class="media border p-3 dataRow">
						<c:if test="${vo.senderId == login.id }">
							<!-- 보낸 사람이면 받는 사람의 정보만 표시한다. : right-->
						 
						  <div class="media-body text-right ${(empty vo.acceptDate)?'font-weight-bold':'' }">
					    	${vo.accepterName }
					    	<small><i>(${vo.accepterId })</i></small>
						    <p>
						    	번호 : ${vo.no }
						    	/ 보낸 날짜 : ${vo.sendDate }
						    	/ 읽은 날짜 : ${(empty vo.acceptDate)?"읽지 않음":vo.acceptDate }
						    </p>
						  </div>
						   <img src="${vo.accepterPhoto }"
						   class="ml-3 mt-3 rounded-circle" style="width:60px;">
						 </c:if>
						 
						 <c:if test="${vo.senderId != login.id }">
							<!-- 받는 사람이면 보낸 사람의 정보만 표시한다. -->
						  <img src="${vo.senderPhoto }"
						  class="mr-3 mt-3 rounded-circle" style="width:60px;">
						  <div class="media-body ${(empty vo.acceptDate)?'font-weight-bold':'' }">
					    	${vo.senderName }
					    	<small><i>(${vo.senderId })</i></small>
						    <p>
						    	번호 : ${vo.no }
						    	/ 보낸 날짜 : ${vo.sendDate }
						    	/ 읽은 날짜 : ${(empty vo.acceptDate)?"읽지 않음":vo.acceptDate }
						    </p>
						  </div>
						  
						 </c:if>
					</div>
				</c:forEach>
			</ul>
		</c:if>
	</div>
</div>
</body>
</html>