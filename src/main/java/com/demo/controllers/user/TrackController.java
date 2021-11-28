package com.demo.controllers.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.services.ArtistService;
import com.demo.services.GenresService;

@Controller
@RequestMapping(value = { "track"} )
public class TrackController {
	
	@Autowired
	private GenresService genresService;
	
	@Autowired
	private ArtistService artistService;

	@RequestMapping( value = {"index" })
	public String index() {
		return "track/index" ; 
	}
	
	@RequestMapping( value = { "" })
	public String index(@RequestParam("keyword")String keyword, @RequestParam("type")String type) {
		System.out.println("keyword:" + keyword);
		System.out.println("type:" + type);
		return "track/index" ; 
	}
	
	@RequestMapping( value = { "add" })
	public String add(ModelMap modelMap) {
		modelMap.addAttribute("artists", artistService.getArtistWithoutId(1));
		modelMap.addAttribute("genres", genresService.findAll());
		return "track/add" ; 
	}
	
	@RequestMapping( value = { "edit" })
	public String edit() {
		return "track/edit" ; 
	}
	
	
	@RequestMapping( value = { "manage" })
	public String manage() {
		return "track/manage" ; 
	}
	
}
