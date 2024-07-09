<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.13.3/jquery-ui.js"></script>
    <title>회원가입 폼</title>
    <script type="text/javascript">
$(function(){
	
	// 날짜 입력 설정 - datepicker
	let now = new Date();
    let startYear = now.getFullYear();
    let yearRange = (startYear - 100) +":" + startYear ;
	$(".datepicker").datepicker({
		// 입력란의 데이터 포맷 
		dateFormat: "yy-mm-dd",
		// 월 선택 입력 추가
		changeMonth: true,
		// 년 선택 입력 추가
		changeYear: true,
		// 월 선택할 때의 이름 - 원래는 영어가 기본
		monthNamesShort: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
		// 달력의 요일 표시
		dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
		// 선택 년도의 범위 - 0살~100살
		yearRange: yearRange,
		// 오늘까지만의 날짜를 선택 가능
		maxDate : now
	});
	
	
	// 이벤트 처리
	// 아이디 체크 처리
	$("#id").keyup(function(){
		let id = $("#id").val();
		// data  확인하기
		console.log("id = " + id);
		// 3자 미만인 경우의 처리
		if(id.length < 3){
			// class 지정 - 디자인
			// alert("3자 미만");
			$("#checkIdDiv").removeClass("alert-success alert-danger")
			.addClass("alert-danger");
			// 글자 바꾸자.
			$("#checkIdDiv").text("아이디는 필수 입력 입니다. 3글자 이상입니다.");
		} else {
			// alert("3자 이상");
			// 서버에 가서 데이터를 확인하고 온다. - 결과를 JSP로 받는다.
			// $("#checkIdDIV") 안에 넣을 문구를 가져 와서 넣는다.
			// ajax의 load 함수 사용 load(url, data, fucntion(){});
			$("#checkIdDiv").load("/ajax/checkId.do?id=" + id,
			// callback 함수 - function(결과, 상태-success/error, 통신객체){
			function(result){
				if(result.indexOf("중복") >= 0)
					$("#checkIdDiv").removeClass("alert-success alert-danger")
					.addClass("alert-danger");
				else
					$("#checkIdDiv").removeClass("alert-success alert-danger")
					.addClass("alert-success");
				;
			}); // checkId Ajax 처리의 끝
		} // if(id.length < 3) else의 끝
	}); // $("#id").keyup() 이벤트 처리의 끝
	// 비밀번호와 비밀번호 확인의 이벤트 시작
	$("#pw, #pw2").keyup(function(){

		let pw = $("#pw").val();
		let pw2 = $("#pw2").val();
		
		// 비밀번호 길이 체크
		if(pw.length < 4){
			// 디자인 부분 적용 
			$("#pwDiv").removeClass("alert-success alert-danger")
			.addClass("alert-danger");
			// 글자 오류 적용
			$("#pwDiv").text("비밀번호는 필수 입력 입니다. 4글자 이상 입력하셔야 합니다.");
		} else {
			// 디자인 부분 적용 
			$("#pwDiv").removeClass("alert-success alert-danger")
			.addClass("alert-success");
			// 글자 오류 적용
			$("#pwDiv").text("적당한 비밀번호를 입력하셨습니다.");
		}
		// 비밀번호확인 길이 체크
		if(pw2.length < 4){
			// 디자인 부분 적용 
			$("#pw2Div").removeClass("alert-success alert-danger")
			.addClass("alert-danger");
			// 글자 오류 적용
			$("#pw2Div").text("비밀번호 확인은 필수 입력 입니다. 4글자 이상 입력하셔야 합니다.");
		} else {
			// 비밀번호와 비밀번호 확인이 같은지 물어봐야 한다.
			if(pw != pw2){
				// 디자인 부분 적용 
				$("#pw2Div").removeClass("alert-success alert-danger")
				.addClass("alert-danger");
				// 글자 오류 적용
				$("#pw2Div").text("비밀번호와 비밀번호 확인은 같아야 합니다.");
			} else {
				// 디자인 부분 적용 
				$("#pw2Div").removeClass("alert-success alert-danger")
				.addClass("alert-success");
				// 글자 오류 적용
				$("#pw2Div").text("적당한 비밀번호 확인을 입력하셨습니다.");
			}
		}
	});
	// 비밀번호와 비밀번호 확인의 이벤트 끝
}); // $(function())의 끝
</script>
</head>
<body>
    <div class="container">
        <h2>회원가입 폼</h2>
        <form action="write.do" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="id">아이디</label>
                <input id="id" name="id" required autocomplete="off" class="form-control" maxlength="20" pattern="^[a-zA-Z][a-zA-Z0-9]{2,19}$" title="맨앞 글자는 영문자 뒤에는 영숫자 입력. 3~20 이내로 입력" placeholder="아이디 입력">
            </div>
            <div id="checkIdDiv" class="alert alert-danger">아이디는 필수 입력 입니다. 3글자 이상입니다.</div>

            <div class="form-group">
                <label for="pw">비밀번호</label>
                <input id="pw" name="pw" required autocomplete="off" class="form-control" maxlength="20" type="password" pattern="^{4,20}$" title="4~20 이내로 입력" placeholder="비밀번호 입력">
            </div>
            <div id="pwDiv" class="alert alert-danger">비밀번호는 필수 입력 입니다. 4글자 이상 입력하셔야 합니다.</div>

            <div class="form-group">
                <label for="pw2">비밀번호 확인</label>
                <input id="pw2" required autocomplete="off" class="form-control" maxlength="20" type="password" pattern="^{4,20}$" title="4~20 이내로 입력" placeholder="비밀번호 확인 입력">
            </div>
            <div id="pw2Div" class="alert alert-danger">비밀번호 확인은 필수 입력 입니다. 4글자 이상 입력하셔야 합니다.</div>

            <div class="form-group">
                <label for="name">이름</label>
                <input id="name" name="name" required autocomplete="off" class="form-control" maxlength="10" pattern="^[가-힣]{2,10}$" title="한글로 2-10자 이내로 입력" placeholder="이름 입력">
            </div>

            <div class="form-group">
                <label>성별</label>
                <div class="form-check-inline">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="gender" checked value="남자">남자
                    </label>
                </div>
                <div class="form-check-inline">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="gender" value="여자">여자
                    </label>
                </div>
            </div>

            <div class="form-group">
                <label for="birth">생년월일</label>
                <input id="birth" name="birth" required class="form-control datepicker" autocomplete="off">
            </div>
            <div class="form-group">
                <label for="tel">연락처</label>
                <input id="tel" name="tel" class="form-control" placeholder="xxx-xxxx-xxxx">
            </div>
            <div class="form-group">
                <label for="email">이메일</label>
                <input id="email" name="email" required class="form-control" placeholder="id@domain">
            </div>
            <div class="form-group">
                <label for="photoFile">첨부 이미지</label>
                <input id="photoFile" name="photoFile" class="form-control" type="file">
            </div>

            <button class="btn btn-primary">가입</button>
            <button type="reset" class="btn btn-secondary">다시입력</button>
            <button type="button" onclick="history.back();" class="btn btn-warning">취소</button>
        </form>
    </div>
</body>
</html>
