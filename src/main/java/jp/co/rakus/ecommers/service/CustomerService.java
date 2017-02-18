package jp.co.rakus.ecommers.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jp.co.rakus.ecommers.domain.Customer;
import jp.co.rakus.ecommers.repository.CustomerRepository;

@Service
public class CustomerService {
	
	/**
	 * インスタンス化　依存性注入
	 */
	@Autowired
	private CustomerRepository repository;
	
	/**
	 * 顧客情報登録
	 * @param customer
	 */
	public void insertCustomer(Customer customer){
		repository.insertCustomer(customer);		
	}
	
}
