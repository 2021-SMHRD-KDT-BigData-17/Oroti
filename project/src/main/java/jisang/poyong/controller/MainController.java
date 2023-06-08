package jisang.poyong.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jisang.poyong.mapper.ChatMapper;
import jisang.poyong.vo.ChatVO;
import jisang.poyong.vo.UserVO;

@Controller
public class MainController {
   
	@Autowired
    private ChatMapper chatMapper;

    
	@RequestMapping("/SignUp.do") 
    public String SignUp() {
    
    	return "/jisang/SignUp"; 
    
	}
    
	@RequestMapping("/SignIn.do") 
    public String SignIn() {
    
    	return "/jisang/SignIn"; 
    
    }

	@RequestMapping("/ChatPage.do")
	public String loadChatData(HttpServletRequest request, Model model) {
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

	
}


