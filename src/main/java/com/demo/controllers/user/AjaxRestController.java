package com.demo.controllers.user;

import java.util.ArrayList;
import java.util.List;

import org.aspectj.util.IStructureModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.demo.entities.Account;
import com.demo.entities.AccountPlaylist;
import com.demo.entities.Playlist;
import com.demo.entities.Status;
import com.demo.models.PlaylistModel;
import com.demo.models.TrackInfo;
import com.demo.services.PlaylistService;

@RestController
@RequestMapping(value = {"/ajax"})
public class AjaxRestController {


	@Autowired
	private PlaylistService playlistService;
	
	@RequestMapping(value = { "edit-playlist-status" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<PlaylistModel>> editPlaylistStatus(@RequestParam(value = "id", required = false) int id) {
		try {
			Playlist playlist = playlistService.find(id);
			Status status = new Status();
			if (playlist.getStatus().getId() == 1) {
				status.setId(3);
				playlist.setStatus(status);
			} else if (playlist.getStatus().getId() == 3) {
				status.setId(1);
				playlist.setStatus(status);
			}
			playlistService.save(playlist);
			
			List<PlaylistModel> playlists = playlistService.getPlaylistModel(playlistService.getAllPlaylist());
			return new ResponseEntity<List<PlaylistModel>>(playlists, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<PlaylistModel>>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = { "edit-album-status" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<PlaylistModel>> editAlbumStatus(@RequestParam(value = "id", required = false) int id) {
		try {
			Playlist playlist = playlistService.find(id);
			Status status = new Status();
			if (playlist.getStatus().getId() == 1) {
				status.setId(3);
				playlist.setStatus(status);
			} else if (playlist.getStatus().getId() == 3) {
				status.setId(1);
				playlist.setStatus(status);
			}
			playlistService.save(playlist);
			
			List<PlaylistModel> playlists = playlistService.getPlaylistModel(playlistService.getAllAlbum());
			return new ResponseEntity<List<PlaylistModel>>(playlists, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<PlaylistModel>>(HttpStatus.BAD_REQUEST);
		}
	}
	
}
