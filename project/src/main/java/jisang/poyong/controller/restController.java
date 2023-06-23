package jisang.poyong.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import jisang.poyong.mapper.SurveyMapper;
import jisang.poyong.vo.NoticeVO;

@RestController	
public class restController {
	@Autowired
	private SurveyMapper mapper;
	
	
	@PostMapping("/Filtering")
	public List<NoticeVO> filtering(@RequestBody String[] requestData, Model model, HttpServletRequest request) {
		

		// 요청 데이터 확인
	    for (String data : requestData) {
	        System.out.println(data);
	    }
	    System.out.println("------------");
	    
	    
	    
	    List<String> companyaddress = new ArrayList<>();
	    List<String> noticejobcode = new ArrayList<>();
	    List<String> noticeemp = new ArrayList<>();
	    HashMap<String, List<String>> requestDataMap = new HashMap<>();
	    
	    for (int i = 0; i < requestData.length; i++) {
            String transformedItem = requestData[i];
            // 사업체 주소 분류
            switch (transformedItem) {
			case "특별시":
				companyaddress.add(transformedItem);
				break;
			case "광역시":
				companyaddress.add(transformedItem);
				break;
			case "경기도":
				companyaddress.add(transformedItem);
				break;
			case "강원도":
				companyaddress.add(transformedItem);
				break;
			case "충청남도":
				companyaddress.add(transformedItem);
				break;
			case "충청북도":
				companyaddress.add(transformedItem);
				break;
			case "전라남도":
				companyaddress.add(transformedItem);
				break;
			case "전라북도":
				companyaddress.add(transformedItem);
				break;
			case "경상남도":
				companyaddress.add(transformedItem);
				break;
			case "경상북도":
				companyaddress.add(transformedItem);
				break;
			case "제주도":
				companyaddress.add("제주");
				break;
			// 사업체 주소 끝
			
			// 사업체 직종 코드 분류 시작
			case "IT·정보통신업":
				noticejobcode.add("1");
				break;
			case "제조·생산 화학업":
				noticejobcode.add("2");
				break;
			case "건설업":
				noticejobcode.add("3");
				break;
			case "미디어 광고업":
				noticejobcode.add("4");
				break;
			case "판매 유통업":
				noticejobcode.add("5");
				break;
			case "교육업":
				noticejobcode.add("6");
				break;
			case "의료 제약업":
				noticejobcode.add("7");
				break;
			case "문화 예술 디자인업":
				noticejobcode.add("8");
				break;
			case "서비스업":
				noticejobcode.add("9");
				break;
			case "사무직":
				noticejobcode.add("10");
				break;
			// 사업제 분류코드 끝
				
			// 고용형태 분류
			default:
				noticeemp.add(transformedItem);
				break;
			}
        }
	    
	    
	    requestDataMap.put("companyaddress", companyaddress);
	    requestDataMap.put("noticejobcode", noticejobcode);
	    requestDataMap.put("noticeemp", noticeemp);
	    
	    
	    
	    System.out.println(companyaddress);
	    System.out.println(noticejobcode);
	    System.out.println(noticeemp);
	    
	    List<NoticeVO> noticesearch = mapper.noticesearch(requestDataMap);
		
	    System.out.println(noticesearch.get(0));
	    
	    for (int i = 0; i < noticesearch.size(); i++) {
			System.out.println(noticesearch.get(i));
		}
	    
	   // model.addAttribute("notisesearch", noticesearch);
	   // request.setAttribute("notisesearch", noticesearch);
	    
		return noticesearch;
	}
	
	
}
