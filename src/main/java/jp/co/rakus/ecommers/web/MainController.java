package jp.co.rakus.ecommers.web;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class MainController {
	//フォーム初期化
	CustomerForm setupForm() {
	    return new CustomerForm();
	}
	
	@RequestMapping("/main")	
	public String index(@ModelAttribute("userForm") CustomerForm form , BindingResult result ){
		return "main";
	}
	
}
