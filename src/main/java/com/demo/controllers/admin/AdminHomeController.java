package com.demo.controllers.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = {"admin/home"} )
public class AdminHomeController {

	@RequestMapping( value = {"","admin" } , method = RequestMethod.GET )
	public String index() {
		return "admin/home/index" ; 
	}
	
}
