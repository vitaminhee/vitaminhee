<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<style type="text/css">
div > i:hover {
cursor: pointer;
}
</style>

<script type="text/javascript">
$(function () {

	// 이벤트 처리
	// i tag 손가락 올라간 것과 왼쪽은 검정색 - fa-star
	//						오른쪽은 흰색 - fa-star-o
	// class 조작 - addClass() - 추가 / removeClass() - 지우기
	$("div > i").click(function () { 
		//https://api.jquery.com/removeClass/#removeClass-className
		//alert("star click");
		$("div > i"). removeClass("fa-star fa-star-o"); // 같은 위치에 있는거
		// 클릭한 것은 검은색
		$(this).addClass("fa-star");
		// 클릭한 것의 앞의 것도 검은색
		$(this).prevAll().addClass("fa-star");
		// 클릭한 것의 뒤의 별은 흰색
		$(this).nextAll().addClass("fa-star-o");
		// index
		let idx = $(this).index();
		//alert("index =" + idx);
		let score = idx + 1; // 점수로 넘기면 된다.
		$("scoreDiv").text(score);
	});
});

</script>

</head>
<body>
<div class="container">
<h3>별점 주기</h3>
<div>
<i class="fa fa-star" style="font-size:36px"></i>
<i class="fa fa-star" style="font-size:36px"></i>
<i class="fa fa-star" style="font-size:36px"></i>
<i class="fa fa-star" style="font-size:36px"></i>
<i class="fa fa-star" style="font-size:36px"></i>
</div>
fa fa-star : full / fa fa-star-o : empty
<div id="scoreDiv">5</div>
</div>
</body>
</html>