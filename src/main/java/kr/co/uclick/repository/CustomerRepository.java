package kr.co.uclick.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.mongodb.repository.support.QuerydslRepositorySupport;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.stereotype.Repository;

import com.querydsl.core.types.Predicate;

import kr.co.uclick.entity.Customer;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Long>, QuerydslPredicateExecutor<Customer> {
	@Override
	List<Customer> findAll();	// 전체 검색
	
	@Override
	Optional<Customer> findById(Long id);	// id 검색
	
	@Override
	<S extends Customer> S save(S entity);	// 삽입, 수정
	
	@Override
	void deleteById(Long id);	// id로 삭제
	
	@Override
	void deleteAll();
	
	@Override
	Iterable<Customer> findAll(Predicate predicate);
}