package com.demo.controllers.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = { "", "admin/dashboard" })
public class DashboardController {

	@RequestMapping(value = { "", "admin/dashboard" })
	public String index() {
		return "admin/dashboard/index";
	}

}
