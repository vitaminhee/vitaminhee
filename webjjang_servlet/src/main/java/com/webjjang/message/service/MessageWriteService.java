package com.webjjang.message.service;

import com.webjjang.main.dao.DAO;
import com.webjjang.main.service.Service;
import com.webjjang.message.dao.MessageDAO;
import com.webjjang.message.vo.MessageVO;

public class MessageWriteService implements Service {
	private MessageDAO dao;
	
	// dao setter(집어놓)
	public void setDAO(DAO dao) {
		this.dao = (MessageDAO) dao; // 자식 class이므로 캐스팅
	}
	@Override
	public Integer service(Object obj) throws Exception {
		MessageVO vo = (MessageVO) obj; // obj를 넣어야함
		
		// DB 처리는 DAO에서 처리 - MessageDAO.write()
		// MessageController - (Execute) - [MessageWriteService] - MessageDAO.write()
		Integer result = dao.write(vo);
		
		// 받는 사람의 새로운 메시지 1 증가 처리
		dao.increaseNewMsgCnt(vo.getAccepterId()); // id로 받아서 처리
		
		return result;
	}

}
