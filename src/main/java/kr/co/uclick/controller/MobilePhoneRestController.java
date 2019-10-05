package kr.co.uclick.controller;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.uclick.service.MobilePhoneService;

@RestController
public class MobilePhoneRestController {
	@Autowired
	private MobilePhoneService mobilePhoneService;
	
	@RequestMapping(value = "api/mobilePhone/json", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public @ResponseBody String checkDuplicate(HttpServletResponse response, @RequestParam("phoneNumber") String phoneNumber, Model model) throws Exception {
		String existPhoneNumber = mobilePhoneService.existsByPhoneNumber(phoneNumber) + "";
		
		URLEncoder.encode(existPhoneNumber, "UTF-8");
		return existPhoneNumber;
	}
}
