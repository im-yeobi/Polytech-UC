package kr.co.uclick.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import kr.co.uclick.configuration.SpringConfiguration;
import kr.co.uclick.entity.Customer;
import net.sf.ehcache.CacheManager;

@RunWith(SpringRunner.class)
@ContextConfiguration(classes = SpringConfiguration.class)
public class CustomerServiceTest {
	@Autowired
	CustomerService customerService;
	
//	@Test 
//	public void testFindAll() {
//		// 캐시 테스트
//		List<Customer> customers = customerService.findAll();
//		System.out.println("처음 : " + customers.get(0).getName());
//		
//		List<Customer> customers2 = customerService.findAll();
//		System.out.println("두번째 : " + customers2.get(0).getName());
//	}
	
//	@Test
//	public void testDeleteById() {
//		customerService.deleteById(1L);
//	}
	
//	@Test
//	public void testCache() {
//		//Customer customer = new Customer();
//		//customer.setName("testtest");
//		//customer.setLoginId("testtest");
//		//customer.setLoginPwd("testtest");
//		
//		//customerService.save(customer);
//		customerService.findByName("testtest", "name");
//		
//		
//		System.out.println("결과 : " + CacheManager.ALL_CACHE_MANAGERS.size());
//		//int size = CacheManager.ALL_CACHE_MANAGERS.get(0).getCache("kr.co.uclick.entity.Customer").getSize();
//		//System.out.println("결과 : " + size);
//		
//	}
}
