package jisang.poyong.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jisang.poyong.mapper.UserMapper;
import jisang.poyong.vo.UserVO;


@Controller
public class UserController {


	@Autowired
	private UserMapper mapper;
	
	// 개인 회원가입 
	@PostMapping("/SignUp2.do")
	public String UserSignUp(UserVO vo) {
		try {
			mapper.UserSignUp(vo);
		} catch (Exception e) {		
			e.printStackTrace();
		}
		return "redirect:/jisang/SignUp.do";
	}
	
	// 기업 회원가입
	@PostMapping("/SignUp3.do")
	public String BusinessSignUp(UserVO vo) {
		try {
			mapper.BusinessSignUp(vo);
		} catch (Exception e) {		
			e.printStackTrace();
		}
		return "redirect:/jisang/SignUp.do";
	}
	
	
	// 로그인
	@PostMapping("/SignIn2.do")
	public String SignIn(UserVO vo, HttpServletRequest request) {
		System.out.println("요청받음");
		UserVO SignIn = mapper.SignIn(vo);
		HttpSession session = request.getSession();
		
		if(SignIn != null) {
			session.setAttribute("SignIn", SignIn);
			System.out.println("성공");
			return "redirect:/jisang/SignUp.do";
		}else {
			session.setAttribute("SignIn", null);
			System.out.println("실패");
			return "redirect:/jisang/SignIn.do";
		}
		
	}
	
	
	// 로그아웃
	@RequestMapping("/Logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/jisang/SignIn.do";
	}
	
	
}
