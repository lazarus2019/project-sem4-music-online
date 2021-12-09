package com.demo.controllers.user;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.services.AlbumService;


@Controller
@RequestMapping(value = { "album" })
public class AlbumController {
	
	@Autowired
	private AlbumService albumService;

	@RequestMapping( value = {"" } , method = RequestMethod.GET )
	public String search(@RequestParam("keyword") String keyword ,ModelMap modelMap) {
		try {			
			modelMap.put("albums", albumService.searchAlbumByKeyword(keyword));
		} catch (Exception e) {
			modelMap.put("erro", e.getMessage());
		}
		
		return "album/index";
	}

}
