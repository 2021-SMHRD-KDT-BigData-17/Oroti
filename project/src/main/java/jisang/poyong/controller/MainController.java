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
import jisang.poyong.vo.BusinessVO;
import jisang.poyong.vo.ChatVO;
import jisang.poyong.vo.NoticeVO;
import jisang.poyong.vo.UserVO;

@Controller
public class MainController {

	@Autowired
	private ChatMapper chatMapper;
	@Autowired
	private NoticeMapper noticeMapper;
	

	

	@GetMapping("/MainPage.do")
	public String loadNoticeData(Model model, HttpServletRequest request) {
	    List<NoticeVO> notices = noticeMapper.LoadNotice();

	    for (NoticeVO notice : notices) {
	        int noticejobcode = notice.getNoticejobcode();
	        String noticejob = "";

            switch (noticejobcode) {
                case 1:
                    noticejob = "IT⦁정보통신";
                    break;
                case 2:
                    noticejob = "제조⦁생산⦁화학업";
                    break;
                case 3:
                    noticejob = "건설업";
                    break;
                case 4:
                    noticejob = "미디어⦁광고업";
                    break;
                case 5:
                    noticejob = "판매⦁유통업";
                    break;
                case 6:
                    noticejob = "교육업";
                    break;
                case 7:
                    noticejob = "의료⦁제약업";
                    break;
                case 8:
                    noticejob = "문화⦁예술⦁디자인업";
                    break;
                case 9:
                    noticejob = "서비스업";
                    break;
                case 10:
                    noticejob = "사무직";
                    break;
                default:
                    noticejob = "기타";
                    break;
            }

            notice.setNoticejob(noticejob);
	    }

	    model.addAttribute("notices", notices);
	    model.addAttribute("path", request.getContextPath());

	    return "/jisang/Main";
	}

	
	@RequestMapping("/InsertNotice.do")
	public String insertNotice(NoticeVO notice) {
		noticeMapper.insertNotice(notice);
		return "redirect:/MainPage.do";
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

		System.out.println("쪽지 페이지로 이동해요");
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
	public String Notice(HttpSession session) {
	    BusinessVO businessAttribute = (BusinessVO) session.getAttribute("business");
	    // businessAttribute를 사용하여 필요한 작업을 수행

	    return "/jisang/notice";
	}
	

	@RequestMapping("/NoticeResult.do")
	public String NoticeResult() {
		
		return "/jisang/noticeresult";

	}
}
