package jp.co.rakus.ecommers.web;

import org.eclipse.jdt.internal.compiler.lookup.ReferenceBinding;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class MainController {
	
	
	//フォーム初期化
	UserForm setupForm() {
	    return new UserForm();
	}
	
	@RequestMapping("/main")
	public String index(@ModelAttribute("userForm") UserForm form , BindingResult result ){
		
		return "main";
	}

}
