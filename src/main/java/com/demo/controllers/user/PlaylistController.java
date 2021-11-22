package com.demo.controllers.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = { "", "admin/playlist" })
public class PlaylistController {

	@RequestMapping(value = { "", "admin/playlist/index" })
	public String index() {
		return "admin/playlist/index";
	}
	
	@RequestMapping(value = { "admin/playlist/add" })
	public String add() {
		return "admin/playlist/add";
	}

}
