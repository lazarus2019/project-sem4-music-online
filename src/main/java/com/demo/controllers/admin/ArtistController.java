package com.demo.controllers.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.entities.Account;
import com.demo.entities.Playlist;
import com.demo.entities.Status;
import com.demo.models.PlaylistModel;
import com.demo.services.AccountService;
import com.demo.services.ArtistService;

@Controller
@RequestMapping(value = { "admin/artist" })
public class ArtistController {

	@Autowired
	private ArtistService artistService;
	


	@RequestMapping(value = { "", "index" })
	public String index(ModelMap modelMap) {
		List<Account> artists = artistService.getAllArtist();
		modelMap.put("artists", artists);

		return "admin/artist/index";
	}

	@RequestMapping(value = { "artistRequest" })
	public String artistRequest(ModelMap modelMap) {
		List<Account> artists = artistService.getRequestArtist();
		modelMap.put("artists", artists);

		return "admin/artist/artistRequest";
	}

	@RequestMapping(value = { "addNewArtist" })
	public String addNewArtist() {
		return "admin/artist/addNewArtist";
	}

	

}
