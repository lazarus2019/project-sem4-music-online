package com.demo.controllers.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = {"customplaylist"})
public class CustomPlaylistController {
	
	@RequestMapping(value = {"","index"}, method = RequestMethod.GET)
	public String index() {
		
		return "customplaylist/index";
	}

}
