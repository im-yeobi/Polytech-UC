package kr.co.uclick.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.uclick.entity.Customer;
import kr.co.uclick.service.CustomerService;

@Controller
public class CustomerController {
	
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping(value = "customerList.html")
	public String customerList(Model model) {
		
		model.addAttribute("customers", customerService.findAll());
		model.addAttribute("nameOrPhone", "");
		model.addAttribute("searchType", "name");
		
		return "customerList";
	}
	
	@RequestMapping(value = "customerShow.html")
	public String customerShow(Model model, Long id) {
		Customer customer = customerService.findById(id);
		
		model.addAttribute("customer", customer);
		model.addAttribute("mobilePhones", customer.getMobilePhones());
		
		return "customerShow";
	}
	
	@RequestMapping(value = "customerSearch.html") 
	public ModelAndView customerSearch(@RequestParam String nameOrPhone, @RequestParam String searchType) {
		Iterable<Customer> customer = customerService.findByName(nameOrPhone, searchType);
		
		return new ModelAndView("customerList").addObject("customers", customer)
											   .addObject("nameOrPhone", nameOrPhone)
											   .addObject("searchType", searchType);
	}
	
	@RequestMapping(value = "customerInsert.html")
	public String customerInsert(Model model) {
		model.addAttribute("customer", new Customer());
		
		return "customerInsert";
	}
	
	@RequestMapping(value = "customerUpdate.html")
	public String customerUpdate(Model model, @ModelAttribute Customer customer) {
		model.addAttribute("customer", customer);
		
		return "customerUpdate";
	}
	
	@RequestMapping(value = "customerWrite.html")
	public String customerWrite(@ModelAttribute Customer customer) {
		customerService.save(customer);
		
		return "redirect:customerShow.html?id="+customer.getId();
	}
	
	@RequestMapping(value = "customerDelete.html")
	public ModelAndView customerDelete(@ModelAttribute Customer customer) {
		customerService.deleteById(customer.getId());
		
		return new ModelAndView("customerList", "customers", customerService.findAll());
	}
	
	@RequestMapping(value = "customerSelectDelete.html")
	public ModelAndView customerSelectDelete(@RequestParam String delUserId) {
		String[] delId = delUserId.split(",");
		
		for (int i = 0; i < delId.length; i++) {
			customerService.deleteById(Long.parseLong(delId[i]));
		}
		
		return new ModelAndView("customerList", "customers", customerService.findAll());
	}
		
	@InitBinder	
    protected void initBinder(WebDataBinder binder){
		DateFormat  dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat,true));
	}
}
