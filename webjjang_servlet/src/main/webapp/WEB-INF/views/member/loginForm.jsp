<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login Form</title>
</head>
<body>
<div class="container">
<h3>login</h3>
	<form action="login.do" method="post">
	  <div class="form-group">
	    <label for="id">ID</label>
	    <input type="text" class="form-control" placeholder="ID 입력" 
	    id="id" name="id" autocomplete="none"> <!-- autocomplete="none" 자동완성 ㄴㄴ -->
	  </div>
	  <div class="form-group">
	    <label for="pw">PW</label>
	    <input type="password" class="form-control" placeholder="PW 입력" 
	    id="pw" name="pw">
	  </div>
	  <button type="submit" class="btn btn-primary">login</button>
	</form>
</div>
</body>
</html>