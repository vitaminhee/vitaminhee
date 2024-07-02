<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CartAlbum list</title>
<!-- 라이브러리 등록 -->
<!-- 라이브러리가 필요하다. 웹라이브러리(js 라이브러리)
	1. 다운로드 : jquery.com : 내 서버에 파일을 둔다.
	2. CDN(Content Delivery Network) - 배달 받는 방식 사용.(*) -->
<!-- Boostrap(디자인의 표준화) : jquery(동작의 표준화) 포함. -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- 아이콘 라이브러리 등록 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<style type="text/css">

/* 컨테이너에 여백을 추가 */
.container {
	margin: 20px;
}
/* 이미지와 리스트 간의 여백을 추가하고 싶다면 */
.img-fluid {
	margin-right: 10px; /* 필요에 따라 여백 조정 */
}

/* 체크박스의 크기를 조정하고 이미지와의 간격을 조정 */
.custom-checkbox {
	transform: scale(3); /* 체크박스 크기 조정 */
	margin-right: 100px; /* 이미지와의 간격 조정 */
}

#shopping-cart-title { /* 장바구니 제목에 대한 여백 */
	margin-bottom: 20px; /* 제목 아래 여백 추가 */
}

<
style> /* body 태그에 패딩과 마진을 0으로 설정 */ body {
	padding: 0;
	margin: 0;
}

/* .navbar 클래스에 마진과 패딩을 0으로 설정 */
.navbar {
	margin: 0;
	padding: 0;
}

/* .custom-navbar 클래스에 배경색을 설정하고, 기존 클래스 덮어쓰기를 위해 !important 사용 */
.custom-navbar {
	background-color: #D2D9E9 !important;
}

/* .custom-navbar 내의 .nav-link 클래스에 글자 색상을 설정하고, 기존 클래스 덮어쓰기를 위해 !important 사용 */
.custom-navbar .nav-link {
	color: gray !important;
}
</style>
</head>
<body>

	<!-- 메인 컨테이너 시작 -->
	<div class="container-fluid p-0">
		<!-- navbar 시작 -->
		<nav class="navbar navbar-expand-sm custom-navbar w-100">
			<!-- 브랜드/로고 설정 -->
			<a class="navbar-brand" href="#"> <img src="\img\musaic.png"
				alt="logo" style="width: 80px;">
			</a>

			<!-- 네비게이션 메뉴 -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" style="width: 80px;"
					href="#">top100</a></li>
				<li class="nav-item"><a class="nav-link" style="width: 80px;"
					href="#">Song</a></li>
				<li class="nav-item"><a class="nav-link" style="width: 80px;"
					href="#">album</a></li>
				<li class="nav-item"><a class="nav-link" style="width: 80px;"
					href="#">Notice</a></li>
				<li class="nav-item"><a class="nav-link" style="width: 80px;"
					href="#">Playlist</a></li>
			</ul>

			<!-- 오른쪽 정렬된 메뉴 -->
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" style="width: 80px;"
					href="#">Sign in</a></li>
				<li class="nav-item"><a class="nav-link" style="width: 80px;"
					href="#">Login</a></li>
				<!-- 사용자 아이콘 -->
				<i class="material-icons" style="font-size: 48px; color: gray">person_pin</i>
			</ul>
		</nav>
	</div>

	<!-- 장바구니 목록 표시를 위한 두 번째 컨테이너 시작 -->
	<div class="container">
		<h3 id="shopping-cart-title">장바구니</h3>

		<!-- 첫 번째 앨범 항목 -->
		<div class="row mb-3">
			<!-- 앨범 이미지와 체크박스 -->
			<div class="col-md-4 d-flex align-items-center">
				<form action="insert.jsp" method="get" class="me-2">
					<input type="checkbox" name="checkbox1" style="width: 100px">
				</form>
				<img src="/img/seonjae.png" class="img-fluid" style="width: 200px"
					alt="사진을 넣어주세요.">
			</div>

			<!-- 앨범 정보 리스트 -->
			<div class="col-md-6">
				<div class="list-group">
					<div class="list-group-item">선재 업고 튀어 OST</div>
					<div class="list-group-item price">가격 : 30,000원</div>
					<div class="list-group-item shipping">배송비 : 3,000원</div>
				</div>
			</div>

			<!-- 수량 조절 입력 -->
			<div
				class="col-md-2 d-flex justify-content-center align-items-center">
				<div class="input-group">
					<div class="input-group-prepend">
						<button class="btn btn-outline-secondary" type="button"
							id="button-addon1">+</button>
					</div>
					<input type="text" class="form-control" value="1"
						aria-label="Example text with button addon"
						aria-describedby="button-addon1">
					<div class="input-group-append">
						<button class="btn btn-outline-secondary" type="button"
							id="button-addon2">-</button>
					</div>
				</div>
			</div>
		</div>

		<!-- 두 번째 앨범 항목 -->
		<div class="row mb-3">
			<!-- 앨범 이미지와 체크박스 -->
			<div class="col-md-4 d-flex align-items-center">
				<form action="insert.jsp" method="get" class="me-2">
					<input type="checkbox" name="checkbox2" style="width: 100px">
				</form>
				<img src="/img/oneus_now.jpg" class="img-fluid" style="width: 200px"
					alt="사진을 넣어주세요.">
			</div>

			<!-- 앨범 정보 리스트 -->
			<div class="col-md-6">
				<div class="list-group">
					<div class="list-group-item">Now (Original by Fin.K.L)</div>
					<div class="list-group-item price">가격 : 30,000원</div>
					<div class="list-group-item shipping">배송비 : 3,000원</div>
				</div>
			</div>

			<!-- 수량 조절 입력 -->
			<div
				class="col-md-2 d-flex justify-content-center align-items-center">
				<div class="input-group">
					<div class="input-group-prepend">
						<button class="btn btn-outline-secondary" type="button"
							id="button-addon1">+</button>
					</div>
					<input type="text" class="form-control" value="1"
						aria-label="Example text with button addon"
						aria-describedby="button-addon1">
					<div class="input-group-append">
						<button class="btn btn-outline-secondary" type="button"
							id="button-addon2">-</button>
					</div>
				</div>
			</div>
		</div>

		<!-- 금액 정보 및 버튼 섹션 -->
		<div class="container mt-3">
			<div class="row">
				<div
					class="col-md-12 d-flex justify-content-between align-items-center">
					<div>
						<div id="totalCost">선택상품 금액 : 30,000원</div>
						<div id="totalShipping">총 배송비 : 3,000원</div>
					</div>
					<div>
						<button type="button" class="btn btn-dark">주문하기</button>
						<button type="button" class="btn btn-dark">삭제</button>
					</div>
				</div>
			</div>
		</div>
</body>
</html>