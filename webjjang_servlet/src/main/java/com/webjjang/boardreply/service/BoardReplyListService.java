package com.webjjang.boardreply.service;

import java.util.List;

import com.webjjang.board.dao.BoardDAO;
import com.webjjang.board.vo.BoardVO;
import com.webjjang.boardreply.dao.BoardReplyDAO;
import com.webjjang.boardreply.vo.BoardReplyVO;
import com.webjjang.main.dao.DAO;
import com.webjjang.main.service.Service;
import com.webjjang.util.page.PageObject;
import com.webjjang.util.page.ReplyPageObject;

public class BoardReplyListService implements Service {
	private BoardReplyDAO dao;
	
	// dao setter(집어놓)
	public void setDAO(DAO dao) {
		this.dao = (BoardReplyDAO) dao; // 자식 class이므로 캐스팅
	}
	
	@Override
	public List<BoardReplyVO> service(Object obj) throws Exception {
		
		
		ReplyPageObject pageObject = (ReplyPageObject) obj;
		// DB board_Reply에서 리스트 쿼리 실행해서 데이터 가져오기 - 리턴
		
		// 전체 데이터의 개수
		pageObject.setTotalRow(dao.getTotalRow(pageObject));
		
		
		// DB 처리는 DAO에서 처리 - BoardReplyDAO.list()
		// BoardController - (Execute) - [BoardReplyListService] - BoardReplyDAO.list()
		return dao.list(pageObject);
	}

}
