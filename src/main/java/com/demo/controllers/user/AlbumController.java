package com.demo.controllers.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = { "album"} )
public class AlbumController {

	@RequestMapping( value = {"","index", "manage" })
	public String index() {
		return "album/manage" ; 
	}
	
	@RequestMapping( value = { "add" })
	public String add() {
		return "album/add" ; 
	}
	
	
	@RequestMapping( value = { "edit" })
	public String edit() {
		return "album/edit" ; 
	}
	
}
