package jisang.poyong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import jisang.poyong.service.UserService;
import jisang.poyong.vo.UserVO;


//@Controller
public class UserController {
	
	@Autowired
	
	
	
//	@GetMapping("/SignUp")
//	public String SignupPage() {
//		return "SignUp";
//	}
	
	@PostMapping("/SignUp")
	public String signup(UserVO UserVO) {
		
		try {
			UserService.signup(UserVO);
		} catch(DuplicateKeyException e){
			return "redirect:/SignUp";
		}catch(Exception e) {
			e.printStackTrace();
			return "redirect:/SignUp";
		} 
		
		return "redirect:/SignIn";// 회원가입
		
	}

}
