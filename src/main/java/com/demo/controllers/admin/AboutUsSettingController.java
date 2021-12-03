package com.demo.controllers.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.demo.services.AboutUsService;

@Controller
@RequestMapping(value = {"admin/aboutus"})
public class AboutUsSettingController {
	
	@Autowired
	private AboutUsService aboutUsService;
	
	@RequestMapping( value = {"","index" } , method = RequestMethod.GET )
	public String index(ModelMap modelMap) {
		return "admin/aboutus/index";
	}
	
	@RequestMapping( value = { "add" } , method = RequestMethod.GET )
	public String add() {
		return "admin/aboutus/add";
	}

}
