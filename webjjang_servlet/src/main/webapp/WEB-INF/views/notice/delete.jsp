<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 여기는 자바입니다.
System.out.println("일반 게시판 글 삭제 처리 : delete.jsp -----------------------------");
// 데이터 수집
String noStr = request.getParameter("no");
String pw = request.getParameter("pw");
System.out.println("no=" + noStr + ", pw=" + pw);

// DB 글삭제 처리한다.

// 자동으로 리스트로 이동시킨다.
response.sendRedirect("list.jsp");
%>