package jisang.poyong.controller;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		return "redirect:/SignIn.do";
	}

	// 기업 회원가입
	@PostMapping("/SignUp3.do")
	public String BusinessSignUp(UserVO vo) {
		try {
			mapper.BusinessSignUp(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/SignIn.do";
	}
	//로그인
	@PostMapping("/SignIn2.do")
	public String SignIn(UserVO vo, HttpServletRequest request, Model model) {
	    System.out.println("요청받음");
	    UserVO SignIn = mapper.SignIn(vo);
	    HttpSession session = request.getSession();

	    if (SignIn != null) {
	        session.setAttribute("SignIn", SignIn);
	        session.setAttribute("userid", SignIn.getUserid()); // 세션에 사용자 아이디 저장
	        System.out.println("성공");
	        return "redirect:/ChatPage.do";
	    } else {
	        session.setAttribute("SignIn", null);
	        System.out.println("실패");
	        session.setAttribute("errorMessage", "로그인에 실패했습니다. 다시 확인해주세요.");
	        return "redirect:/SignIn.do";
	    }
	}

	// 로그아웃
	@RequestMapping("/Logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/SignIn.do";
	}

}
