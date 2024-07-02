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

</head>
<body>
<div class="container">
<div id="demo" class="carousel slide" data-ride="carousel">

  <!-- Indicators : 클릭했을 때 자동으로 넘어가는 부분 -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
     <li data-target="#demo" data-slide-to="3"></li>
  </ul>
  
  <!-- The slideshow : 실질적인 이미지 부분 -->
  <!-- image가 표시되지 않으면 alt가 표시 -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="/img/cat01.jpg" alt="Los Angeles" width="1100" height="500">
    </div>
    <div class="carousel-item">
      <img src="/img/cat02.jpg" alt="Chicago" width="1100" height="500">
    </div>
    <div class="carousel-item">
      <img src="/img/cat03.jpg" alt="New York" width="1100" height="500">
    </div>
     <div class="carousel-item">
      <img src="/img/cat04.jpg" alt="New York" width="1100" height="500">
    </div>
  </div>
  
  <!-- Left and right controls : 좌우 이동 -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
  <!-- 다음 slide icon -->
    <span class="carousel-control-next-icon"></span> <!-- 오른쪽 화살표로 클릭 가능하게끔 -->
  </a>
</div>

</div>
</body>
</html>