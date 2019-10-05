package kr.co.uclick.configuration;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.util.StopWatch;

import kr.co.uclick.entity.Sample;
import kr.co.uclick.service.SampleService;

@RunWith(SpringRunner.class)
@ContextConfiguration(classes = SpringConfiguration.class)
public class SpringConfigurationTest {

	@Autowired
	SampleService sampleService;
	
	
//	@Test
//	public void test() {
//		sampleService.findAll();
//	}
	
//	@Test
//	public void testSelectOne() {
//		StopWatch sw = new StopWatch();
//		sw.start();
//		Sample s1 = sampleService.selectOne(1L);
//		sw.stop();
//		
//		System.out.println("total time : " + sw.getTotalTimeSeconds());
//		
//		sw = new StopWatch();
//		sw.start();
//		Sample s2 = sampleService.selectOne(1L);
//		sw.stop();
//		
//		System.out.println("total time : " + sw.getTotalTimeSeconds());
//	}

}
