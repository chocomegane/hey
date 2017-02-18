package jp.co.rakus.ecommers.web;

import lombok.Data;

@Data
public class CustomerForm {
	
	private String name;
	
	private String email;
	
	private String password;
	
	private String checkPassword;
	

}
