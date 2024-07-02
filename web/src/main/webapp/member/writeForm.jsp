<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<style type="text/css">
table{
/* 	가운데 정렬 : 밖의 여백 */
	margin: 0 auto;
	width: 800px;
}
th, td {
	border: 1px solid #888;
	padding: 5px;
}
th {
	background: black;
	color: white;
}
input, select, textarea {
	padding: 5px;
}
.textInput {
	width: 98%;
}
td > label {
	cursor: pointer;
}
</style>
</head>
<body>
	<form action="write.jsp">
		<!-- 아이디, 비밀번호, 비밀번호 확인, 이름, 성별, 생년월일, 연락처, 이메일,
		 	우편번호, 기본 주소, 상세 주소, 사진, 관심 상품  -->
		<table>
		<tr>
			<th colspan="2">
				<h1>회원 가입</h1>
			</th>
		</tr>
		<tr>
			<th>아이디</th>
			<td>
				<!-- input tag 기본 타입 : text : 글자 입력 - 생략 가능 -->
				<!-- id, class 속성 : 화면단에서 조작하기 위해서 지정 -->
				<!-- name 속성 : 서버에서 데이터를 받는  key에 해당. 사용자 입력이 value가 된다. -->
				<!-- 데이터 유효성 검사 pattern : 아이디 - 3자~20자, 맨 앞자 영문자, 뒤에는 영숫자
					유효성 검사에 위배되면 데이터 전달 안하고 메시지 출력
					 - title 속성에 메시지를 사용. 없으면 기본 메시지 사용 -->
				<input type="text" id="id" name="id" required
				 pattern="^[a-zA-Z][a-zA-Z0-9]{2,19}$"
				 title="맨 앞자는 영문자, 뒤에는 영숫자, 3~20자 길이로 작성해야 합니다."
				 placeholder="아이디 입력" maxlength="20" class="textInput">
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<!-- input 타입 : password -  비밀번호 입력, 눈에 안보인다. -->
				<!-- id, class 속성 : 화면단에서 조작하기 위해서 지정 -->
				<!-- name 속성 : 서버에서 데이터를 받는  key에 해당. 사용자 입력이 value가 된다. -->
				<input type="password" id="pw" name="pw" required
				 pattern="^.{4,20}$" title="비밀번호는 4~20자로 작성하셔야 합니다."
				 placeholder="비밀번호 입력" maxlength="20" class="textInput">
			</td>
		</tr>
		<tr>
			<th>비밀번호 확인</th>
			<td>
				<input type="password" id="pw2" required
				 placeholder="비밀번호 확인 입력" maxlength="20" class="textInput">
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>
				<!-- input tag 기본 타입 : text : 글자 입력 - 생략 가능 -->
				<!-- id, class 속성 : 화면단에서 조작하기 위해서 지정 -->
				<!-- name 속성 : 서버에서 데이터를 받는  key에 해당. 사용자 입력이 value가 된다. -->
				<input type="text" id="name" name="name" required
				 pattern="^[가-힣]{2,10}$" title="이름은 2~10자의 한글만 가능합니다."
				 placeholder="한글 10자 이내" maxlength="10" class="textInput">
			</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
				<!-- input tag 타입 : radio : 사용자가 한개만 선택할 수 있는 버튼
					 넘겨 줄 값을 사용자가 입력하지 않고 value 속성으로 미리 저장해 놓는다.
					 단, 한개만 선택할 수 있는 항목들의 name이 같아야만 한다. -->
				<!-- id, class 속성 : 화면단에서 조작하기 위해서 지정 -->
				<!-- name 속성 : 서버에서 데이터를 받는  key에 해당. 
					 checked - radio, checkbox 입력을 체크되어 지도록 한다. -->
				<label>
					<input type="radio" name="name" required value="남자" checked>
					  남자 
				</label>
				<label>
					<input type="radio" name="name" required value="여자">
					  여자 
				</label>
			</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>
				<!-- input tag : date : 날짜 입력, 브라우저의 특성을 탄다.
						date 타입이 인식이 안되면 text로 진행된다. -->
				<!-- id, class 속성 : 화면단에서 조작하기 위해서 지정 -->
				<!-- name 속성 : 서버에서 데이터를 받는  key에 해당. 사용자 입력이 value가 된다. -->
				<input type="date" id="birth" name="birth" required
				 pattern="^(19|20)\d{2}-(0[1-9]|1[0-2])-([0-2][1-9]|3[01])$"
				 title="생년월일은 YYYY-MM-DD 형식에 맞아야 합니다."
				 class="textInput">
			</td>
		</tr>
		<tr>
			<th>연락처</th>
			<td>
				<!-- input tag : tel : 전화번호 입력, 브라우저의 특성을 탄다.
						date 타입이 인식이 안되면 text로 진행된다. -->
				<!-- id, class 속성 : 화면단에서 조작하기 위해서 지정 -->
				<!-- name 속성 : 서버에서 데이터를 받는  key에 해당. 사용자 입력이 value가 된다. -->
				<input type="tel" id="tel" name="tel" 
				 class="textInput">
				<div>
					<!-- 통신사 번호 : 010, 011, 017, 019 
						: 정해진 데이터 중 한개 선택 - select -->
					<!-- 서버에서 받는 데이터의 이름(KEY) name인데 2개 이상 가능
						 서버에서 2개 이상의 같은 name을 받을 때 배열로 받아서 처리 가능
						 multiple 속성으로 여러개 선택할 수 있다. -->
					<select id="tel2" name="tel2">
						<!-- 선택항목 : option. 값은 속성 value 속성 지정
								value가 없으면 option 태그 사이의 데이터가 값이 된다.
								맨처음 선택되어지게 하는 속성 : selected -->
						<option selected>010</option>
						<option>011</option>
						<option>017</option>
						<option value="019">019</option>
					</select>-
					<input type="text" size="4" maxlength="4" name="tel2">-
					<input type="text" size="4" name="tel2">
				</div>
			</td>
		</tr>
		<!-- 이메일, 우편번호, 기본 주소, 상세 주소, 사진, 관심 상품  -->
		<tr>
			<th>이메일</th>
			<td>
				<!-- input tag : email : email은 "@" 기호만 체크 
					pattern을 적용하려면 text 타입으로 하세요.-->
				<!-- id, class 속성 : 화면단에서 조작하기 위해서 지정 -->
				<!-- name 속성 : 서버에서 데이터를 받는  key에 해당. 사용자 입력이 value가 된다. -->
				<input type="text" id="email" name="email" required
				 pattern="^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]{2,}$"
				 title="이메일 형식을 id@domain(xx.xx)이여야 합니다."
				 class="textInput">
			</td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td>
				<!-- id, class 속성 : 화면단에서 조작하기 위해서 지정 -->
				<!-- name 속성 : 서버에서 데이터를 받는  key에 해당. 사용자 입력이 value가 된다. -->
				<input type="text" id="post" name="post" required
				 class="textInput">
			</td>
		</tr>
		<tr>
			<th>기본 주소</th>
			<td>
				<!-- id, class 속성 : 화면단에서 조작하기 위해서 지정 -->
				<!-- name 속성 : 서버에서 데이터를 받는  key에 해당. 사용자 입력이 value가 된다. -->
				<input type="text" id="basicAddress" name="basicAddress" required
				 class="textInput">
			</td>
		</tr>
		<tr>
			<th>상세 주소</th>
			<td>
				<!-- id, class 속성 : 화면단에서 조작하기 위해서 지정 -->
				<!-- name 속성 : 서버에서 데이터를 받는  key에 해당. 사용자 입력이 value가 된다. -->
				<input type="text" id="detailAddress" name="detailAddress" required
				 class="textInput">
			</td>
		</tr>
		<tr>
			<th>사진</th>
			<td>
				<!-- id, class 속성 : 화면단에서 조작하기 위해서 지정 -->
				<!-- name 속성 : 서버에서 데이터를 받는  key에 해당. 사용자 선택파일이 value가 된다.
					 form method 속성이 반드시 "post"이여야만 한다.
					 form 태그 속성에는 enctytpe="multipart/form-data"를 선언해야만 한다. -->
				<input type="file" id="photo" name="photo"
				 class="textInput">
			</td>
		</tr>
		<tr>
			<th>관심 상품</th>
			<td>
				<!-- input tag : checkbox : 여러개를 체크할 수 있다. -->
				<!-- id, class 속성 : 화면단에서 조작하기 위해서 지정 -->
				<!-- name 속성 : 서버에서 데이터를 받는  key에 해당. name이 같으면 배열
						값은 value 속성 이용 -->
				<label>
					<input type="checkbox" id="interast" name="interast" 
					value="남성 아웃도어"> 남성 아웃도어 
				</label>
				<label>
				<input type="checkbox" id="interast" name="interast" 
				value="악세사리"> 악세사리 
				</label>
				<label>
				<input type="checkbox" id="interast" name="interast" 
				value="신발"> 신발 
				</label>
				<label>
				<input type="checkbox" id="interast" name="interast" 
				value="보석류"> 보석류 
				</label>
				<label>
				<input type="checkbox" id="interast" name="interast" 
				value="전자제품"> 전자제품 
				</label>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<button>가입</button>
			</td>
		</tr>
		</table>
	</form>
</body>
</html>