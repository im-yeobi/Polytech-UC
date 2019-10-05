package kr.co.uclick.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import kr.co.uclick.entity.Sample;

@Repository
public interface SampleRepository extends JpaRepository<Sample, Long>, CustomSampleRepository/*, QuerydslPredicateExecutor*/ {

//	public List<Sample> findSampleByName(String name);
	
	
}
