package com.demo.controllers.user;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.entities.Account;
import com.demo.entities.AccountPlaylist;
import com.demo.entities.ArtistTrack;
import com.demo.entities.Playlist;
import com.demo.entities.Track;
import com.demo.models.ArtistDetail;
import com.demo.models.ArtistsInfor;
import com.demo.models.PlaylistModel;
import com.demo.services.AccountService;
import com.demo.services.ArtistService;
import com.demo.services.CookieService;
import com.demo.services.PlaylistService;
import com.demo.services.TrackService;

@Controller
@RequestMapping(value = { "artist" })
public class ArtistsController {

	@Autowired
	private AccountService accountService;

	@Autowired
	CookieService cookieService;

	@Autowired
	private HttpSession session;

	@Autowired
	private PlaylistService playlistService;

	@Autowired
	private TrackService trackService;
	
	@Autowired
	private ArtistService artistService;

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
	
	@RequestMapping(value = { "search-base" }, method = RequestMethod.GET)
	public String index(@RequestParam("keyword") String keyword, ModelMap modelMap) {
		try {			
			modelMap.put("arti", artistService.searchByKeyword(keyword));
			
		} catch (Exception e) {
			modelMap.put("erro", e.getMessage());
		}
		
		return "artist/index";
	}

	@RequestMapping(value = { "id/{id}" }, method = RequestMethod.GET)
	public String artistdetail(@PathVariable("id") int id, ModelMap modelMap) {
		try {
			ArtistDetail artistDetail = accountService.getArtistByIdAccount(id);
			modelMap.put("arti", artistDetail);

			Account account = new Account();
			account = accountService.findById(id);

			List<Track> tracks = new ArrayList<Track>();
			for (ArtistTrack artistTrack : account.getArtistTracks()) {
				if (artistTrack.isIsOwn()) {
					tracks.add(artistTrack.getTrack());
				}
			}

			List<Playlist> track = new ArrayList<Playlist>();
			for (AccountPlaylist artistTrack : account.getAccountPlaylists()) {
				if (artistTrack.isIsOwn()) {
					track.add(artistTrack.getPlaylist());
					// System.out.println(artistTrack.getPlaylist().getTitle());
				}
			}

			modelMap.put("album", track);
			modelMap.put("trac", tracks);
		} catch (Exception e) {
			modelMap.put("erro", e.getMessage());
		}

		return "artist/artistDetail";
	}

	// start add playlist

