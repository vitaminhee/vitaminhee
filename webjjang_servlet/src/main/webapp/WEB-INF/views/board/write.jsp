<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 여기는 자바입니다.
// 한글 처리
request.setCharacterEncoding("utf-8");

System.out.println("일반 게시판 글 등록 처리 : write.jsp");

// 데이터 수집(사->서 : form)
String title = request.getParameter("title");
String content = request.getParameter("content");
String writer = request.getParameter("writer");
String pw = request.getParameter("pw");
System.out.println("title = " + title);
System.out.println("content = " + content);
System.out.println("writer = " + writer);
System.out.println("pw = " + pw);
// 글등록 처리한다.

// 자동으로 리스트로 이동시킨다.
response.sendRedirect("list.jsp");
%>