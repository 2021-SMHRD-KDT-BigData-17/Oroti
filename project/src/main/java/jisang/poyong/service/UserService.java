package jisang.poyong.service;

import jisang.poyong.mapper.Mapper;
import jisang.poyong.vo.UserVO;

public class UserService {

	public static void signup(UserVO UserVO) {
		
		Mapper.SignUp(UserVO);
		
	}
	
}
