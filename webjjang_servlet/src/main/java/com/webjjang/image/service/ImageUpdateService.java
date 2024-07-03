package com.webjjang.image.service;

import com.webjjang.image.dao.ImageDAO;
import com.webjjang.image.vo.ImageVO;
import com.webjjang.main.dao.DAO;
import com.webjjang.main.service.Service;

public class ImageUpdateService implements Service {

	private ImageDAO dao;
	
	// dao setter(집어놓)
	public void setDAO(DAO dao) {
		this.dao = (ImageDAO) dao; // 자식 class이므로 캐스팅
	}
	@Override
	public Integer service(Object obj) throws Exception {
		// DB board에서 수정 쿼리 실행해서 데이터 처리
		// ImageController - (Execute) - [ImageUpdateService] - ImageDAO.update()
		return dao.update((ImageVO)obj);
	}

}
