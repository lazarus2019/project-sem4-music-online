package com.demo.controllers.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.demo.services.GenresService;

@Controller
@RequestMapping(value = {"genres"})
public class GenresController {
	
	@Autowired
	private GenresService genresService;
	
	
	@RequestMapping( value = {"","index" } , method = RequestMethod.GET )
	public String index(ModelMap modelMap) {
		
		modelMap.put("genresAll", genresService.findAll());
		return "genres/index";
	}
	
}
