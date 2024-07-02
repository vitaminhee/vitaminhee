package com.webjjang.member.service;

import com.webjjang.main.dao.DAO;
import com.webjjang.main.service.Service;
import com.webjjang.member.dao.MemberDAO;
import com.webjjang.member.vo.LoginVO;

public class MemberLoginService implements Service {

	private MemberDAO dao;
	
	// dao setter(집어놓)
	public void setDAO(DAO dao) {
		this.dao = (MemberDAO) dao; // 자식 class이므로 캐스팅
	}
	
	@Override
	public LoginVO service(Object obj) throws Exception {
		// DB 처리는 DAO에서 처리 - MemberDAO.login()
		// MemberController - (Execute) - [MemberLoginService] - MemberDAO.login()
		return dao.login((LoginVO) obj);
	}

}
