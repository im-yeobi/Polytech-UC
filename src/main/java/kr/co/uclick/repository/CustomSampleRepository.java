package kr.co.uclick.repository;

import kr.co.uclick.entity.Sample;

public interface CustomSampleRepository {
	
	void doSample(String name);
	
	Sample selectOne(Long id);
	
	void updateOne(Sample sample);
}
