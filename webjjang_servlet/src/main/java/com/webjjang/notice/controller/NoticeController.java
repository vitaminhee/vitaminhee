package com.webjjang.notice.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.webjjang.main.controller.Init;
import com.webjjang.notice.vo.NoticeVO;
import com.webjjang.util.exe.Execute;
import com.webjjang.util.page.PageObject;

// Notice Module 에 맞는 메뉴 선택 , 데이터 수집(기능별), 예외 처리
public class NoticeController {

	public String execute(HttpServletRequest request) {
		// 게시판 기능 무한 반복

			// uri
			String uri = request.getRequestURI();
			// 처리결과를 화면에 표시하기 위해서 필요
			HttpSession session = request.getSession();
			
			Object result = null;
			
			String jsp = null;
			
			// 입력 받는 데이터 선언
			Long no = 0L;
			
			try { // 정상 처리
			
				// 메뉴 처리 : CRUD DB 처리 - Controller - Service - DAO
				switch (uri) {
				  case "/notice/list.do":
			            // [BoardController] - (Execute) - BoardListService - BoardDAO.list()
			            System.out.println("1.공지사항 리스트");
			            // 페이지 처리를 위한 객체
			            // getInstance - 기본 값이 있고 넘어오는 페이지와 검색 정보를 세팅 처리
			            PageObject pageObject = PageObject.getInstance(request);
			            // DB에서 데이터 가져오기 - 가져온 데이터는 List<BoardVO>
			            result = Execute.execute(Init.get(uri), pageObject);
			            
			            // pageObject 데이터 확인
			            System.out.println("NoticeController.execute().pageObject = " + pageObject);
			            // 가져온 데이터 request에 저장 -> jsp까지 전달된다.
			            request.setAttribute("list", result);
			            // pageObject 담기
			            request.setAttribute("pageObject", pageObject);
			            // /WEB-INF/views/ + board/list + .jsp
			            jsp = "notice/list";
			            break;
			            
			         case "/notice/view.do":
			            System.out.println("2.공지사항 글 보기");
			            // 1. 조회수 1증가(글보기), 2. 일반게시판 글보기 데이터 가져오기 : 글보기, 글수정
			            // 넘어오는 글번호와 조회수 1증가를 수집한다.(request에 들어 있다.)
			            String strNo = request.getParameter("no");
			            no = Long.parseLong(strNo);
			            // 전달 데이터 - 글번호, 조회수 증가 여부(1:증가, 0:증가 안함) : 배열 또는 Map
			            result = Execute.execute(Init.get(uri), no);
			            // 가져온 데이터를 JSP로 보내기 위해서 request에 담는다.
			            request.setAttribute("vo", result);
			            
			            jsp = "notice/view";
			            break;
			            
			         case "/notice/writeForm.do":
			        	 System.out.println("3-1.공지사항 글 등록 폼");
							jsp="notice/writeForm";
							break;
					
				case "/notice/write.do":
					System.out.println("3.공지사항 글 등록");
					
					// 데이터 수집 - 사용자 : 제목, 내용, 작성자, 비밀번호
					// jsp에 있는 메서드 그대로..
					String title = request.getParameter("title");
					String content = request.getParameter("content");
					String startDate = request.getParameter("startDate");
					String endDate = request.getParameter("endDate");
					
					
					// 변수 - vo 저장하고 Service
					NoticeVO vo = new NoticeVO();
					vo.setTitle(title);
					vo.setContent(content);
					vo.setStartDate(startDate);
					vo.setEndDate(endDate);
					
					
					// [NoticeController] - NoticeWriteService - NoticeDAO.write(vo)
					result = Execute.execute(Init.get(uri), vo);
					
					session.setAttribute("msg", "공지 등록 완료");
					
					jsp = "redirect:list.do"; // 등록했으니까 목록으로 돌아가야제
					break;
					
					
				case "/notice/updateForm.do":
		        	 System.out.println("3-1.공지사항 글 수정 폼");
		        	 /// 수정할 글 번호를 받 - 데이터 수집
		        	 no = Long.parseLong(request.getParameter("no")); // 위에 long type no가 있으므로 타입은 안씀
		        	 
		        	 
		        	 result = Execute.execute(Init.get("/notice/view.do"), no);
		        	// 가져온 데이터를 JSP로 보내기 위해서 request에 담는다.
			            request.setAttribute("vo", result);
			            
		        	 jsp="notice/updateForm";
						break;
						
				case "/notice/update.do":
					System.out.println("4.공지사항 글 수정");
					
					// 수정할 글번호를 받는다. - 데이터 수집
					no = Long.parseLong(request.getParameter("no"));
					title = request.getParameter("title");
					content = request.getParameter("content");
					startDate = request.getParameter("startDate");
					endDate = request.getParameter("endDate");
					
					
					// 변수 - vo 저장하고 Service
					vo = new NoticeVO();
					vo.setNo(no);
					vo.setTitle(title);
					vo.setContent(content);
					vo.setStartDate(startDate);
					vo.setEndDate(endDate);
					
					
					// 수정할 데이터 가져오기 - 글보기 - NoticeViewService
					// DB에서 데이터 수정 - NoticeUpdaeService
					result= Execute.execute(Init.get(uri),vo);
					
					pageObject = PageObject.getInstance(request); //jsp로 받아오기 전에 선언
					
					session.setAttribute("msg", "공지 수정 완료");
					
					jsp = "redirect:list.do?no="+ no +
							 "&" + pageObject.getPageQuery();
					
					break;
				case "/notice/delete.do":
					System.out.println("5.공지사항 글 삭제");
					// 데이터 수집 - DB에서 실행에 필요한 데이터 - 글번호
					no = Long.parseLong(request.getParameter("no"));
					
					// DB 처리
					result= Execute.execute(Init.get(uri),no);
					
					session.setAttribute("msg", "공지 삭제 완");
					
					jsp = "redirect:list.do"; // 삭제했으니까 리스트로. 리다이렉트 안하면 500 error 발생..
					
					break;
					
	
				default:
					jsp = "error/404";
					break;
				} // end of switch
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				
				request.setAttribute("e", e); // e(예외)를 jsp에 보내서 표시
				
				jsp = "error/500";
			} // end of try~catch
			return jsp;
	} // end of main()
	
} // end of class
