package com.demo.controllers.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = { "notification"} )
public class NotificationController {

	@RequestMapping( value = { "","index" })
	public String index() {
		return "notification/index" ; 

	}
	
}
