package com.demo.controllers.user;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.demo.entities.Account;
import com.demo.entities.AccountPlaylist;
import com.demo.entities.AccountPlaylistId;
import com.demo.entities.Playlist;
import com.demo.models.PlaylistInfor;
import com.demo.services.AccountPlaylistService;
import com.demo.services.AccountService;
import com.demo.services.PlaylistService;

@Controller
@RequestMapping(value = { "liked" })
public class LikedController {

	@Autowired
	private PlaylistService playlistService;

	@Autowired
	private AccountPlaylistService accountPlaylistService;

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap) {

		int accountId = 9;
		List<AccountPlaylistId> acc = accountPlaylistService.getPlaylistOfAccount(accountId);

		List<PlaylistInfor> play = new ArrayList<PlaylistInfor>();
		PlaylistInfor pl = new PlaylistInfor();

		for (AccountPlaylistId ac : acc) {
			int playId = ac.getPlaylistId();
			
			pl = playlistService.getLikedPlaylistByAccountId(ac.getPlaylistId());
			if (pl.getPlaylistCategoryId() == 2) {
				play.add(playlistService.getLikedPlaylistByAccountId(playId));
			}

		}
		modelMap.put("lik", play);

		return "liked/index";

	}

}
