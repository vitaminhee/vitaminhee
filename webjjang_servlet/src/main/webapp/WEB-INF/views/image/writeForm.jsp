<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 게시판 글 등록</title>
</head>
<body>
<div class="containner">
<h1>image writeForm</h1>
<!--  -->
<form action="write.do" method="post" enctype="multipart/form-data">
<!-- pageNum을 지정해야 servelt이~~ -->
<!--  list에 데이터가 넘어와야 함. -->
<input type="hidden" value = ${param.perPageNum } name = "perPageNum">
 			<div class="form-group">
			    <label for="title">제목</label>
			    <input id="title" name="title" required 
					class="form-control" maxlength="100"
					pattern="^[^ .].{2,99}$"
					title="맨앞에 공백문자 불가. 3~100자 입력"
					placeholder="제목 입력 : 3자 이상 100자 이내">
				</div>
				
				<div class="form-group">
			    <textarea class="form-control" id="content" name="content"  required
					rows="7" placeholder="첫 글자는 공백문자나 줄바꿈을 입력할 수 없습니다!"></textarea>
				</div>
				
				
				<div class="form-group">
			    <label for="imagefile">첨부 이미지</label>
			    <input id="imagefile" name="imagefile" required 
					class="form-control" type="file">
				</div>
				
				
				<button class="btn btn-primary">등록</button>
				<button type="reset" class="btn btn-secondary">다시입력</button>
				<button type="button" onclick="history.back();" class="btn btn-warning">취소</button>

</form>
</div>
</body>
</html>