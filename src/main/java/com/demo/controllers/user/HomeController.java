package com.demo.controllers.user;

import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.data.domain.PageRequest;

import com.demo.entities.Account;
import com.demo.entities.Track;
import com.demo.helpers.CalculateDateTimeHelper;
import com.demo.models.AlbumInfo;
import com.demo.models.ArtistInfo;
import com.demo.models.TrackInfo;
import com.demo.repositories.AccountRepository;
import com.demo.security.database.CustomUserDetails;
import com.demo.security.oauth2.CustomOAuth2User;
import com.demo.services.AccountPlaylistService;
import com.demo.services.AccountService;
import com.demo.services.AlbumService;
import com.demo.services.CookieService;
import com.demo.services.NotificationService;
import com.demo.services.PlaylistService;
import com.demo.services.SessionService;
import com.demo.services.TrackService;

@Controller
@RequestMapping(value = { "", "home", "user/home" })
public class HomeController {

	@Autowired
	private TrackService trackService;
	
	@Autowired
	private AccountService accountService;

	@Autowired
	private CookieService cookieService;
	
	@Autowired
	private AlbumService albumService;
	
	@Autowired
	private AccountPlaylistService accountPlaylistService;
	
	@Autowired PlaylistService playlistService;

	/*
	 * @RequestMapping(value = { "", "index" }, method = RequestMethod.GET) public
	 * String index() {
	 * 
	 * Calendar c = Calendar.getInstance(); c.set(Calendar.DAY_OF_WEEK,
	 * Calendar.MONDAY); System.out.println("today: " + new Date());
	 * System.out.println("Date " + c.getTime());
	 * 
	 * 
	 * return "home/index"; }
	 */

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap, @RequestParam(value = "local", required = false) String local,
			Authentication authentication) {

		// Authentication authentication =
		// SecurityContextHolder.getContext().getAuthentication() ;
		if (authentication == null || authentication instanceof AnonymousAuthenticationToken) {

		} else {
			String loginType = cookieService.getValue("login_type", "");

			Account account = new Account();
			if (loginType.equalsIgnoreCase("local")) {
				CustomUserDetails customUserDetails = (CustomUserDetails) authentication.getPrincipal();
				String username = customUserDetails.getUsername();
				account = accountService.findByUsername(username);
			}
			if (loginType.equalsIgnoreCase("facebook")) {
				CustomOAuth2User oAuth2User = (CustomOAuth2User) authentication.getPrincipal();
				String email = oAuth2User.getEmail();
				account = accountService.findByEmail(email);
			}

			if (account != null) {

				modelMap.put("accountSignined", account);
				cookieService.add("acc_id", String.valueOf(account.getId()), 5);
			}
		}

		modelMap.addAttribute("popularArtists", accountService.getPopularArtists(PageRequest.of(0, 6)));
		modelMap.addAttribute("newReleaseTracks", trackService.getNewRelease(1, 6));
		modelMap.addAttribute("upcomingAlbums", playlistService.getAllUpcommingAlbum());

		return "home/index";
	}
	
	@RequestMapping(value = { "searchTopArtist" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<ArtistInfo>> searchTopArtist(@RequestParam("keyword") String keyword, ModelMap modelMap) {
		List<ArtistInfo> artistInfos = accountService.searchByKeyword(keyword, PageRequest.of(0, 6));
		try {
			return new ResponseEntity<List<ArtistInfo>>(artistInfos, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<ArtistInfo>>(HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value = { "searchTopTrack" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<TrackInfo>> searchTopTrack(@RequestParam("keyword") String keyword, ModelMap modelMap) {
		List<TrackInfo> trackInfos = trackService.searchByTitle(keyword, PageRequest.of(0, 6));
		try {
			return new ResponseEntity<List<TrackInfo>>(trackInfos, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<TrackInfo>>(HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value = { "searchTopAlbum" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<AlbumInfo>> searchTopAlbum(@RequestParam("keyword") String keyword, ModelMap modelMap) {
		List<AlbumInfo> albumInfos = albumService.searchByKeyword(keyword);
		if(albumInfos.size() > 0) {
			albumInfos = accountPlaylistService.checkAndGetAlbum(albumInfos);
		}
		try {
			return new ResponseEntity<List<AlbumInfo>>(albumInfos, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<AlbumInfo>>(HttpStatus.BAD_REQUEST);
		}
	}
	
	// Get track by id
	@RequestMapping(value = { "getTrackById" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<TrackInfo> getTrackById(@RequestParam("trackId") int trackId, ModelMap modelMap) {
		TrackInfo track = trackService.findByTrackId(trackId);

		try {
			return new ResponseEntity<TrackInfo>(track, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<TrackInfo>(HttpStatus.BAD_REQUEST);
		}
	}
	
	// Get waiting track by genres id
	@RequestMapping(value = { "getWaitingTrack" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<TrackInfo> getWaitingTrack(@RequestParam("trackId") int trackId, @RequestParam("genresId") int genresId, ModelMap modelMap) {
		List<TrackInfo> trackInfos = trackService.getWaitingTrackByGenres(trackId, genresId, PageRequest.of(0, 1));
		try {
			return new ResponseEntity<TrackInfo>(trackInfos.get(0), HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<TrackInfo>(HttpStatus.BAD_REQUEST);
		}
	}

}
