<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>question/answer view</title>
</head>
<body>
<div class="container">
<h3>question/answer view</h3>
<div class="card">
  <div class="card-header">
  <span class="float-right">no : ${vo.no }</span>
  ${vo.title }
  </div>
  <div class="card-body"><pre>${vo.content }</pre></div>
  <div class="card-footer">
   <span class="float-right">${vo.writeDate }</span>
   ${vo.name }
  </div>
 
</div>
</div>
 <c:if test="${!empty login && vo.id != login.id && login.id < 3}">
    <!-- 로그인을 해야하고, 본인 글에 대한 답변은 본인이 답변 불가능. -->
    <a href="answerForm.do?no=${vo.no }&perPageNum=${param.perPageNum}" class="btn btn-primary">답변</a>
</c:if>
<a href="list.do?${pageObject.pageQuery}" class="btn btn-success">리스트</a>


</body>
</html>