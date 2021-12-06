package com.demo.controllers.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = {"admin","admin/dashboard" })
public class DashboardController {

	@RequestMapping(value = { "", "index" })
	public String index() {
		return "admin/dashboard/index";
	}

}
