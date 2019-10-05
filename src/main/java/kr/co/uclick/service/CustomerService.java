package kr.co.uclick.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.uclick.entity.Customer;
import kr.co.uclick.repository.CustomerRepository;

public interface CustomerService {
	List<Customer> findAll();
	
	Customer findById(Long id);
	
	Iterable<Customer> findByName(String name, String searchType);
	
	void save(Customer customer);
	
	void deleteById(Long id);
}
