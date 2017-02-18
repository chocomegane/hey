package jp.co.rakus.ecommers.web;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


import jp.co.rakus.ecommers.domain.Customer;
import jp.co.rakus.ecommers.service.CustomerService;

@Controller
public class RegisterCustomerController {
	
	@Autowired
	private CustomerService service;
	
	@RequestMapping("/registerCustomer")
	public String index(@ModelAttribute("customerForm") CustomerForm form ){
		return "registerCustomer";
	}
	
	@RequestMapping("/registerCustomer/input")
	public String RegisterCustomer(@Validated CustomerForm form, BindingResult result){
		Customer customer = new Customer();
		BeanUtils.copyProperties(form, customer);
		service.insertCustomer(customer);
		return "top";
	}
}
