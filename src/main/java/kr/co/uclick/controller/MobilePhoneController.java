package kr.co.uclick.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.uclick.entity.Customer;
import kr.co.uclick.entity.MobilePhone;
import kr.co.uclick.service.CustomerService;
import kr.co.uclick.service.MobilePhoneService;

@Controller
public class MobilePhoneController {
	@Autowired
	private MobilePhoneService mobilePhoneService;
	
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping(value = "mobilePhoneShow.html")
	public String mobilePhoneShow(Model model, @RequestParam Long id) {
		
		model.addAttribute("mobilePhone", mobilePhoneService.findById(id));
		
		return "mobilePhoneShow";
	}
	
	@RequestMapping(value = "mobilePhoneSearch.html") 
	public ModelAndView customerSearch(@RequestParam String nameOrPhone, @RequestParam String searchType) {
		Iterable<MobilePhone> mobilePhones = mobilePhoneService.findByPhoneNumber(nameOrPhone, searchType);
		List<Customer> customers = new ArrayList<Customer>();
		
		for(MobilePhone mobilePhone : mobilePhones) {
			customers.add(mobilePhone.getCustomer());
		}
		
		return new ModelAndView("customerList").addObject("customers", customers)
											   .addObject("nameOrPhone", nameOrPhone)
											   .addObject("searchType", searchType);
	}
	
	@RequestMapping(value = "mobilePhoneInsert.html")
	public String moiblePhoneInsert(Model model, @RequestParam String customerId, @RequestParam String customerName) {
		
		model.addAttribute("customerId", customerId);
		model.addAttribute("customerName", customerName);
		
		return "mobilePhoneInsert";
	}
	
	@RequestMapping(value = "mobilePhoneUpdate.html")
	public String mobilePhoneUpdate(Model model, @RequestParam Long mobileId) {
		MobilePhone mobilePhone = mobilePhoneService.findById(mobileId); 
		
		model.addAttribute("mobilePhone", mobilePhone);
		
		return "mobilePhoneUpdate";
	}
	
	@RequestMapping(value = "mobilePhoneWrite.html") 
	public String mobilePhoneWrite(Model model, @ModelAttribute MobilePhone mobilePhone, @RequestParam Long customerId){
		
		mobilePhone.setCustomer(customerService.findById(customerId));
		mobilePhoneService.save(mobilePhone);
		
		return "redirect:mobilePhoneShow.html?id=" + mobilePhone.getId();
	}
	
	@RequestMapping(value = "mobilePhoneDelete.html")
	public String mobilePhoneDelete(@RequestParam String customerId, @RequestParam String mobileId) {
		String[] delId = mobileId.split(",");
		
		for (int i = 0; i < delId.length; i++) {
			mobilePhoneService.deleteById(Long.parseLong(delId[i]));
		}
		
		return "redirect:customerShow.html?id=" + customerId;
	}
	
}
