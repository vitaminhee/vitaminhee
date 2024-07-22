package com.webjjang.ajax.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.webjjang.main.controller.Init;
import com.webjjang.member.vo.LoginVO;
import com.webjjang.util.exe.Execute;


// Member Module 에 맞는 메뉴 선택 , 데이터 수집(기능별), 예외 처리
public class AjaxController {

	public String execute(HttpServletRequest request) {
		System.out.println("AjaxController.execute() --------------------------");
		
		// login된 정보 중에서 id를 많이 사용한다.
		String id = null;
		
		// uri
		String uri = request.getRequestURI();
		
		String jsp = null; // return 되는 jsp 정보
		
		// session 꺼내기
		HttpSession session = request.getSession(); 
		
		// 로그인 정보 꺼내기
		LoginVO loginVO = (LoginVO) session.getAttribute("login");
		if(loginVO !=null) id = loginVO.getId(); // loginvo가 null이 아니면 id를 꺼내오자
	
		try { // 정상 처리
		
			// 메뉴 처리 : CRUD DB 처리 - Controller - Service - DAO
			switch (uri) {
				
			case "/ajax/checkId.do":
				System.out.println("1. 아이디 중복 체크처리");
				
				// 데이터 수집(사용자->서버 : form - input - name)
				id = request.getParameter("id");
				
				// 서버에서 가져온 id
				// [MemberController] - MembercheckIdService - MemberDAO.checkId(id)
				id = (String) Execute.execute(Init.get(uri), id);
				
				request.setAttribute("id", id);
				// 데이터 수집 id와 서버에서 가져온 id는 당연히 다름.
				
				// jsp 정보. ajax는 오류 발생 시 보이지 않는 문제... 경로 잘 찾기
				jsp = "ajax/checkId";
				
				break;
				
			case "/ajax/getNewMsgCnt.do":
				System.out.println("2. 새로운 메시지 가져오기");
				
				
				// id는 세션에서 받아야함
				
				
				// 서버에서 가져온 id
				// [AjaxController] - MemberNewMsgCntService - MemberDAO.getNewMsgCnt(id)
				Long result = (Long) Execute.execute(Init.get(uri), id); // long 타입으로 캐스팅
				
				request.setAttribute("NewMsgCnt", result);
				// 데이터 수집 id와 서버에서 가져온 id는 당연히 다름.
				
				// jsp 정보. ajax는 오류 발생 시 보이지 않는 문제... 경로 잘 찾기
				jsp = "member/NewMsgCnt";
				
				break;
				
			default:
				jsp = "error/noModule_404";
				break;
			} // end of switch
		} catch (Exception e) {
			// TODO: handle exception
			// e.printStackTrace();
			request.setAttribute("e", e);
			
			jsp = "error/noModule_500";
		} // end of try~catch
		return jsp;
	} // end of execute()
	
} // end of class
