package com.demo.controllers.users;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = {"","user/home"} )
public class HomeController {

	@RequestMapping( value = {"","index" } , method = RequestMethod.GET )
	public String index() {
		return "user/home/index" ; 
	}
	
}
