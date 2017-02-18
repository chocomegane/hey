package jp.co.rakus.ecommers.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jp.co.rakus.ecommers.domain.Customer;
import jp.co.rakus.ecommers.repository.CustomerRepository;

@Service
public class CustomerService {
	
	@Autowired
	private CustomerRepository repository;
	
	public void insertCustomer(Customer customer){
		repository.insertCustomer(customer);		
	}
	
}
