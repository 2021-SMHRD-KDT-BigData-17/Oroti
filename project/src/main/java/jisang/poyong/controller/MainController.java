package jisang.poyong.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jisang.poyong.mapper.ChatMapper;
import jisang.poyong.mapper.NoticeMapper;
import jisang.poyong.vo.ChatVO;
import jisang.poyong.vo.NoticeVO;
import jisang.poyong.vo.UserVO;

@Controller
public class MainController {

	@Autowired
	private ChatMapper chatMapper;
	@Autowired
	private NoticeMapper noticeMapper;
	

	

	@RequestMapping("/MainPage.do")
	public String loadNoticeData(Model model) {
	List<NoticeVO> notices = noticeMapper.LoadNotice();

	model.addAttribute("notices", notices);

	// JSP 파일의 경로와 파일명을 리턴
	return "/jisang/Main"; // JSP 파일명을 리턴
	}
	
	
	@RequestMapping("/SignUp.do")
	public String SignUp() {

		return "/jisang/SignUp";

	}

	@RequestMapping("/Companyedit.do")
	public String Companyedit() {

		return "/jisang/companymyinfoedit";

	}
	
	@RequestMapping("/Useredit.do")
	public String Useredit() {
		
		return "/jisang/usermyinfoedit";
	}
	
	@RequestMapping("/SignIn.do")
	public String SignIn() {

		return "/jisang/SignIn";

	}

	@RequestMapping("/ChatPage.do")
	public String loadChatData(HttpServletRequest request, Model model) {

		System.out.println("요청옵니다");
		HttpSession session = request.getSession();
		UserVO currentUser = (UserVO) session.getAttribute("SignIn");
		if (currentUser == null) {
			// 로그인되지 않은 사용자 처리
			return "/jisang/SignIn";
		}

		String userId = currentUser.getUserid();
		ArrayList<ChatVO> chatList = chatMapper.LoadChat(userId);

		// 데이터 확인을 위한 print 문 추가
		for (ChatVO chat : chatList) {
			System.out.println(chat);
		}

		model.addAttribute("chatList", chatList);
		model.addAttribute("currentUser", currentUser);

		// JSP 파일의 경로와 파일명을 리턴
		return "/jisang/ChatPage"; // JSP 파일명을 리턴
	}
	
	@RequestMapping("/UserMyinfo.do")
	public String UserMyinfo() {

		return "/jisang/usermyinfo";

	}
	
	@RequestMapping("/Chart.do")
	public String Chart() {

		return "/jisang/chart";

	}
	
	@RequestMapping("/CompanyMyinfo.do")
	public String CompanyMyinfo() {

		return "/jisang/companymyinfo";

	}
	

	@RequestMapping("/Resume.do")
	public String Resume() {

		return "/jisang/resume";

	}
	
	@RequestMapping("/Career.do")
	public String Carrer() {

		return "/jisang/carrer";

	}
	
	@RequestMapping("/Notice.do")
	public String Notice() {

		return "/jisang/notice";

	}
}
