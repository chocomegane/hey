package jp.co.rakus.ecommers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test")
public class Test {
	@RequestMapping()
	public String test() {
		return "test";
	}

}
