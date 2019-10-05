package kr.co.uclick.service;

import kr.co.uclick.entity.MobilePhone;

public interface MobilePhoneService {
	// id 검색
	MobilePhone findById(Long id);
	
	Iterable<MobilePhone> findByPhoneNumber(String phoneNumber, String searchType);

	boolean existsByPhoneNumber(String phoneNumber);
	
	// 삽입, 수정
	void save(MobilePhone mobilePhone);
	
	// 삭제
	void deleteById(Long id);
}
