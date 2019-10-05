package kr.co.uclick.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.uclick.entity.MobilePhone;
import kr.co.uclick.predicate.CustomerPredicate;
import kr.co.uclick.repository.MobilePhoneRepository;

@Service
@Transactional
public class MobilePhoneServiceImpl implements MobilePhoneService {
	
	@Autowired
	private MobilePhoneRepository mobilePhoneRepository;
	
	// id 검색 
	@Transactional(readOnly = true)
	@Cacheable(value = "cacheMemory")
	public MobilePhone findById(Long id) {
		return mobilePhoneRepository.findById(id).get();
	}
	
	// phone number 검색
	@Transactional(readOnly = true)
	@Cacheable(value = "cacheMemory")
	public Iterable<MobilePhone> findByPhoneNumber(String phoneNumber, String searchType) {
		return mobilePhoneRepository.findAll(CustomerPredicate.search(phoneNumber, searchType));
	}
	
	// phone number 존재 확인 
	@Transactional(readOnly = true)
	@Cacheable(value = "cacheMemory")
	public boolean existsByPhoneNumber(String phoneNumber) {
		return mobilePhoneRepository.existsByPhoneNumber(phoneNumber);
	}
	
	// 삽입, 수정
	@CacheEvict(value = "cacheMemory", allEntries = true)
	public void save(MobilePhone mobilePhone) {
		mobilePhoneRepository.save(mobilePhone);
	}
	
	// 선택 삭제
	@CacheEvict(value = "cacheMemory", allEntries = true)
	public void deleteById(Long id) {
		mobilePhoneRepository.deleteById(id);
	}
}
