<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>img list</title>
  <!-- 1. Bootstrap 4 + jquery 3.7 라이브러리 등록 CDN -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">

.dataRow:hover{
	background: #ddd;
	cursor: pointer;
}
 background: skyblue;
</style>

<script type="text/javascript">
$(function(){
	
// 	// 2. jquery 확인
// 	console.log("jquery loading..... --------------- ");
	
});
</script>
</head>
<body>
<!-- 3. body 부분의 소스를 채운다. w3schools.com 사이 소스 참소. -->
<div class="container">
  <h2><i class="fa fa-contao" style="font-size:48px;color:red"></i> Image List~</h2>
  <form action="list.jsp">
	  <div class="row">
	  	<div class="col-md-8">
	  		<div class="input-group mb-3">
			  <div class="input-group-prepend">
			      <select name="key" id="key" class="form-control">
			      	<option value="t">제목</option>
			      	<option value="c">내용</option>
			      	<option value="w">작성자</option>
			      	<option value="tc">제목/내용</option>
			      	<option value="tw">제목/작성자</option>
			      	<option value="cw">내용/작성자</option>
			      	<option value="tcw">모두</option>
			      </select>
			  </div>
			  <input type="text" class="form-control" placeholder="검색"
			   id="word" name="word">
			    <div class="input-group-append">
			      <button class="btn btn-outline-primary">
			      	<i class="fa fa-search"></i>
			      </button>
			    </div>
			</div>
	  	</div>
	  	<!-- col-md-8의 끝 : 검색 -->
	  	<div class="col-md-4">
	  		<!-- 너비를 조정하기 위한 div 추가. float-right : 오른쪽 정렬 -->
	  		<div style="width: 200px;" class="float-right">
			  <div class="input-group mb-3">
			    <div class="input-group-prepend">
			      <span class="input-group-text">Rows/Page</span>
			    </div>
			    <select id="perPageNum" name="perPageNum" class="form-control">
			    	<option>10</option>
			    	<option>15</option>
			    	<option>20</option>
			    	<option>25</option>
			    </select>
			  </div>
		  </div>
	  	</div>
	  	<!-- col-md-4의 끝 : 한페이지당 표시 데이터 개수 -->
	  </div>
  </form>

	<!-- 이미지 리스트를 보여 주는 부분 시작 : Bootstrap의 grid -->
	<div class="row">
	  <div class="col-md-4">
	    <div class="card" style="width:70%">
		  <img class="card-img-top" src="/img/cat05.jpeg" alt="Card image" width="20px">
		  <div class="card-body">
		    <h4 class="card-title">으악</h4>
		    <p class="card-text">
		    	렛츠기릿
		    	<br>
		    	그냥
		    </p>
		  </div>
		</div>
		<!-- image card의 끝 -->
	  </div>
	  <!-- col-md-4의 끝 -->
	  <div class="col-md-4">
	    <div class="card" style="width:70%">
		  <img class="card-img-top" src="/img/xiba.png" alt="Card image" width="20px">
		  <div class="card-body">
		    <h4 class="card-title">요즘 내 status</h4>
		    <p class="card-text">
		    	바다보러 가고 싶다
		    	<br>
		    	강릉 바다 개예뻐요..
		    </p>
		  </div>
		</div>
		<!-- image card의 끝 -->
	  </div>
	  <!-- col-md-4의 끝 -->
	  <div class="col-md-4">
	    <div class="card" style="width:70%">
		  <img class="card-img-top" src="/img/dog01.jpg" alt="Card image" width="20px">
		  <div class="card-body">
		    <h4 class="card-title">밍구</h4>
		    <p class="card-text">
		    	왜죠
		    </p>
		  </div>
		</div>
		<!-- image card의 끝 -->
	  </div>
	  <!-- col-md-4의 끝 -->
	</div>
	<!-- row의 끝 -->
	
	<div class="col-md-4">
	<div class="card" style="width:70%">
		  <img class="card-img-top" src="/img/me.jpg" alt="Card image" width="20px">
		  <div class="card-body">
		    <h4 class="card-title">밍구</h4>
		    <p class="card-text">
		    	안녕하세요
		    </p>
		  </div>
		</div>
		<!-- image card의 끝 -->
	  </div>
	  <!-- col-md-4의 끝 -->
	</div>
	<!-- row의 끝 -->
	<!-- 이미지 리스트를 보여 주는 부분 끝 -->
</div>
</body>
</html>