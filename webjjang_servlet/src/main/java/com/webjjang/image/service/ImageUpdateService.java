package com.webjjang.image.service;

import com.webjjang.board.dao.BoardDAO;
import com.webjjang.board.vo.BoardVO;
import com.webjjang.main.dao.DAO;
import com.webjjang.main.service.Service;

public class ImageUpdateService implements Service {

	private BoardDAO dao;
	
	// dao setter(집어놓)
	public void setDAO(DAO dao) {
		this.dao = (BoardDAO) dao; // 자식 class이므로 캐스팅
	}
	@Override
	public Integer service(Object obj) throws Exception {
		// DB board에서 수정 쿼리 실행해서 데이터 처리
		// BoardController - (Execute) - [BoardListService] - BoardDAO.update()
		return dao.update((BoardVO)obj);
	}

}
