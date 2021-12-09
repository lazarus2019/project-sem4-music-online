package com.demo.controllers.user;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.entities.Account;
import com.demo.entities.AccountPlaylist;
import com.demo.entities.PackageInfo;
import com.demo.entities.Playlist;
import com.demo.entities.Track;
import com.demo.models.CustomPlaylistModel;
import com.demo.models.TrackCustomModel;
import com.demo.models.TrackInfo;
import com.demo.services.AccountPlaylistService;
import com.demo.services.AccountService;
import com.demo.services.CookieService;
import com.demo.services.PlaylistService;
import com.demo.services.TrackService;

@Controller
@RequestMapping(value = { "customPlaylist" })
public class CustomPlaylistController {

	@Autowired
	private CookieService cookieService;

	@Autowired
	private AccountService accountService;

	@Autowired
	private PlaylistService playlistService;

	@Autowired
	private AccountPlaylistService accountPlaylistService;

	@Autowired
	private TrackService trackService;

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap, Authentication authentication) {

		if (authentication == null || authentication instanceof AnonymousAuthenticationToken) {
			modelMap.put("msg", "You must sign in first");
			return "redirect:/login/login";
		} else {
			Account account = new Account();
			String id = cookieService.getValue("acc_id", "");
			if (id.equalsIgnoreCase("")) {
				return "redirect:/login/login";
			} else {
				account = accountService.findById(Integer.parseInt(id));
			}
			if (account != null) {
				List<CustomPlaylistModel> playlists = new ArrayList<CustomPlaylistModel>();
				Set<AccountPlaylist> AccountPlaylists = account.getAccountPlaylists();
				for (AccountPlaylist accountPlaylist : AccountPlaylists) {
					if (accountPlaylist.getPlaylist().getPlaylistCategory().getName().equalsIgnoreCase("Custom")) {
						CustomPlaylistModel customPlaylistModel = new CustomPlaylistModel(
								accountPlaylist.getPlaylist());
						playlists.add(customPlaylistModel);
					}
				}
				modelMap.put("playlists", playlists);
			}

		}
		return "customPlaylist/index";
	}

	@RequestMapping(value = { "playlistDetail/{id}" }, method = RequestMethod.GET)
	public String playlistDetail(@PathVariable("id") int id, ModelMap modelMap) {

		Playlist playlist = playlistService.find(id);
		CustomPlaylistModel customPlaylistModel = new CustomPlaylistModel(playlist);
		modelMap.put("playlist", customPlaylistModel);
		List<TrackCustomModel> trackCustomModels = new ArrayList<TrackCustomModel>();
		for (Track track : playlist.getTracks()) {
			TrackCustomModel trackCustomModel = new TrackCustomModel(track);
			trackCustomModels.add(trackCustomModel);
		}
		modelMap.put("tracks", trackCustomModels);

		return "customPlaylist/playlistDetail";
	}

	@RequestMapping(value = { "delete/{id}" }, method = RequestMethod.GET)
	public String delete(@PathVariable("id") int id, ModelMap modelMap) {
		Playlist playlist = playlistService.find(id);
		int accountId = 0 ; 

		Account account = new Account();
		String acc_id = cookieService.getValue("acc_id", "");
		if (acc_id.equalsIgnoreCase("")) {
			return "redirect:/login/login";
		} else {
			account = accountService.findById(Integer.parseInt(acc_id));
		}
		if (account != null) {
			for(AccountPlaylist accountPlaylist2 : account.getAccountPlaylists()) {
				if( accountPlaylist2.isIsOwn() == true) {
					accountId = accountPlaylist2.getAccount().getId() ; 
					break;
				}
			}
			if (accountId!= account.getId()) {
				return "redirect:/login/notfound";
			} else {
				accountPlaylistService.removeAccountHasAlbum(playlist);
				playlistService.delete(id);
			}
		}

		return "redirect:/customPlaylist/";
	}

	@RequestMapping(value = "delete-track", method = RequestMethod.GET)
	public ResponseEntity<List<TrackCustomModel>> deleteTrack(@RequestParam(value = "id", required = false) int id,
			@RequestParam(value = "playlistId", required = false) int playlistId) {
		try {

			Playlist playlist = playlistService.find(playlistId);
			playlist.getTracks().remove(trackService.findById(id));
			playlistService.save(playlist);

			List<TrackCustomModel> tracks = new ArrayList<TrackCustomModel>();
			for (Track track : playlist.getTracks()) {
				TrackCustomModel trackCustomModel = new TrackCustomModel(track);
				tracks.add(trackCustomModel);
			}

			return new ResponseEntity<List<TrackCustomModel>>(tracks, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<TrackCustomModel>>(HttpStatus.BAD_REQUEST);
		}
	}

}
