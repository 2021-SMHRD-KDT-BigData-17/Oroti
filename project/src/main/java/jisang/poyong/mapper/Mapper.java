package jisang.poyong.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;

import jisang.poyong.vo.UserVO;


public interface Mapper {

	static void SignUp(UserVO UserVO) {
		// TODO Auto-generated method stub
		
	}
	
}	 
//	// mapper.xml과 이름 일치 시킬 것
//	// java 코드와 SQL문 따로 관리하게 되면서 둘을 연결 시킴(mapping)

//	// 결과에 맞는 리턴 타입으로 지정
//	// xml에서 id와 일치 시키기!!!
//	public List<Board> boardList();
//
//	public void boardInsert(Board vo);
//
//	public Board boardContent(int theIdx);
//
//	public void boardDelete(int idx);
//
//	public void boardUpdate(Board vo);
//	
//	

