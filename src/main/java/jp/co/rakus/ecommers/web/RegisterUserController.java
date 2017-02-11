package jp.co.rakus.ecommers.web;

import org.springframework.web.bind.annotation.RequestMapping;

public class RegisterUserController {
	
	@RequestMapping("/registerUser")
	public String RegisterUser(){
		return "registerUser";
	}
}
