package com.webjjang.message.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.webjjang.board.vo.BoardVO;
import com.webjjang.main.dao.DAO;
import com.webjjang.message.vo.MessageVO;
import com.webjjang.util.db.DB;
import com.webjjang.util.page.PageObject;

public class MessageDAO extends DAO{

	// 필요한 객체 선언 - 상속
	// 접속 정보 - DB 사용 - connection을 가져오게 하는 메서드만 이용
	
	// 1-1. 리스트 처리
	// MessageController - (Execute) - MessageListService - [MessageDAO.list()]
	public List<MessageVO> list(PageObject pageObject) throws Exception{
		// 결과를 저장할 수 있는 변수 선언.
		List<MessageVO> list = null;
		
		try {
			// 1. 드라이버 확인 - DB
			// 2. 연결
			con = DB.getConnection();
			// 3. sql - 아래 LIST - 콘솔 확인하고 여기에 쿼리에 해당되는 LIST 출력해 본다.
			// 4. 실행 객체 & 데이터 세팅
			// pstmt = con.prepareStatement(LIST);
			pstmt = con.prepareStatement(getListSQL(pageObject));
			// 검색에 대한 데이터 세팅 - list()만 사용
			int idx = 0; // pstmt의 순서번호 사용. 먼저 1 증가하고 사용한다.
			
			// 메시지 본인 정보 세팅 - 모드 데이터 세팅
			// data 세팅이 잘못되서 넣는 로직..
			pstmt.setString(++idx, pageObject.getAccepter());
			if(pageObject.getAcceptMode()==3)
				pstmt.setString(++idx, pageObject.getAccepter());
							
			// 검색 데이터 세팅
			idx = setSearchData(pageObject, pstmt, idx);
			// 페이지 처리
			pstmt.setLong(++idx, pageObject.getStartRow()); // 기본 값 = 1
			pstmt.setLong(++idx, pageObject.getEndRow()); // 기본 값 = 10
			// 5. 실행
			rs = pstmt.executeQuery();
			// 6. 표시 또는 담기
			if(rs != null) {
				while(rs.next()) {
					// rs - > vo -> list
					// list가 null이면 생성해서 저장할 수 있게 해줘야 한다.
					if(list == null) list = new ArrayList<MessageVO>();
					// rs -> vo
					MessageVO vo = new MessageVO();
					vo.setNo(rs.getLong("no"));
					vo.setSenderId(rs.getString("SenderId"));
					vo.setSenderName(rs.getString("SenderName"));
					vo.setSenderPhoto(rs.getString("SenderPhoto"));
					vo.setSendDate(rs.getString("sendDate"));
					vo.setAccepterId(rs.getString("AccepterId"));
					vo.setAccepterName(rs.getString("AccepterName"));
					vo.setAccepterPhoto(rs.getString("AccepterPhoto"));
					vo.setAcceptDate(rs.getString("acceptDate"));
					
					// vo -> list
					list.add(vo);
				} // end of while
			} // end of if
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			// 7. 닫기
			DB.close(con, pstmt, rs);
		} // end of try ~ catch ~ finally
		
		// 결과 데이터를 리턴해 준다.
		return list;
	} // end of list()
	
	
	// 1-2. 전체 데이터 개수 처리
	// MessageController - (Execute) - MessageListService - [MessageDAO.getTotalRow()]
	public Long getTotalRow(PageObject pageObject) throws Exception{
		// 결과를 저장할 수 있는 변수 선언.
		Long totalRow = null;
		try {
			// 1. 드라이버 확인 - DB
			// 2. 연결
			con = DB.getConnection();
			// 3. sql - 아래 LIST
			System.out.println("messagedao.getTotalRow().sql=" + TOTALROW + getModeSql(pageObject) + getSearch(pageObject));
			// 4. 실행 객체 & 데이터 세팅
			pstmt = con.prepareStatement(
					TOTALROW + getModeSql(pageObject) + getSearch(pageObject));
			int idx = 0;
			// data 세팅이 잘못되서 넣는 로직..
			pstmt.setString(++idx, pageObject.getAccepter());
			if(pageObject.getAcceptMode()==3)
				pstmt.setString(++idx, pageObject.getAccepter());
				
			idx = setSearchData(pageObject, pstmt, idx);
			// 5. 실행
			rs = pstmt.executeQuery();
			// 6. 표시 또는 담기
			if(rs != null && rs.next()) {
				totalRow = rs.getLong(1); // 첫 번째 데이터를 불러오자
			} // end of if
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			// 7. 닫기
			DB.close(con, pstmt, rs);
		} // end of try ~ catch ~ finally

		// 결과 데이터를 리턴해 준다.
		return totalRow;
	} // end of getTotalRow()
	
