package kr.co.uclick.service;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.util.StopWatch;

import kr.co.uclick.configuration.SpringConfiguration;
import kr.co.uclick.entity.Sample;

@RunWith(SpringRunner.class)
@ContextConfiguration(classes = SpringConfiguration.class)
public class SampleServiceTest {
	@Autowired
	SampleService sampleService;
	
//	@Test
//	public void testSelectOne() {	// 캐시 테스트
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
//		System.out.println("total time : " + sw.getTotalTimeSeconds());	// 캐시에 의해서 검색 시간이 줄어든 것을 확인할 수 있다.
//  
//		assertEquals(1, s1.getId().intValue());
//  }
  
  
//  @Test
//  public void testUpdateOne() {	// 케시 테스트
//      StopWatch sw = new StopWatch();
//      sw.start();
//      Sample s1 = sampleService.selectOne(1L);
//      sw.stop();
//      
//      System.out.println("1.total time : " + sw.getTotalTimeSeconds());
//      
//      sw = new StopWatch();
//      sw.start();
//      s1 = sampleService.selectOne(1L);
//      sw.stop();
//      
//      System.out.println("2.total time : " + sw.getTotalTimeSeconds());
//      
//      s1.setName("루루1");
//      sampleService.updateOne(s1);
//  
//      
//      sw = new StopWatch();
//      sw.start();
//      s1 = sampleService.selectOne(1L);
//      sw.stop();
//      
//      System.out.println("4.total time : " + sw.getTotalTimeSeconds());
//      
//      sw = new StopWatch();
//      sw.start();
//      s1 = sampleService.selectOne(1L);
//      sw.stop();
//      
//      System.out.println("5.total time : " + sw.getTotalTimeSeconds());
//      
//      assertEquals(1, s1.getId().intValue());
//  }
}
