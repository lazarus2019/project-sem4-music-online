package com.demo.controllers.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.demo.services.AboutUsService;

@Controller
@RequestMapping(value = {"aboutus"})
public class AboutUsController {
	
	@Autowired
	private AboutUsService aboutUsService;
	
	@RequestMapping( value = {"","index" } , method = RequestMethod.GET )
	public String index(ModelMap modelMap) {
		
		modelMap.put("aboutus", aboutUsService.findAlls());
		return "aboutus/index";
	}

}
