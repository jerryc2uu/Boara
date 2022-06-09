package com.githrd.boa.controller.p;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.githrd.boa.dao.p.MainDao;
import com.githrd.boa.vo.p.MainVO;

@Controller
public class MainController {
	
	@Autowired
	MainDao mDao;
	
	@RequestMapping({"/", "/main.boa"})
	public ModelAndView getMain(ModelAndView mv, RedirectView rv) {
		List<MainVO> list = mDao.getCol();
		
		mv.addObject("LIST", list);
		mv.setViewName("p/main");
		return mv;
	}
}
