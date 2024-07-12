package com.webjjang.main.controller;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.webjjang.board.service.BoardDeleteService;
import com.webjjang.board.service.BoardListService;
import com.webjjang.board.service.BoardUpdateService;
import com.webjjang.board.service.BoardViewService;
import com.webjjang.board.service.BoardWriteService;
import com.webjjang.board.vo.BoardVO;
import com.webjjang.main.controller.Init;
import com.webjjang.member.vo.LoginVO;
import com.webjjang.util.page.PageObject;
import com.webjjang.util.page.ReplyPageObject;
import com.webjjang.util.exe.Execute;

// Main Module 에 맞는 메뉴 선택 , 데이터 수집(기능별), 예외 처리
public class MainController {

	public String execute(HttpServletRequest request) {
		System.out.println("MainController.execute() --------------------------");
		// uri
		String uri = request.getRequestURI();
		
		Object result = null;
		
		String jsp = null;
		
		HttpSession session =request.getSession();
		int gradeNo = 0;
		LoginVO login = (LoginVO) session.getAttribute("login");
		if (login != null) {
			gradeNo = login.getGradeNo();
		}
		
		
		try { // 정상 처리
		
			// 메뉴 처리 : CRUD DB 처리 - Controller - Service - DAO
			switch (uri) {
			case "/main/main.do":
				
				System.out.println("1.Main 처리");
				
				// 페이지 처리를 위한 객체 생성
				PageObject pageObject = new PageObject();
				
				if(gradeNo == 9) {
					pageObject.setPeriod("all");
				}
				else if(gradeNo == 9) {
					pageObject.setPeriod("pre");
				}
				
				// Main에 표시할 데이터 - 일반 게시판 / 이미지 게시판
				// DB에서 데이터 가져오기
				
				// notice
				pageObject.setPerPageNum(7);
				// [MainController] - (Execute) - NoticeListService - NoticeDAO.list()
				result = Execute.execute(Init.get("/notice/list.do"), pageObject);
				request.setAttribute("noticelist", result); // 가져온 데이터 request에 저장 -> jsp까지 전달된다.
				
				// 일반 게시판의 데이터를 몇 개를 가져올지.. setting
				pageObject.setPerPageNum(6);
				// [MainController] - (Execute) - BoardListService - BoardDAO.list()
				result = Execute.execute(Init.get("/board/list.do"), pageObject);
				request.setAttribute("boardlist", result); // 가져온 데이터 request에 저장 -> jsp까지 전달된다.
				
				
				// 이미지 게시판의 데이터를 몇 개를 가져올지.. setting
				pageObject.setPerPageNum(6);
				// [MainController] - (Execute) - ImageListService - ImageDAO.list()
				result = Execute.execute(Init.get("/image/list.do"), pageObject);
				request.setAttribute("imagelist", result); // 가져온 데이터 request에 저장 -> jsp까지 전달된다.
				
				// /WEB-INF/views/ + board/list + .jsp
				
				jsp = "main/main";
						
				break;
				
			default:
				jsp = "error/404";
				break;
			} // end of switch
		} catch (Exception e) {
			// TODO: handle exception
			// e.printStackTrace();
			jsp = "error/500";
			// 예외 객체를 jsp에서 사용하기 위해서 request에 담는다.
			// 넘어온 예외를 e로 담아 처리. Exception로 선언하면 충돌 발생
			request.setAttribute("e", e);
			
		
		} // end of try~catch
		return jsp;
	} // end of execute()
	
} // end of class
