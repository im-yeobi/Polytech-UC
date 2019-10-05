package kr.co.uclick.repository;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import kr.co.uclick.configuration.SpringConfiguration;
import kr.co.uclick.entity.Customer;

@RunWith(SpringRunner.class)
@ContextConfiguration(classes = SpringConfiguration.class)
public class CustomerRepositoryTest {
	@Autowired
	CustomerRepository customerRepository;
	
//	@Test
//	public void testFindByName() throws Exception {
//		List<Customer> customers = customerRepository.findByNameLike("%test%");
//		
//		assertEquals(3, customers.size());
//	}
	
//	@Test
//	public void testDeleteAll() throws Exception {
//		customerRepository.deleteAll();
//	}
	
	
}
