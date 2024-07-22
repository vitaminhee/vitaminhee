<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>message view</title>
</head>
<body>
<div class="container">

<!-- 받은 메시지를 표시하기 위한 조건문 -->
<c:if test="${param.accept==1}">
    <h3>받은 message view</h3>
    <div class="card">
        <div class="card-header">
            <div class="media border p-3">
                <!-- 보낸 사람의 프로필 사진을 표시 -->
                <img src="${vo.senderPhoto}" class="mr-3 mt-3 rounded-circle" style="width:60px;">
                <div class="media-body">
                    <!-- 보낸 사람의 이름과 ID를 표시 -->
                    ${vo.senderName}<small><i>(${vo.senderId})</i></small>
                    <!-- 메시지를 보낸 날짜와 받은 날짜를 표시 -->
                    <p>보낸 날짜 : ${vo.sendDate} / 받은 날짜 : ${vo.acceptDate}</p>
                </div>
            </div>
        </div>
        <div class="card-body">
            <!-- 메시지 내용을 표시 -->
            <pre>${vo.content}</pre>
        </div>
        <div class="card-footer">
            <!-- 답장, 삭제, 리스트 버튼들을 표시 -->
            <a href="/message/writeForm.do" class="btn btn-primary">reply</a>
            <a href="/message/delete.do" class="btn btn-danger">delete</a>
            <a href="/message/list.do?${pageObject.pageQuery}&mode=${param.mode}" class="btn btn-success">list</a>
        </div>
    </div>
</c:if>

<!-- 보낸 메시지를 표시하기 위한 조건문 -->
<c:if test="${param.accept!=1}">
    <h3>보낸 message view</h3>
    <div class="card">
        <div class="card-header">
            <div class="media border p-3">
                <!-- 받은 사람의 프로필 사진을 표시 -->
                <img src="${vo.accepterPhoto}" class="mr-3 mt-3 rounded-circle" style="width:60px;">
                <div class="media-body">
                    <!-- 받은 사람의 이름과 ID를 표시 -->
                    ${vo.accepterName}<small><i>(${vo.accepterId})</i></small>
                    <!-- 메시지를 받은 날짜와 보낸 날짜를 표시 -->
                    <p>받은 날짜 : ${(empty vo.acceptDate) ? "읽지 않음" : vo.acceptDate} / 보낸 날짜 : ${vo.sendDate}</p>
                </div>
            </div>
        </div>
        <div class="card-body">
            <!-- 메시지 내용을 표시 -->
            <pre>${vo.content}</pre>
        </div>
        <div class="card-footer">
            <!-- 메시지를 상대방이 읽지 않은 경우에만 삭제 버튼을 표시 -->
            <c:if test="${empty vo.acceptDate}">
                <a href="/message/delete.do" class="btn btn-danger">delete</a>
            </c:if>
            <!-- 리스트 버튼을 항상 표시 -->
            <a href="/message/list.do?${pageObject.pageQuery}&mode=${param.mode}" class="btn btn-success">list</a>
        </div>
    </div>
</c:if>

</div>
</body>
</html>