	// 2-1. 글보기 조회수 1증가 처리
	// BoardController - (Execute) - BoardViewService - [BoardDAO.increase()]
	public int increase(Long no) throws Exception{
		// 결과를 저장할 수 있는 변수 선언.
		int result = 0;
		
		try {
			// 1. 드라이버 확인 - DB
			// 2. 연결
			con = DB.getConnection();
			// 3. sql - 아래 LIST
			// 4. 실행 객체 & 데이터 세팅
			pstmt = con.prepareStatement(INCREASE);
			pstmt.setLong(1, no);
			// 5. 실행 - update : executeUpdate() -> int 결과가 나옴.
			result = pstmt.executeUpdate();
			// 6. 표시 또는 담기
			if(result == 0) { // 글번호가 존재하지 않는다. -> 예외로 처리한다.
				throw new Exception("예외 발생 : 글번호가 존재하지 않습니다. 글번호를 확인해 주세요.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			// 특별한 예외는 그냥 전달한다.
			if(e.getMessage().indexOf("예외 발생") >= 0) throw e;
			// 그외 처리 중 나타나는 오류에 대해서 사용자가 볼수 있는 예외로 만들어 전달한다.
			else throw new Exception("예외 발생 : 게시판 글보기 조회수 DB 처리 중 예외가 발생했습니다.");
		} finally {
			// 7. 닫기
			DB.close(con, pstmt);
		}
		
		// 결과 데이터를 리턴해 준다.
		return result;
	} // end of increase()
	
	// 2-2. 글보기 처리
	// BoardController - (Execute) - BoardListService - [BoardDAO.view()]
	public BoardVO view(Long no) throws Exception{
		// 결과를 저장할 수 있는 변수 선언.
		BoardVO vo = null;
		try {
			// 1. 드라이버 확인 - DB
			// 2. 연결
			con = DB.getConnection();
			// 3. sql - 아래 LIST
			// 4. 실행 객체 & 데이터 세팅
			pstmt = con.prepareStatement(VIEW);
			pstmt.setLong(1, no);
			// 5. 실행
			rs = pstmt.executeQuery();
			// 6. 표시 또는 담기
			if(rs != null && rs.next()) {
				// rs -> vo
				vo = new BoardVO();
				vo.setNo(rs.getLong("no"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setWriter(rs.getString("writer"));
				vo.setWriteDate(rs.getString("writeDate"));
				vo.setHit(rs.getLong("hit"));
			} // end of if
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("예외 발생 : 일반게시판의 글 보기 DB 처리 중 오류 발생");
		} finally {
			// 7. 닫기
			DB.close(con, pstmt, rs);
		} // end of try ~ catch ~ finally

		// 결과 데이터를 리턴해 준다.
		return vo;
	} // end of view()
	
	// 3. 글등록 처리
	// BoardController - (Execute) - BoardViewService - [BoardDAO.increase()]
	public int write(BoardVO vo) throws Exception{
		// 결과를 저장할 수 있는 변수 선언.
		int result = 0;
		
		try {
			// 1. 드라이버 확인 - DB
			// 2. 연결
			con = DB.getConnection();
			// 3. sql - 아래 LIST
			// 4. 실행 객체 & 데이터 세팅
			pstmt = con.prepareStatement(WRITE);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getWriter());
			pstmt.setString(4, vo.getPw());
			// 5. 실행 - update : executeUpdate() -> int 결과가 나옴.
			result = pstmt.executeUpdate();
			// 6. 표시 또는 담기
			System.out.println();
			System.out.println("*** 글 등록이 완료 되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
			// 그외 처리 중 나타나는 오류에 대해서 사용자가 볼수 있는 예외로 만들어 전달한다.
			throw new Exception("예외 발생 : 게시판 글등록 DB 처리 중 예외가 발생했습니다.");
		} finally {
			// 7. 닫기
			DB.close(con, pstmt);
		}
		
		// 결과 데이터를 리턴해 준다.
		return result;
	} // end of increase()
	
	
	// 4. 글수정 처리
	// BoardController - (Execute) - BoardViewService - [BoardDAO.update()]
	public int update(BoardVO vo) throws Exception{
		// 결과를 저장할 수 있는 변수 선언.
		int result = 0;
		
		try {
			// 1. 드라이버 확인 - DB
			// 2. 연결
			con = DB.getConnection();
			// 3. sql - 아래 UPDATE
			// 4. 실행 객체 & 데이터 세팅
			pstmt = con.prepareStatement(UPDATE);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getWriter());
			pstmt.setLong(4, vo.getNo());
			pstmt.setString(5, vo.getPw());
			// 5. 실행 - update : executeUpdate() -> int 결과가 나옴.
			result = pstmt.executeUpdate();
			// 6. 표시 또는 담기
			if(result == 0) { // 글번호가 존재하지 않는다. -> 예외로 처리한다.
				throw new Exception("예외 발생 : 글번호나 비밀번호가 맞지 않습니다. 정보를 확인해 주세요.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			// 특별한 예외는 그냥 전달한다.
			if(e.getMessage().indexOf("예외 발생") >= 0) throw e;
			// 그외 처리 중 나타나는 오류에 대해서 사용자가 볼수 있는 예외로 만들어 전달한다.
			else throw new Exception("예외 발생 : 게시판 글등록 DB 처리 중 예외가 발생했습니다.");
		} finally {
			// 7. 닫기
			DB.close(con, pstmt);
		}
		
		// 결과 데이터를 리턴해 준다.
		return result;
	} // end of update()
	
	
	// 5. 글삭제 처리
	// BoardController - (Execute) - BoardDeleteService - [BoardDAO.delete()]
	public int delete(BoardVO vo) throws Exception{
		// 결과를 저장할 수 있는 변수 선언.
		int result = 0;
		
		try {
			// 1. 드라이버 확인 - DB
			// 2. 연결
			con = DB.getConnection();
			// 3. sql - 아래 UPDATE
			// 4. 실행 객체 & 데이터 세팅
			pstmt = con.prepareStatement(DELETE);
			pstmt.setLong(1, vo.getNo());
			pstmt.setString(2, vo.getPw());
			// 5. 실행 - update : executeUpdate() -> int 결과가 나옴.
			result = pstmt.executeUpdate();
			// 6. 표시 또는 담기
			if(result == 0) { // 글번호가 존재하지 않거나 비번 틀림. -> 예외로 처리한다.
				throw new Exception("예외 발생 : 글번호나 비밀번호가 맞지 않습니다. 정보를 확인해 주세요.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			// 특별한 예외는 그냥 전달한다.
			if(e.getMessage().indexOf("예외 발생") >= 0) throw e;
			// 그외 처리 중 나타나는 오류에 대해서 사용자가 볼수 있는 예외로 만들어 전달한다.
			else throw new Exception("예외 발생 : 게시판 글삭제 DB 처리 중 예외가 발생했습니다.");
		} finally {
			// 7. 닫기
			DB.close(con, pstmt);
		}
		
		// 결과 데이터를 리턴해 준다.
		return result;
	} // end of delete()
	
	
	// 실행할 쿼리를 정의해 놓은 변수 선언.
	
	// 리스트의 페이지 처리 절차 - 원본 -> 순서 번호 -> 해당 페이지 데이터만 가져온다.
	
	final String LIST = "" 
			+ " select no, senderId, senderName, senderPhoto, sendDate, "
			+ "	accepterId, accepterName, accepterPhoto, acceptDate "
			+ " from ( "
				+ " select rownum rnum, no, "
				+ " senderId, senderName, senderPhoto, sendDate, "
				+ " accepterId, accepterName, accepterPhoto, acceptDate "
				+ " from ( "
					+ " select m.no, "
					+ " m.senderId, sm.name senderName, sm.photo senderPhoto, "
					+ " to_char(m.sendDate, 'yyyy-mm-dd') sendDate, "
					+ " m.accepterId, am.name accepterName, am.photo accepterPhoto, "
					+ " to_char(m.acceptDate, 'yyyy-mm-dd') acceptDate "
					+ " from message m, member sm, member am "
				// mode 조건 처리 + 검색 조건 처리가 필요. + join 조건 처리도 같이!
				
				
	;
	// 검색이 있는 경우 TOTALROW + search문. 본인 메시지만 찾을 수 있게끔
	// join은 없음
	final String TOTALROW = "select count(*) from message ";
	
	// LIST에 검색을 처리해서 만들지는 sql문 작성 메서드
	private String getListSQL(PageObject pageObject) {
		String sql = LIST; 
		
		// mode 조건 처리. 1 - 받은 메시지, 2 - 보낸 메시지, 3 - 모든 메시지
		sql += getModeSql(pageObject); // 여기선 mode는 필수! sql문이 좌우됨
		
		// 검색조건 처리
		sql += getSearch(pageObject); // 검색이 있으면
		
		// join 조건 처리
		sql += getJoin();
		
		// 리스트에 해당되는 것 join. view할 때도 따로따로..
		
		sql += " order by no desc" // 정렬을 하자
				+ " ) "
				+ " ) where rnum between ? and ? "; // 페이지 처리
		
		System.out.println("sql=" + sql);
		return sql;
	}
	
	
	// join 조건
	private String getJoin() {
	String sql = "";
	sql += " and ( ";
	sql += " m.accepterId = am.id and m.senderId = sm.id "; // 같다.
	sql += " ) ";
	return sql;
	}
		
		// 가져온 메시지 모드에 대한 조건 처리
		private String getModeSql(PageObject pageObject) {
			String sql = " where ( 1=0 "; // false
			
			int mode = pageObject.getAcceptMode(); // 꺼냈음
			// 1이면 accepterId만 붙고, 2면 senderId만 붙고
			// 3이면 둘 다 붙음
			// message 안에 있는 컬럼
			if(mode == 1 || mode == 3)  // mode가 1이거나 3	
				sql += " or accepterId = ? " ;
			if(mode == 2 || mode == 3)  // mode가 2이거나 3	
				sql += " or senderId = ? " ;
			
			
			
			sql += " ) ";
			return sql;

	}
	
	// 리스트의 검색만 처리하는 쿼리 - where. 아이디, 이름 검색..
	private String getSearch(PageObject pageObject) {
		String sql = "";
		String key = pageObject.getKey();
		String word = pageObject.getWord();
		if(word != null && !word.equals("")) {
			sql += " and ( 1=0 ";
		// key안에 t가 포함되어 있으면 title로 검색을 한다.
			if(key.indexOf("t") >= 0) sql += " or title like ? ";
			if(key.indexOf("c") >= 0) sql += " or content like ? ";
			if(key.indexOf("w") >= 0) sql += " or writer like ? ";
			
			sql += " ) " ;
		}
		return sql;
		
	}
	
	// 검색 쿼리의 ? 데이터를 세팅하는 메서드
	private int setSearchData(PageObject pageObject, 
			PreparedStatement pstmt, int idx) throws SQLException {
		String key = pageObject.getKey();
		String word = pageObject.getWord();
		if(word != null && !word.equals("")) {
			// key안에 t가 포함되어 있으면 title로 검색을 한다.
			if(key.indexOf("t") >= 0) pstmt.setString(++idx, "%" + word + "%");
			if(key.indexOf("c") >= 0) pstmt.setString(++idx, "%" + word + "%");
			if(key.indexOf("w") >= 0) pstmt.setString(++idx, "%" + word + "%");
		}
		return idx;
	}
	
	final String INCREASE = "update board set hit = hit + 1 "
			+ " where no = ?"; 
	final String VIEW= "select no, title, content, writer, "
			+ " to_char(writeDate, 'yyyy-mm-dd') writeDate, hit " // 원래는 hit 뒤에 ,를 붙이면 안됨.
			// 예외처리 오류를 확인하기 위해 ,을 찍어둔거임
			+ " from board "
			+ " where no = ?";
	final String WRITE = "insert into board "
			+ " (no, title, content, writer, pw) "
			+ " values(board_seq.nextval, ?, ?, ?, ?)"; 
	final String UPDATE= "update board "
			+ " set title = ?, content = ?, writer = ? "
			+ " where no = ? and pw = ?"; 
	final String DELETE= "delete from board "
			+ " where no = ? and pw = ?"; 
	
}
