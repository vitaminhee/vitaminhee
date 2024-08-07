<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.13.3/jquery-ui.js"></script>
    
<title>notice updateForm</title>

<script type="text/javascript">
$(function(){
	
	// 날짜 입력 설정 - datepicker : 전체 날짜 입력 형태만 잡아주는 거임
	let now = new Date();
    let startYear = now.getFullYear();
    // 현재부터 그 이후까지.
    let yearRange = (startYear - 2) +":" + (startYear + 10) ;
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
		// 선택 년도의 범위 - 현재부터 10년 이후까지 년도 검색 가능!
		yearRange: yearRange,
	});
	
	  $("#startDate").datepicker("option",
			   {
			      "minDate" : now, // mindate - 변수. 최소 날짜를 지금으로
			      onClose : function( selectedDate ) { 
			    	  if($(this).val() != "") // 선택된 날짜가 비어있지 않으면 종료일 세팅하자
			         $( "#endDate" ).datepicker( "option", "minDate", selectedDate );
			      }
			   });

			
			   $("#endDate").datepicker("option", 
			   {
			      "minDate" : now, // mindate - 변수. 최소 날짜를 지금으로
			      onClose : function( selectedDate ) { 
			    	  if($(this).val() != "") // 선택된 날짜가 비어있지 않으면 시작일 세팅하자
			         $( "#startDate" ).datepicker( "option", "maxDate", selectedDate );
			      }
			   });
	
}); // $(function())의 끝
</script>

</head>
<body>
<div class="containner">
	<form action="update.do" method="post">
	<h3>notice updateForm</h3>
		<table class="table">
			<!-- tr : table row - 테이블 한줄 -->
			<!-- 게시판 데이터의 제목 -->
			<tr>
				<th>번호</th> <!-- no는 수정 불가 -->
				<td>
					<input id="no" name="no" readonly value="${vo.no }"
					class="form-control">
					
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input id="title" name="title" required 
						class="form-control" maxlength="100"
						pattern="^[^ .].{2,99}$" value="${vo.title }"
						title="맨앞에 공백문자 불가. 3~100자 입력"
						placeholder="제목 입력 : 3자 이상 100자 이내"
					>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea class="form-control" id="content" name="content"  required
					rows="7" placeholder="첫글자는 공백문자나 줄바꿈을 입력할 수 없습니다."
					>${vo.content }</textarea>
				</td>
			</tr>
			
			
			<tr>
		 <th>게시일</th>
		 <td>
                <input id="startDate" name="startDate" required autocomplete="off" 
                class="form-control datepicker" value="${vo.startDate}">
           </td>
            </tr>
		
		
		<tr>
		 <th>종료일</th>
		 <td>
                <input id="endDate" name="endDate" required autocomplete="off" 
                class="form-control datepicker" value="${vo.endDate}">
          </td>
            </tr>
		
			
			<tr>
			    <td colspan="2">
			        <!-- a tag : 데이터를 클릭하면 href의 정보를 가져와서 페이지 이동시킨다. -->
			        <button class="btn btn-primary">수정</button>
			        <button type="reset" class="btn btn-secondary">다시입력</button>
			        <button type="button" class="btn btn-warning" onclick="history.back();">취소</button>
			    </td>
			</tr>

		</table>
	</form>
</div>
</body>
</html>