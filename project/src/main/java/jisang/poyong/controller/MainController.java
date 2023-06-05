package jisang.poyong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
   
	@RequestMapping("/SignUp.do") 
    public String SignUp() {
    
    	return "/jisang/SignUp"; 
    
    }
	
    
	@RequestMapping("/SignIn.do") 
    public String SignIn() {
    
    	return "/jisang/SignIn"; 
    
    }

}


