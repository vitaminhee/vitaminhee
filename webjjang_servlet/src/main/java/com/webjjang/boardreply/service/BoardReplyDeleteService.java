package com.webjjang.boardreply.service;

import com.webjjang.boardreply.dao.BoardReplyDAO;
import com.webjjang.boardreply.vo.BoardReplyVO;
import com.webjjang.main.dao.DAO;
import com.webjjang.main.service.Service;

public class BoardReplyDeleteService implements Service {

	private BoardReplyDAO dao;
	
	// dao setter(집어놓)
	public void setDAO(DAO dao) {
		this.dao = (BoardReplyDAO) dao; // 자식 class이므로 캐스팅
	}
	
	@Override
	public Integer service(Object obj) throws Exception {
		// DB board에서 리스트 쿼리 실행해서 데이터 가져오기 - 리턴
		// DB 처리는 DAO에서 처리 - BoardDAO.delete()
		// BoardController - (Execute) - [BoarddeleteService] - BoardreplyDAO.delete()
		return dao.delete((BoardReplyVO)obj);
	}

	

}
