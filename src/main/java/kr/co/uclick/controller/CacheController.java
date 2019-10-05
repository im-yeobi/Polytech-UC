package kr.co.uclick.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.CacheManager;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;



@RestController     // for rest response
public class CacheController {
    @Autowired
    private CacheManager cacheManager;      // autowire cache manager
    //private CustomerService customerService;
    
    // clear all cache using cache manager
    @RequestMapping(value = "clearCache")
    public void clearCache() {
        for(String name:cacheManager.getCacheNames()){
            cacheManager.getCache(name).clear();            // clear cache by name
        }
    }
    
//    @RequestMapping(value = "cacheTest")
//    public void cacheTest() {
//    	Customer customer = new Customer();
//    	customer.setAge(11);
//    	customer.setEmail("test@naver.com");
//		customer.setName("testtest");
//		customer.setLoginId("testtest");
//		customer.setLoginPwd("testtest");
//    			
//		customerService.save(customer);
//		customerService.findByName("testtest", "name");
//		customerService.findByName("testtest", "name");
//		customerService.findByName("testtest", "name");
//		customerService.findByName("testtest", "name");
		
    			
		//for(String name:cacheManager.getCacheNames()){
            //System.out.println("캐시 이름 : " + cacheManager.getCache(name).getName());            // clear cache by name
        //}		
//    	System.out.println("결과 : " + CacheManager.class.getName());
//    			int size = CacheManager.ALL_CACHE_MANAGERS.get(0).getCache("kr.co.uclick.entity.Customer").getSize();
    			//System.out.println("결과 : " + size);
//    }
}