	@RequestMapping(value = {
			"show-playlist" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<PlaylistModel>> showPlaylist(@RequestParam(value = "id", required = false) int id) {
		try {
			List<PlaylistModel> playlistModels = new ArrayList<PlaylistModel>();
			for (Playlist playlist : playlistService.getAllPlaylist()) {
				PlaylistModel playlistModel = new PlaylistModel();
				playlistModel.setId(playlist.getId());
				playlistModel.setTitle(playlist.getTitle());
				playlistModels.add(playlistModel);
			}
			session.setAttribute("trackId", id);
			return new ResponseEntity<List<PlaylistModel>>(playlistModels, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<PlaylistModel>>(HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value = {
			"search-playlist" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<PlaylistModel>> searchPlaylist(
			@RequestParam(value = "keyword", required = false) String keyword) {
		try {
			List<PlaylistModel> playlistModels = new ArrayList<PlaylistModel>();
			if (keyword != null) {
				for (Playlist playlist : playlistService.searchByTitle(keyword)) {
					PlaylistModel playlistModel = new PlaylistModel();
					playlistModel.setId(playlist.getId());
					playlistModel.setTitle(playlist.getTitle());
					playlistModels.add(playlistModel);
				}
			} else {
				for (Playlist playlist : playlistService.getAllPlaylist()) {
					PlaylistModel playlistModel = new PlaylistModel();
					playlistModel.setId(playlist.getId());
					playlistModel.setTitle(playlist.getTitle());
					playlistModels.add(playlistModel);
				}
			}
			return new ResponseEntity<List<PlaylistModel>>(playlistModels, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<PlaylistModel>>(HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value = {
			"add-to-playlist" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Boolean> addToPlaylist(@RequestParam(value = "id", required = false) int id,
			HttpServletRequest request) {
		try {
			System.out.println("id: " + id);
			boolean flag = false;
			int trackId = (Integer) session.getAttribute("trackId");
			Track track = trackService.findById(trackId);
			Playlist playlist = playlistService.find(id);
			boolean status = playlist.getTracks().contains(track);

			if (!status) {
				playlist.getTracks().add(track);
				playlistService.save(playlist);
				flag = true;
			} else {
				flag = false;
			}

			return new ResponseEntity<Boolean>(flag, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Boolean>(HttpStatus.BAD_REQUEST);
		}
	}

	// End add playlist

	// Start add like
	
	@RequestMapping(value = {"add/{id}"}, method = RequestMethod.GET)
	public String addLiked(ModelMap modelMap, @PathVariable("id") int id ) {
		
		Account account = new Account();
		String ids = cookieService.getValue("acc_id", "");
		if (ids.equalsIgnoreCase("")) {
			return "redirect:/login/login";
		} else {
			account = accountService.findById(Integer.parseInt(ids));
			Set<AccountPlaylist> s = account.getAccountPlaylists();
			int playlistId = 0;
			
			Track track = trackService.findById(id);
			for( AccountPlaylist acc : s ) {
				if(acc.getPlaylist().getPlaylistCategory().getId().equals(2)) {
					//playlist = acc.getPlaylist();
					playlistId = acc.getPlaylist().getId();
					System.out.println(playlistId);
				}
			}
			
			Playlist playlist = playlistService.find(playlistId);
			
			boolean status = playlist.getTracks().contains(track);

			if (!status) {
				playlist.getTracks().add(track);
				playlistService.save(playlist);
				
			} else {
				playlist.getTracks().remove(track);
				playlistService.save(playlist);
			}
			
			
		}
		return "artist/artistDetail";
	}
	

	@RequestMapping(value = {
			"add-to-liked" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Boolean> addToLiked(@RequestParam(value = "id", required = false) int id,
			HttpServletRequest request) {
		try {
			System.out.println("id: " + id);
			boolean flag = false;
			Account account = new Account();
			String ids = cookieService.getValue("acc_id", "");
			if (ids.equalsIgnoreCase("")) {
				
			} else {
				account = accountService.findById(Integer.parseInt(ids));
				Set<AccountPlaylist> s = account.getAccountPlaylists();
				int playlistId = 0;
				
				Track track = trackService.findById(id);
				for( AccountPlaylist acc : s ) {
					if(acc.getPlaylist().getPlaylistCategory().getId().equals(2)) {
						//playlist = acc.getPlaylist();
						playlistId = acc.getPlaylist().getId();
						System.out.println(playlistId);
					}
				}
				
				Playlist playlist = playlistService.find(playlistId);
				
				boolean status = playlist.getTracks().contains(track);

				if (!status) {
					playlist.getTracks().add(track);
					playlistService.save(playlist);
					flag = true;
				} else {
					playlist.getTracks().remove(track);
					playlistService.save(playlist);
					flag = false;
				}
				
				
				
			}
			return new ResponseEntity<Boolean>(flag, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Boolean>(HttpStatus.BAD_REQUEST);
		}
	}

	// END add like

	@RequestMapping(value = { "yourtrack" }, method = RequestMethod.GET)
	public String yourtrack(ModelMap modelMap, Authentication authentication) {
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
				modelMap.put("accountSignined", account);
				List<Track> tracks = new ArrayList<Track>();
				for (ArtistTrack artistTrack : account.getArtistTracks()) {
					if (artistTrack.isIsOwn()) {
						tracks.add(artistTrack.getTrack());
					}
				}

				modelMap.put("tracks", tracks);

			}
		}
		return "artist/yourtrack";
	}

	@RequestMapping(value = { "youralbum" }, method = RequestMethod.GET)
	public String youralbum(ModelMap modelMap, Authentication authentication) {
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
				modelMap.put("accountSignined", account);

				List<Playlist> tracks = new ArrayList<Playlist>();
				for (AccountPlaylist artistTrack : account.getAccountPlaylists()) {
					if (artistTrack.isIsOwn()) {
						tracks.add(artistTrack.getPlaylist());
						// System.out.println(artistTrack.getPlaylist().getTitle());
					}
				}

				modelMap.put("albums", tracks);

			}
		}
		return "artist/youralbum";
	}

	@RequestMapping(value = "albumDetail", method = RequestMethod.GET)
	public String albumDetail(ModelMap modelMap, Authentication authentication) {
		return "artist/albumDetail";
	}

	// New

	@RequestMapping(value = { "search" }, method = RequestMethod.GET)
	public String search(@RequestParam("keyword") String keyword, ModelMap modelMap) {
		try {
			List<ArtistsInfor> searchArtis = accountService.getSearchArtis(keyword);
			modelMap.put("arti", searchArtis);
		} catch (Exception e) {
			modelMap.put("erro", e.getMessage());
		}

		return "artist/index";
	}

}