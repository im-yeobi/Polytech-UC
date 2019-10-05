package kr.co.uclick.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.uclick.service.SampleService;

@Controller
public class SampleController {

	//private static final Logger logger = LoggerFactory.getLogger(SampleController.class);
	
	@Autowired
	private SampleService sampleService;	// 스프링이 sampleService를 생성하여 넣어준 것이다
	
//	@RequestMapping(value = "list.html")
//	public String list(Model model) {
//		model.addAttribute("users", sampleService.findAll());
//		return "list";
//	}
//	@RequestMapping(value = "newForm.html")
//	public String newForm(Model model) {
//		return "newForm";
//	}
//	@RequestMapping(value = "editForm.html")
//	public String editForm(Long sampleId, Model model) {
//		//sampleService.findById(sampleId);
//		
//		return "editForm";
//	}
//	@RequestMapping(value = "save.html")
//	public String save(Sample sample, Model model) {
//		return "redirect:list.html";
//	}
	

	@RequestMapping(value = "sample.html")	// sample.html 호출시 해당 메서드 실행
	public String sample(/*String name, Sample sample, */Model model) {
		
		// logger.debug("sample name : {}", name);
		// logger.debug("sample name : {}", sample.getName());
		
//		model.addAttribute("samples", sampleService.findAll());
		// model.addAttribute("sample", sample);
		// model.addAttribute("findSampleByName", sampleService.findSampleByName(name));
		return "sample";	// dispatcher Servlet 으로 반환한다 (Spring이 view Resolver를 이용하여 알아서 처리)
	}
}
