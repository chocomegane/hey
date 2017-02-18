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
	
	/**
	 * インスタンス化　依存性注入
	 */
	@Autowired
	private CustomerService service;
	
	/**
	 * 新規登録ページ製造及び遷移
	 * @param form
	 * @return
	 */
	@RequestMapping("/registerCustomer")
	public String index(@ModelAttribute("customerForm") CustomerForm form ){
		return "registerCustomer";
	}
	
	/**
	 * 顧客情報登録しトップ画面へ
	 * @param form
	 * @param result
	 * @return
	 */
	@RequestMapping("/registerCustomer/input")
	public String RegisterCustomer(@Validated CustomerForm form, BindingResult result){
		//インスタンス化
		Customer customer = new Customer();
		//フォーム（パラメータ）の値をcustomerに値のコピー
		BeanUtils.copyProperties(form, customer);
		//サービスクラスのメソッドを呼び出し
		service.insertCustomer(customer);
		return "top";
	}
}
