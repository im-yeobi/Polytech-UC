package kr.co.uclick.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.uclick.entity.Customer;
import kr.co.uclick.predicate.CustomerPredicate;
import kr.co.uclick.repository.CustomerRepository;

@Service
@Transactional	// Transactional을 선언하면  해당 클래스에 속한 메서드는 default로 트랜잭션 처리를 한다
public class CustomerServiceImpl implements CustomerService {
	
	@Autowired
	private CustomerRepository customerRepository;	// 객체 생성
	
	// 전체 검색
	@Transactional(readOnly = true)	// Transactional default 값은 false
	@Cacheable(value = "cacheMemory")
	public List<Customer> findAll() {
		return customerRepository.findAll();
	}
	
	// id로 검색
	@Transactional(readOnly = true)
	@Cacheable(value = "cacheMemory")
	public Customer findById(Long id) {	// Optional 이란 존재할 수도 있지만 안 할 수도 있는 객체. null이 될수 있는 객체이다. 원소 없거나 최대 하나인 경우
		return customerRepository.findById(id).get();
	}
	
	// 이름 검색
	@Transactional(readOnly = true)
	@Cacheable(value = "cacheMemory")
	public Iterable<Customer> findByName(String name, String searchType) {
		return customerRepository.findAll(CustomerPredicate.search(name, searchType));
	}
	
	// 삽입, 수정
	@CacheEvict(value = "cacheMemory", allEntries = true)
	public void save(Customer customer) {
		customerRepository.save(customer);
	}
	
	// id로 삭제
	@CacheEvict(value = "cacheMemory", allEntries = true)
	public void deleteById(Long id) {
		customerRepository.deleteById(id);
	}
}
