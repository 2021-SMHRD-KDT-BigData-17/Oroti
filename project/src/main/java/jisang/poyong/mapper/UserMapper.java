package jisang.poyong.mapper;

import org.apache.ibatis.annotations.Mapper;

import jisang.poyong.vo.UserVO;

@Mapper
public interface UserMapper {


	
	
	public UserVO SignIn(UserVO vo);

	public UserVO UserSignUp(UserVO vo);
	
	public UserVO BusinessSignUp(UserVO vo);

	void UpdateUser(UserVO vo);
	
	void UpdateCompany(UserVO vo);
	
//	public void boardInsert(Board vo);
//
//	public Board boardContent(int theIdx);
//
//	public void boardDelete(int idx);
//
//	public void boardUpdate(Board vo);
	
}	 

