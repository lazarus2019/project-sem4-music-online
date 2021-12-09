package com.demo.controllers.user;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.entities.Account;
import com.demo.entities.AccountPlaylist;
import com.demo.entities.AccountPlaylistId;
import com.demo.entities.Advertisement;
import com.demo.entities.Playlist;
import com.demo.entities.PlaylistCategory;
import com.demo.entities.Status;
import com.demo.entities.Track;
import com.demo.models.AlbumInfo;
import com.demo.services.AccountPlaylistService;
import com.demo.services.AccountService;
import com.demo.services.AdvertisementService;
import com.demo.services.CookieService;
import com.demo.services.PackageInfoService;
import com.demo.services.PlaylistService;
import com.demo.services.TrackService;

@Controller
@RequestMapping(value = {"player"})
public class PlayerController {
	
	@Autowired
	private TrackService trackService;
	
	@Autowired
	private CookieService cookieService;
	
	@Autowired
	private AccountService accountService;
	
	@Autowired
	private PlaylistService playlistService;
	
	@Autowired
	private PackageInfoService packageInfoService;
	
	@Autowired
	private AccountPlaylistService accountPlaylistService;
	
	@Autowired
	private AdvertisementService advertisementService;
	
	@RequestMapping(value = {"plusListenTrack" }, method = RequestMethod.GET, produces = MimeTypeUtils.TEXT_PLAIN_VALUE)
	public ResponseEntity<Void> searchTopArtist(@RequestParam("trackId") int trackId) {
		Track track = trackService.findById(trackId);
		if(track.getId() != 0) {
			int listens = track.getListens() + 1;
			track.setListens(listens);
			trackService.save(track);
		}
		Account account = new Account() ; 
		String id = cookieService.getValue("acc_id", "") ; 
		if(!id.equalsIgnoreCase("")) {
			account = accountService.findById(Integer.parseInt(id));	
			Playlist playlist = new Playlist();
			for(AccountPlaylist accountPlaylist : account.getAccountPlaylists()) {
				if(accountPlaylist.getPlaylist().getPlaylistCategory().getId() == 1) {
					playlist = accountPlaylist.getPlaylist();
					break;
				}
			}
			
			if(playlist.getId() != null) {
				playlist.getTracks().add(trackService.findById(trackId));
				playlistService.save(playlist);
			}else {
				Status status = new Status();
				status.setId(1);
				PlaylistCategory playlistCategory = new PlaylistCategory();
				playlistCategory.setId(1);
				playlist.setDescription("");
				playlist.setLikes(0);
				playlist.setPublishDate(new Date());
				playlist.setLastUpdated(new Date());
				playlist.setThumbnail("");
				playlist.setStatus(status);
				playlist.setTitle("Recent Played");
				playlist.setPlaylistCategory(playlistCategory);
				
				Playlist playlistTmp = playlistService.save(playlist);
				if(playlistTmp.getId() != null) {
					accountPlaylistService.setOwnerAlbum(playlistTmp, account.getId());
					playlist.getTracks().add(trackService.findById(trackId));
					playlistService.save(playlist);
				}
			}
		}
		try {
			return new ResponseEntity<Void>(HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = { "checkPremium" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Boolean> checkPremium() {
		boolean result = false;
		String id = cookieService.getValue("acc_id", ""); 
		if(!id.equalsIgnoreCase("")) {
			if(packageInfoService.checkPremiumByAccountId(Integer.parseInt(id))) {
				result = true;
			}
		}	
		try {
			return new ResponseEntity<Boolean>(result, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Boolean>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = { "findActiveAds" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Advertisement> findActiveAds() {
		try {
			return new ResponseEntity<Advertisement>(advertisementService.findActiveAds(), HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Advertisement>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = { "saveAlbumToLibrary" }, method = RequestMethod.GET, produces = MimeTypeUtils.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> saveAlbumToLibrary(@RequestParam("id") int albumId) {
		String result = "";
		String id = cookieService.getValue("acc_id", ""); 
		if(!id.equalsIgnoreCase("")) {
			int accountId = Integer.parseInt(id);
			if(accountPlaylistService.checkAlbumOwner(accountId, albumId)) {
				result = "HAS_OWN";
			}else {
				accountPlaylistService.setPlaylistForAccount(accountId, albumId);				
				Playlist album = playlistService.find(albumId);
				int like = album.getLikes();
				album.setLikes(like++);
				playlistService.save(album);
				result = "OK";
			}
		}else {
			result = "MUST_SIGN_IN";
		}
		try {
			return new ResponseEntity<String>(result, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<String>("ERROR", HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = { "savePlaylistToLibrary" }, method = RequestMethod.GET, produces = MimeTypeUtils.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> savePlaylistToLibrary(@RequestParam("title") String title, @RequestParam("trackIds") String[] trackIds) {
		String result = "";
		String id = cookieService.getValue("acc_id", ""); 
		if(!id.equalsIgnoreCase("")) {
			int accountId = Integer.parseInt(id);			
			Playlist playlist = new Playlist();
			Status status = new Status();
			status.setId(1);
			PlaylistCategory playlistCategory = new PlaylistCategory();
			playlistCategory.setId(1);
			playlist.setDescription("");
			playlist.setLikes(0);
			playlist.setPublishDate(new Date());
			playlist.setLastUpdated(new Date());
			playlist.setThumbnail("");
			playlist.setStatus(status);
			playlist.setTitle(title);
			playlist.setPlaylistCategory(playlistCategory);
			
			Playlist playlistTmp = playlistService.save(playlist);
			if(playlistTmp.getId() != null) {
				accountPlaylistService.setPlaylistForAccount(accountId, playlistTmp.getId());
				if(trackIds != null) {
					for(String trackId : trackIds) {
						int trackIdInt = Integer.parseInt(trackId);
						playlist.getTracks().add(trackService.findById(trackIdInt));
						playlistService.save(playlist);										
					}
				}
				result = playlistTmp.getId().toString();
			}
		}else {
			result = "MUST_SIGN_IN";
		}
		try {
			return new ResponseEntity<String>(result, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
	}
	
	
}