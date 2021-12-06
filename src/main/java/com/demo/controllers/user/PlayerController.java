package com.demo.controllers.user;

import java.util.Date;

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
import com.demo.entities.Playlist;
import com.demo.entities.PlaylistCategory;
import com.demo.entities.Status;
import com.demo.entities.Track;
import com.demo.services.AccountPlaylistService;
import com.demo.services.AccountService;
import com.demo.services.CookieService;
import com.demo.services.PlaylistService;
import com.demo.services.PlaylistTrackService;
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
	private PlaylistTrackService playlistTrackService;
	
	@Autowired
	private PlaylistService playlistService;
	
	@Autowired
	private AccountPlaylistService accountPlaylistService;

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
				playlistTrackService.addTrackToAlbum(playlist.getId(), trackId);
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
					playlistTrackService.addTrackToAlbum(playlistTmp.getId(), trackId);
				}
			}
		}
		try {
			return new ResponseEntity<Void>(HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
	}
	
}
