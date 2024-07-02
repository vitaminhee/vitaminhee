package com.webjjang.boardreply.service;

import com.webjjang.boardreply.dao.BoardReplyDAO;
import com.webjjang.boardreply.vo.BoardReplyVO;
import com.webjjang.main.dao.DAO;
import com.webjjang.main.service.Service;

public class BoardReplyUpdateService implements Service {

	private BoardReplyDAO dao;
	
	// dao setter(집어놓)
	public void setDAO(DAO dao) {
		this.dao = (BoardReplyDAO) dao; // 자식 class이므로 캐스팅
	}
	@Override
	public Integer service(Object obj) throws Exception {
		// DB boardreply에서 수정 쿼리 실행해서 데이터 처리
		// BoardReplyReplyReplyController - (Execute) - [BoardReplyReplyReplyListService] - BoardReplyReplyReplyDAO.update()
		return dao.update((BoardReplyVO)obj);
	}

}
