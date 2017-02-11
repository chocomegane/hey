package jp.co.rakus.ecommers.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RegisterUserController {
	
	@RequestMapping("/registerUser")
	public String RegisterUser(){
		return "registerUser";
	}
}
