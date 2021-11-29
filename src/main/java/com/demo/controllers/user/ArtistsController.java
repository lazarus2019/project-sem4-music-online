package com.demo.controllers.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.models.ArtistsInfor;
import com.demo.services.AccountService;

@Controller
@RequestMapping(value = { "artist" })
public class ArtistsController {

	@Autowired
	private AccountService accountService;

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		try {
			List<ArtistsInfor> find = accountService.getallArtists();
			modelMap.put("arti", find);
		} catch (Exception e) {
			modelMap.put("erro", e.getMessage());
		}

		return "artist/index";
	}
	
	//New
	
	@RequestMapping( value = {"search" } , method = RequestMethod.GET )
	public String search(@RequestParam("keyword") String keyword ,ModelMap modelMap) {
		try {
			List<ArtistsInfor> searchArtis = accountService.getSearchArtis(keyword);
			modelMap.put("arti", searchArtis );
		} catch (Exception e) {
			modelMap.put("erro", e.getMessage());
		}
		
		return "artist/index";
	}
}
