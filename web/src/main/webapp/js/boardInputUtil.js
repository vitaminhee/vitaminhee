/**
 * 게시판 류의 필요한 처리 메서드
 */


console.log("[boardInputUtil.js] 파일 loading....");

 // 입력 데이터가 비어 있는 경우의 메서드
 // 비어 있다면 true를 리턴한다.
 // 결과가 true이면 페이지 이동을 막기위해서 추후에 return false를 실행해야 한다.
 // isEmpty(객체이름-선택자, 항목 이름){}
 // isTrim - trim을 할건지 여부.
 function isEmpty(objName, name, isTrim){ //생겨야 사용 가능
  console.log("objName=" + objName + "name=" + name + "isTrim=" + isTrim);
 //alert($(objName)); obj 찍어봐서 데이터가 잘 넘어갔는지 확인
 //alert($(val)); val 찍어봐서 데이터가 잘 넘어갔는지 확인

 //데이터가 잘 넘어갔는지 확인
	let str = $(objName).val(); //obj, value 찍
	if(isTrim == 1) str.trim(); //1이라면
	// 공백을 제거한 데이터를 입력 객체에 다시 넣는다.
	$(objName).val(str);
	if(str == "") {
		alert(name + "은(는) 반드시 입력하셔야 합니다."); // 경고
		$(objName).focus(); // 커서 위치
		return true; // 비어있음(true)을 리턴한다.
	} 
 } // end of isEmpty()
 
 // 길이 제한 메서드
 function lengthCheck(objName, name, min, max, isTrim ) {
	 console.log("objName=" + objName + 
	 "name=" + name + "isTrim=" + isTrim,
	 "min=" + min + "max=" + max);
 //alert($(objName)); obj 찍어봐서 데이터가 잘 넘어갔는지 확인
 //alert($(val)); val 찍어봐서 데이터가 잘 넘어갔는지 확인

	let str = $(objName).val(); //obj, value 찍
	if(isTrim == 1){ 
		str.trim(); //1이라면
	// 공백을 제거한 데이터를 입력 객체에 다시 넣는다.
	$(objName).val(str);
	}
	
	let len = str.length; 
	if(len < min || len > max) { //min(3)보다 크거나 max(20)보다 작다
		alert(name + "은(는) "+ min+" 자부터 "+ max+"자까지 입력하셔야 합니다."); // 경고
		$(objName).focus(); // 커서 위치
		return true; // 비어있음(true)을 리턴한다.
		
	} 
 } //lengthCheck() : 길이 제한 메서드 끝
 
 // body 부분의 문서가 로딩이 끝나면 처리되는 부분
 $(function(){
	$(".cancelBtn").click(function(){
		history.back();
 });
  });