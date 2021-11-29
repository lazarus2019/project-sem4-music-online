package com.demo.controllers.user;

import java.io.Console;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.entities.Account;
import com.demo.entities.PackageInfo;
import com.demo.models.TrackInfor;
import com.demo.services.AccountService;
import com.demo.services.CookieService;
import com.demo.services.GenresService;
import com.demo.services.TrackService;

@Controller
@RequestMapping(value = {"track"})
public class TrackController {
	
	@Autowired
	private TrackService trackService;
	
	@Autowired
	private GenresService genresService;
	
	@RequestMapping( value = {"index/{id}" } , method = RequestMethod.GET )
	public String index( @PathVariable("id") int id , ModelMap modelMap) {
		modelMap.put("listtrack", trackService.findTrackByGenresId(id));
		return "track/index" ; 
	}
	/*
	 * @RequestMapping( value = {"index" }) public String index() { return
	 * "track/index" ; }
	 */
	
	@RequestMapping( value = { "" })
	public String index(@RequestParam("keyword")String keyword, @RequestParam("type")String type) {
		System.out.println("keyword:" + keyword);
		System.out.println("type:" + type);
		return "track/index" ; 
	}
	
	@RequestMapping( value = { "add" })
	public String add(ModelMap modelMap) {
//		modelMap.addAttribute("artists", artistService.getArtistWithoutId(1));
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
