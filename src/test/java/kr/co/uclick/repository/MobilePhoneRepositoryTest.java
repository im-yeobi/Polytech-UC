package kr.co.uclick.repository;

//import static org.junit.Assert.assertEquals;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import kr.co.uclick.configuration.SpringConfiguration;

@RunWith(SpringRunner.class)
@ContextConfiguration(classes = SpringConfiguration.class)
public class MobilePhoneRepositoryTest {
	@Autowired
	MobilePhoneRepository mobilePhoneRepository;
	
//	@Test
//	public void testExistsByPhoneNumber() throws Exception {
//		boolean test = mobilePhoneRepository.existsByPhoneNumber("010-1234-5555");
//		System.out.println(test);
//		
//		assertEquals(true, test);
//	}
}
