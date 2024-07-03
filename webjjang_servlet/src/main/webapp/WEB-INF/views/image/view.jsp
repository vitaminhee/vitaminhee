<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 보기</title>
<script type="text/javascript">
$(function() {
	$('[data-toggle="tooltip"]').tooltip();
});
</script>
</head>
<body>
<div class="container">
	<h1>image view</h1>
	
			<div class="card">
			  <div class="card-header">
			  <b>${vo.no}. ${vo.title }
			  </b>
			  </div>
			  <div class="card-body">
			  <div class="card">
			  <div class="card-header">
			  
			  <!-- card 아래의 card-img-overlay
			  위쪽의 이미지(또는 class = card-img-top - card 클래스 밖에서도 적용) -->
			  <!-- - width의 기본이 100%로 되어있어서 card-img-top를 없앰 -->
			  <img  src="${vo.fileName }" alt="image">
					<div class="card-img-overlay"> <!-- 버튼이 하단에 -->
					<c:if test="${login.id == vo.id }"> <!-- 로그인 처리가 되어야만 볼 수 있다. -->
				    	<button type="button" class="btn btn-primary"
				    	 data-toggle="modal" data-target="#changeImageModal">
  								이미지 변경 </button>
  								
  								
<!-- 이미지, 이미지 번호, 이미지 이름을 넘겨야 함.
이미지는 이전 이미지는 지워야하기 때문에 이미지 이름을 넘겨야함. -->
<!-- The Modal -->
<div class="modal" id="changeImageModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">바꿀 이미지 선택</h4>
        <button type="button" class="close" data-dismiss="mo
        dal">&times;</button>
      </div>


		<form action="changeImage.do" method="post" enctype="multipart/form-data">
		<!-- 숨겨서 넘겨야 할 데이터 - 이미지 번호, 현재 파일이름(삭제해야할 파일 이름) -->
		<input name="no" value="${vo.no }" type="hidden">
		
		<!-- 페이지 정보도 넘긴다. -->
		<input name="page" value="${param.page }" type="hidden">
		<input name="perPageNum" value="${param.perPageNum }" type="hidden">
		<input name="key" value="${param.key }" type="hidden">
		<input name="word" value="${param.word }" type="hidden">	
			
		<!-- delete filename은 만들지않음!! -->
		<input name="deleteFileName" value="${vo.fileName }" type="hidden">
		      <!-- Modal body -->
		      <div class="modal-body">
				       <div class="form-group">
				       <!-- 이 부분의 id와 fileName = multi.getFilesystemName("imageFile");
				       이 부분이 동일해야 이미지를 변경할 때 잘 나옴!! -->
					    <label for="imageFile">첨부 이미지</label>
					    <input id="imageFile" name="imageFile" required 
							class="form-control" type="file">
						</div>
		      </div>
		
		      <!-- Modal footer -->
		      <div class="modal-footer">
		      <button class="btn btn-primary">바꾸기</button>
		        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
		      </div>
		
			</form>
		    </div>
		  </div>
		</div>

				    </c:if>
				     <a href="${vo.fileName }" class="btn btn-success" download>download</a>
				  </div>
				  </div>
				  
			  <div class="card-body">
			    <p class="card-text"><pre>${vo.content }</pre><p>
			  </div>
			</div>
			  </div>
			  <div class="card-footer">
			  <span class="float-right">${vo.writeDate }</span>
			  ${vo.name }(${vo.id })
			  </div>
			  </div>
			  
				<!-- a tag : 데이터를 클릭하면 href의 정보를 가져와서 페이지를 이동시킨다. -->
				<!--  글 보기 데이터를 가져와야 함 -->
				<a href="updateForm.do?no=${param.no }&page=${param.page }&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}" 
				class="btn btn-primary" title="이미지를 제외한 정보만 수정합니다."
				data-toggle="tooltip" data-placement="top" id="updateBtn" >수정</a> <!-- 위에 보여지게끔 -->
				<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">
				    삭제
				  </button>
				<a href="list.do?page=${param.page }&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}" class="btn btn-info">리스트</a>
	

      </div>
  
</body>
</html>