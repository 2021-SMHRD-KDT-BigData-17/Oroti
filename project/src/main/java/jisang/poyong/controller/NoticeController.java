//package jisang.poyong.controller;
//
//import jisang.poyong.mapper.NoticeMapper;
//import jisang.poyong.vo.ChatVO;
//import jisang.poyong.vo.NoticeVO;
//import jisang.poyong.vo.UserVO;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
//import java.util.ArrayList;
//import java.util.List;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
////
////@Controller
////public class NoticeController {
////
////	private final NoticeMapper noticeMapper;
////
////	@Autowired
////	public NoticeController(NoticeMapper noticeMapper) {
////		this.noticeMapper = noticeMapper;
////	}
//////
//////	@GetMapping("/MainPage.do")
//////	public String LoadNotice(Model model) {
//////		List<NoticeVO> notices = noticeMapper.LoadNotice();
//////
//////		// 모델에 공고 정보를 추가하여 JSP로 전달
//////		model.addAttribute("Main", notices);
//////
//////		return "/jisang/Main"; // JSP 파일명을 리턴
//////	}
//////}