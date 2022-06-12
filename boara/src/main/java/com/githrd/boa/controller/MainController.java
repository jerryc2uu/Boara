package com.githrd.boa.controller;
 
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class MainController {
	//@Autowired
	
	@RequestMapping({"/", "/main.boa"})
	public ModelAndView getMain(ModelAndView mv, HttpSession session) {
	
		
		mv.setViewName("main");
		return mv;
	}
}
