package jp.co.rakus.ecommers.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TopController {
	
	
		
	
	@RequestMapping("/")
	public String index(){
		return "top";
	}
	
	
	

}
