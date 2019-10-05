package kr.co.uclick.service;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StopWatch;

import kr.co.uclick.entity.Sample;
import kr.co.uclick.repository.CustomSampleRepositoryImpl;
import kr.co.uclick.repository.SampleRepository;

@Service
@Transactional	// 트랜잭션 처리
public class SampleService {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomSampleRepositoryImpl.class);

	@Autowired
	private SampleRepository sampleRepository;
	
//	public void delete(Sample entity) {
//		sampleRepository.delete(entity);
//	}

	//@Transactional(readOnly = true, propagation = pregation.REQUIRED_NEW) => REQUIRED : 기존 트랜잭션 존재하면 그대로 사용, 존재하지 않으면 새로운 것 만든다. default는 REQUIRED
//	@Transactional(readOnly = true)
//	public List<Sample> findAll() {
//		return sampleRepository.findAll();
//	}	
	
	//public void save(Sample sample) {
		
	//}
	
	//public void findById() {
		
	//}
	
	
	
//	@Transactional(readOnly = true)
//	public List<Sample> findSampleByName(String name) {
//		sampleRepository.findAll(QSample.sample.name.eq(name));	// querydsl
//		
//		return sampleRepository.findSampleByName(name);
//	}
	
	public Sample selectOne(Long sampleId) {
		StopWatch sw = new StopWatch();
		sw.start();
		Sample sample = sampleRepository.selectOne(sampleId);
		sw.stop();
		
		logger.debug("total time : {}", sw.getTotalTimeSeconds());
		
		return sample;
	}
	
	public void updateOne(Sample sample) {
		StopWatch sw = new StopWatch();
		sw.start();
		sampleRepository.updateOne(sample);
		sw.stop();
		
		logger.debug("total time : {}", sw.getTotalTimeSeconds());
	}

}
