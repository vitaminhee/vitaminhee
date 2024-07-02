package com.webjjang.image.controller;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.webjjang.board.service.BoardDeleteService;
import com.webjjang.board.service.BoardListService;
import com.webjjang.board.service.BoardUpdateService;
import com.webjjang.board.service.BoardViewService;
import com.webjjang.board.service.BoardWriteService;
import com.webjjang.board.vo.BoardVO;
import com.webjjang.image.vo.ImageVO;
import com.webjjang.main.controller.Init;
import com.webjjang.member.vo.LoginVO;
import com.webjjang.util.page.PageObject;
import com.webjjang.util.page.ReplyPageObject;
import com.webjjang.util.exe.Execute;

// Board Module 에 맞는 메뉴 선택 , 데이터 수집(기능별), 예외 처리
public class ImageController {

	

	public String execute(HttpServletRequest request) {
		System.out.println("BoardController.execute() --------------------------");
		HttpSession session = request.getSession();
		// uri
		String uri = request.getRequestURI();
		
		Object result = null;
		
		String jsp = null;
		
		// 로그인 아이디 꺼내기
		HttpSession httpsession = request.getSession(); // 현재 요청에 대한 세션을 가져옴.
		// 세션에서 "login"이라는 이름으로 저장된 객체를 가져와 LoginVO 타입으로 캐스팅.
		LoginVO loginVO = (LoginVO) httpsession.getAttribute("login"); 


		String id = null; // id 변수를 선언하고 초기화.
		// loginVO 객체가 null이 아닌 경우(즉, 로그인이 된 경우)에만 
		//loginVO 객체에서 사용자 ID를 꺼내와 id 변수에 저장
		if (loginVO != null) id = loginVO.getId(); 

		// 파일 업로드 설정-------------------
		// 파일의 상대적인 저장 위치를 지정.
		String savePath = "/upload/image"; // 이 경로는 웹 애플리케이션 내에서의 상대 경로.

		// 파일 시스템에서는 절대 저장 위치가 필요. - 파일 업로드 시 필요!
		// Servlet을 상속받은 클래스가 아니므로 
		// ServletContext()에서 절대 경로를 가져옴.
		// realSavePath 변수에는 실제 파일이 저장될 서버 상의 절대 경로가 저장.
		// savePath의 실제 파일 시스템 상의 절대 경로를
		String realSavePath = request.getServletContext().getRealPath(savePath); 

		
		// 업로드 파일 용량 제한
		int sizeLimit = 100 * 1024 * 1024;
		
		
		
		// 입력 받는 데이터 선언
		Long no = 0L;
		
		try { // 정상 처리
		
			// 메뉴 처리 : CRUD DB 처리 - Controller - Service - DAO
			switch (uri) {
			case "/image/list.do":
				// [BoardController] - (Execute) - BoardListService - BoardDAO.list()
				System.out.println("1.이미지 게시판 리스트");
				// 페이지 처리를 위한 객체
				// getInstance - 기본 값이 있고 넘어오는 페이지와 검색 정보를 세팅 처리
				PageObject pageObject = PageObject.getInstance(request);
				
				// 이미지 게시판의 한 페이지 이미지의 개수의 기본값을 6으로 처리하쟈 - 중복 처리
				// 중복처리를 하는 것 - 앞의 데이터에 덮어쓰기 된다.
				// 이미 데이터는 있지만 앞에 있는 데이터의 변수는 지우고 뒤의 데이터는 저장한다..
				String strPerPageNum = request.getParameter("perPageNum");
				if(strPerPageNum == null) pageObject.setPerPageNum(6); // 안 들어오는 경우 6으로 처리
				
				System.out.println(pageObject);
				// DB에서 데이터 가져오기 - 가져온 데이터는 List<BoardVO>
				result = Execute.execute(Init.get(uri), pageObject);
				System.out.println(result);
				// pageObject 데이터 확인
				System.out.println("ImageController.execute().pageObject = " + pageObject);
				// 가져온 데이터 request에 저장 -> jsp까지 전달된다.
				request.setAttribute("list", result);
				// pageObject 담기
				request.setAttribute("pageObject", pageObject);
				// /WEB-INF/views/ + image/list + .jsp
				
				jsp = "image/list";
				
				
				break;
			case "/image/view.do":
				System.out.println("2.이미지 게시판 글보기");
				// 1. 조회수 1증가(글보기), 2. 이미지 게시판 글보기 데이터 가져오기 : 글보기, 글수정
				// 넘어오는 글번호와 조회수 1증가를 수집한다.(request에 들어 있다.)
				String strNo = request.getParameter("no");
				no = Long.parseLong(strNo);
				String strInc = request.getParameter("inc");
				Long inc = Long.parseLong(strInc);
				// 전달 데이터 - 글번호, 조회수 증가 여부(1:증가, 0:증가 안함) : 배열 또는 Map
				result = Execute.execute(Init.get(uri),
						new Long[]{no, inc});
				// 가져온 데이터를 JSP로 보내기 위해서 request에 담는다.
				request.setAttribute("vo", result);
				
				// 댓글 페이지 객체
				// 데이터 전달 - page / perPageNum / no / replyPage / replyPerPageNum 
				//ReplyPageObject replyPageObject = new ReplyPageObject(request); --pageobject2 기준
				
				ReplyPageObject replyPageObject = ReplyPageObject.getInstance(request);
				// 가져온 댓글 데이터 request에 담기
				request.setAttribute("replyList",
						Execute.execute(Init.get("/imagereply/list.do"),replyPageObject));
				// 댓글 페이지 객체 담기
				request.setAttribute("replyPageObject", replyPageObject);
				
				
				
				// 일반 게시판 글보기
				jsp = "image/view";
				break;
				
			case "/image/writeForm.do":
				System.out.println("3-1.이미지 게시판 등록 폼");
				jsp="image/writeForm";
				break;
			case "/image/write.do":
				System.out.println("3.이미지 게시판 등록 처리");
				
						
				// 이미지 업로드 처리
				// MutipartRequest(request, 실제 저장위치, 사이즈 제한 , encoding, 중복처리 객체);
				// 중복 처리 객체는 파일 이름 뒤에 cnt를 붙임. 1,2,3,4..
				MultipartRequest multi = 
						new MultipartRequest(request, realSavePath, sizeLimit ,
								"utf-8", new DefaultFileRenamePolicy());
				
				
				// 일반 데이터 수집 (사용자->서버 : form - input - name)
				// : multi.getParameter에서!!
				String title = multi.getParameter("title");
				String content = multi.getParameter("content");
				String fileName = multi.getFilesystemName("imagefile");
				// id는 session에서 받아야한다. -> 위에서 id라는 변수로 처리함
				
				
				// 변수 - vo 저장하고 Service
				ImageVO vo = new ImageVO();
				vo.setTitle(title);
				vo.setContent(content);
				vo.setId(id);
				// fileName은 위치 정보 + 파일명
				vo.setFileName(savePath + "/" + fileName); // 위치 정보도 저장이 되어야 한다.
				// String savePath = "/upload/image/"; 이렇게 해도 위치정보가 저장됨
				
				// [ImageController] - ImageWriteService - ImageDAO.write(vo)
				Execute.execute(Init.get(uri), vo);
				
				// 메시지 보내기. 1번만 쓰고 버리는 용. 모달창을 띄우고 삭제되는..
				session.setAttribute("msg", "이미지가 등록되었습니다.");
				
				
				// jsp 정보 앞에 "redirect:"가 붙어 있어 redirect를
				// 아니면 jsp로 forward로 시킨다.
				// perPageNum을 붙여서 넘김.
				// request에서 데이터를 꺼낼 수 없으므로 jsp가 null이 됨.
				// perPageNum의 uri이 null값이다..
				// multi를 사용하는 순간 request의 정보가 다 사라짐.
				jsp = "redirect:list.do?perPageNum=" 
				+ multi.getParameter("perPageNum");
				
				httpsession.setAttribute("msg", "이미지 등록 완료!");
				break;
				
				
			case "/image/updateForm.do":
				System.out.println("4-1.이미지 게시판 수정 폼");
				
				// 사 -> 서버 : 글번호
				no = Long.parseLong(request.getParameter("no"));
				
				// no맞는 데이터 DB에서 가져온다. BoardViewService
				result = Execute.execute(Init.get("/image/view.do"),
						new Long[]{no, 0L});
				// 가져온 데이터를 JSP로 보내기 위해서 request에 담는다.
				request.setAttribute("vo", result);
				
				// jsp 정보
				jsp = "board/updateForm";
				
				break;
			case "/image/update.do":
				System.out.println("4-2.이미지 게시판 글수정 처리");
				
				// 데이터 수집(사용자->서버 : form - input - name)
				no = Long.parseLong(request.getParameter("no"));
				title = request.getParameter("title");
				content = request.getParameter("content");
				
				// 변수 - vo 저장하고 Service
				vo = new ImageVO();
				vo.setNo(no);
				vo.setTitle(title);
				vo.setContent(content);
				
				
				// DB 적용하는 처리문 작성. BoardUpdateservice
				Execute.execute(Init.get(uri), vo);
				
				// 페이지 정보 받기 & uri에 붙이기
				pageObject = PageObject.getInstance(request);
				// 글보기로 자동 이동 -> jsp 정보를 작성해서 넘긴다.
				jsp = "redirect:view.do?no=" + no + "&inc=0"
						+ "&" + pageObject.getPageQuery();
				httpsession.setAttribute("msg", "글 수정 완료!");
				
				break;
			case "/image/delete.do":
				System.out.println("5.이미지 게시판 글삭제");
				// 데이터 수집 - DB에서 실행에 필요한 데이터 - 글번호, 비밀번호 - BoardVO
				
				no = Long.parseLong(request.getParameter("no"));
				
				BoardVO deleteVO = new BoardVO();
				deleteVO.setNo(no);
				
				// DB 처리
				Execute.execute(Init.get(uri), deleteVO);
				System.out.println();
				System.out.println("***************************");
				System.out.println("**  " + deleteVO.getNo()+ "글이 삭제되었습니다.  **");
				System.out.println("***************************");
				
				jsp = "redirect:list.do?perPageNum=" 
						+ request.getParameter("perPageNum");
				
				httpsession.setAttribute("msg", "글 삭제 완료!");
				
				break;
			case "0":
				
			default:
				System.out.println("####################################");;
				System.out.println("## 잘못된 메뉴를 선택하셨습니다.          ##");;
				System.out.println("## [0~5, 0] 중에서 입력하셔야 합니다.    ##");;
				System.out.println("####################################");;
				break;
			} // end of switch
		} catch (Exception e) {
			// TODO: handle exception
			// e.printStackTrace();
			System.out.println();
			System.out.println("$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@");
			System.out.println("$%@ << 오류 출력 >>                         $%@");
			System.out.println("$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@");
			System.out.println("$%@ 타입 : " + e.getClass().getSimpleName());
			System.out.println("$%@ 내용 : " + e.getMessage());
			System.out.println("$%@ 조치 : 데이터를 확인 후 다시 실행해 보세요.");
			System.out.println("$%@     : 계속 오류가 나면 전산담당자에게 연락하세요.");
			System.out.println("$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@");
		} // end of try~catch
		return jsp;
	} // end of execute()
	
} // end of class
