package com.demo.controllers.user;

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
import org.springframework.data.domain.PageRequest;

import com.demo.models.AlbumInfo;
import com.demo.models.ArtistInfo;
import com.demo.models.TrackInfo;
import com.demo.services.AccountPlaylistService;
import com.demo.services.AlbumService;
import com.demo.services.ArtistService;
import com.demo.services.ArtistTrackService;
import com.demo.services.PlaylistService;
import com.demo.services.TrackService;

@Controller
@RequestMapping(value = { "", "home" })
public class HomeController {
	
	@Autowired
	private ArtistService artistService;
	
	@Autowired
	private TrackService trackService;
	
	@Autowired
	private AlbumService albumService;
	
	@Autowired
	private AccountPlaylistService accountPlaylistService;
	
	@Autowired
	private ArtistTrackService artistTrackService;
	
	@Autowired
	private PlaylistService playlistService;

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		modelMap.addAttribute("popularArtists", artistService.getPopularArtists(PageRequest.of(0, 6)));
		modelMap.addAttribute("newReleaseTracks", trackService.getAllNewRelease());
		modelMap.addAttribute("upcomingAlbums", playlistService.getAllUpcommingAlbum());
		return "home/index";
	}
	
	@RequestMapping(value = { "searchTopArtist" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<ArtistInfo>> searchTopArtist(@RequestParam("keyword") String keyword, ModelMap modelMap) {
		List<ArtistInfo> artistInfos = artistService.searchByKeyword(keyword, PageRequest.of(0, 6));
		try {
			return new ResponseEntity<List<ArtistInfo>>(artistInfos, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<ArtistInfo>>(HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value = { "searchTopTrack" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<TrackInfo>> searchTopTrack(@RequestParam("keyword") String keyword, ModelMap modelMap) {
		List<TrackInfo> trackInfos = trackService.searchByTitle(keyword, PageRequest.of(0, 6));
		for(TrackInfo trackInfo : trackInfos) {
			trackInfo.setArtist(artistTrackService.getAccountByTrackId(trackInfo.getId()));
		}
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
		TrackInfo track = trackService.findById(trackId);
	
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
