package jisang.poyong.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.RedirectView;

import jisang.poyong.mapper.SurveyMapper;
import jisang.poyong.vo.NoticeVO;
import jisang.poyong.vo.Survey_VO;
import jisang.poyong.vo.SurveyresultVO;
import jisang.poyong.vo.UserVO;

@Controller
public class SurveyController {
	
	@Autowired
	private SurveyMapper mapper;
	
	@RequestMapping("/preference.do")
	public String surveyform(Model model) {
		
		List<Survey_VO> list = mapper.surveylist();
//		for(Survey_VO vo:list) {
//			System.out.println("메롱 : ");
//			System.out.println(vo.getSurveytext());
//		}
		model.addAttribute("list", list);
		return "/jisang/survey";
	}
	
	@RequestMapping("/mainsearch.do")
	public String mainsearch(Model model) {
		
		
		
		return "/jisang/Mainss";
	}
	
	
	
	
	@PostMapping("/surveyinsert.do")
	public String surveyinsert(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		// 아이디값만 가져오기
		UserVO SignIn = (UserVO)session.getAttribute("SignIn");
		String userid = SignIn.getUserid();
		// 장애코드 가져오기
		int obstccode = Integer.parseInt(SignIn.getUserobstccode());
		
		// 인적사항
		int gender = Integer.parseInt(request.getParameter("ans_0_1"));
		System.out.println(gender);
		int age = Integer.parseInt(request.getParameter("ans_0_2"));
		System.out.println(age);
		int education = Integer.parseInt(request.getParameter("ans_0_3"));
		System.out.println(education);
		int obstccentury = Integer.parseInt(request.getParameter("ans_0_4"));
		System.out.println(obstccentury);
		
		// 능력사항
		int surveyselectone = Integer.parseInt(request.getParameter("ans_1"));
		System.out.println(surveyselectone);
		int surveyselecttwo = Integer.parseInt(request.getParameter("ans_2"));
		System.out.println(surveyselecttwo);
		int surveyselectthree = Integer.parseInt(request.getParameter("ans_3"));
		System.out.println(surveyselectthree);
		int surveyselectfour = Integer.parseInt(request.getParameter("ans_4"));
		System.out.println(surveyselectfour);
		int surveyselectfive = Integer.parseInt(request.getParameter("ans_5"));
		System.out.println(surveyselectfive);
		int surveyselectsix = Integer.parseInt(request.getParameter("ans_6"));
		System.out.println(surveyselectsix);
		int surveyselectseven= Integer.parseInt(request.getParameter("ans_7"));
		System.out.println(surveyselectseven);
		int surveyselecteight = Integer.parseInt(request.getParameter("ans_8"));
		System.out.println(surveyselecteight);
		int surveyselectnine = Integer.parseInt(request.getParameter("ans_9"));
		System.out.println(surveyselectnine);
		int surveyselectten = Integer.parseInt(request.getParameter("ans_10"));
		System.out.println(surveyselectten);
		int surveyselecteleven = Integer.parseInt(request.getParameter("ans_11"));
		System.out.println(surveyselecteleven);
		int surveyselecttwelve = Integer.parseInt(request.getParameter("ans_12"));
		System.out.println(surveyselecttwelve);
		int surveyselectthirteen = Integer.parseInt(request.getParameter("ans_13"));
		System.out.println(surveyselectthirteen);
		
		
		SurveyresultVO vo = new SurveyresultVO(userid, gender, age, education, obstccode, obstccentury, surveyselectone, surveyselecttwo, surveyselectthree, surveyselectfour, surveyselectfive, surveyselectsix, surveyselectseven, surveyselecteight, surveyselectnine, surveyselectten, surveyselecteleven, surveyselecttwelve, surveyselectthirteen);
		
		mapper.surveyinsert(vo);
		
		return "redirect:http://localhost:4500/predict?userid="+userid;
	}
	
	
	@RequestMapping("/surveyreuslt.do")
	@ResponseBody
	public String surveyresult(HttpServletRequest request, Model model) {
		
		int predict1 = Integer.parseInt(request.getParameter("predict1"));
		int predict2 = Integer.parseInt(request.getParameter("predict2"));
		int predict3 = Integer.parseInt(request.getParameter("predict3"));
		
		model.addAttribute("predict1", predict1);
		model.addAttribute("predict2", predict2);
		model.addAttribute("predict3", predict3);
		
		System.out.println(predict1);
		System.out.println(predict2);
		System.out.println(predict3);
		
		return "/jisang/result";
	}
	

}
