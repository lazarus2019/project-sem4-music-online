package com.demo.controllers.user;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.demo.entities.Account;
import com.demo.entities.AccountPlaylist;
import com.demo.entities.Playlist;
import com.demo.services.AccountPlaylistService;
import com.demo.services.AccountService;
import com.demo.services.CookieService;
import com.demo.services.PlaylistService;

@Controller
@RequestMapping(value = { "liked" })
public class LikedController {

	@Autowired
	private AccountService accountService;

	@Autowired
	CookieService cookieService ;

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap) {

		Account account = new Account();
		String id = cookieService.getValue("acc_id", "");
		if (id.equalsIgnoreCase("")) {
			return "redirect:/login/login";
		} else {
			account = accountService.findById(Integer.parseInt(id));
			
			Set<AccountPlaylist> s = account.getAccountPlaylists();
			Playlist playlist = new Playlist();
			for (AccountPlaylist accountPlaylist : s) {
				if(accountPlaylist.getPlaylist().getPlaylistCategory().getId() == 2) {
					playlist = accountPlaylist.getPlaylist();
				}
			}
			
			modelMap.put("lik", playlist.getTracks());
		}
		
		
		return "liked/index";

	}

}