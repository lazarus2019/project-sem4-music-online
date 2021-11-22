package com.demo.controllers.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = { "record-chart"} )
public class RecordChartController {

	@RequestMapping( value = { "","index" })
	public String index() {
		return "recordChart/index" ; 
	}
	
}
