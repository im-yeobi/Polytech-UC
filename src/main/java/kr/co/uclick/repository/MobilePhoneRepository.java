package kr.co.uclick.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.stereotype.Repository;

import com.querydsl.core.types.Predicate;

import kr.co.uclick.entity.MobilePhone;

@Repository
public interface MobilePhoneRepository extends JpaRepository<MobilePhone, Long>, QuerydslPredicateExecutor<MobilePhone> {
	@Override
	Optional<MobilePhone> findById(Long id);
	
	@Override
	<S extends MobilePhone> S save(S entity);
	
	@Override
	void deleteById(Long id);

	boolean existsByPhoneNumber(String phoneNumber);
	
	@Override
	Iterable<MobilePhone> findAll(Predicate predicate);
}
