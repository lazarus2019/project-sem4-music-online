package com.demo.controllers.user;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import com.demo.entities.Playlist;
import com.demo.entities.PlaylistCategory;
import com.demo.entities.Status;
import com.demo.entities.Track;
import com.demo.helpers.FileUploadHelper;
import com.demo.models.TrackInfo;
import com.demo.services.AccountPlaylistService;
import com.demo.services.ArtistTrackService;
import com.demo.services.PlaylistService;
import com.demo.services.PlaylistTrackService;

@Controller
@RequestMapping(value = { "playlist"} )
public class PlaylistUserController implements ServletContextAware{
	
	private ServletContext servletContext;
	
	@Autowired
	private ArtistTrackService artistTrackService;
	
	@Autowired
	private PlaylistService playlistService;
	
	@Autowired
	private AccountPlaylistService accountPlaylistService;
	
	@Autowired
	private PlaylistTrackService playlistTrackService;

	@RequestMapping( value = {"","index", "manage" })
	public String index(ModelMap modelMap) {
		int artistId = 5;
		modelMap.put("albums", accountPlaylistService.getAlbumsByArtistId(artistId));
		return "playlist/manage" ; 
	}
	
	@RequestMapping( value = { "add" })
	public String add(ModelMap modelMap) {
		int artistId = 5;
		modelMap.put("tracks", artistTrackService.getTracksOfArtist(artistId));
		return "playlist/add" ; 
	}
	
	@RequestMapping( value = { "add" }, method = RequestMethod.POST)
	public String add(@ModelAttribute("playlist") Playlist playlist, @RequestParam(value = "albumDate", required = false) String publishDate, @RequestParam("thumbnailAlbum") MultipartFile thumbnailAlbum, @RequestParam(value = "tracks", required = false) String[] tracks) {
		int artistId = 5;
		FileUploadHelper fileHelper = new FileUploadHelper();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String directionThumbnail = "images/playlist/";
		
		String thumbnail = fileHelper.uploadFile(thumbnailAlbum, directionThumbnail, servletContext);
		if(thumbnail != null) {
			PlaylistCategory playlistCategory = new PlaylistCategory();
			playlistCategory.setId(3);
			
			Status status = new Status();
			status.setId(1);
			status.setId(3);
			
			Playlist newAlbum = new Playlist();
			newAlbum.setPlaylistCategory(playlistCategory);
			newAlbum.setStatus(status);
			newAlbum.setTitle(playlist.getTitle());
			newAlbum.setThumbnail(thumbnail);
			if(publishDate != "") {
				try {
					newAlbum.setPublishDate(simpleDateFormat.parse(publishDate));
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}else {
				newAlbum.setPublishDate(new Date());
			}
			newAlbum.setLastUpdated(new Date());
			newAlbum.setDescription(playlist.getDescription());
			newAlbum.setLikes(0);
			
			Playlist albumTmp = playlistService.save(newAlbum);
			if(albumTmp.getId() != 0) {
				
				// Set album owner
				accountPlaylistService.setOwnerAlbum(albumTmp, artistId);
				
				// Set tracks for album
				if(tracks != null) {
					for(String trackIdString : tracks) {
						int trackId = Integer.parseInt(trackIdString);
						playlistTrackService.addTrackToAlbum(albumTmp.getId(), trackId);
					}		
				}
				
			}			
		}
		
		return "redirect:/playlist/manage" ; 
	}
	
	
	@RequestMapping( value = { "edit/{id}" })
	public String edit(ModelMap modelMap, @PathVariable("id") int albumId) {
		int artistId = 5;
		Playlist album = playlistService.find(albumId);
		modelMap.put("tracks", artistTrackService.getTracksOfArtist(artistId));
		modelMap.put("chooseTracks", album.findTracks());
		modelMap.put("albumId", album.getId());
		modelMap.put("playlist", album);
		modelMap.put("thumbnail", album.getThumbnail());
		modelMap.put("statusId", album.getStatus().getId());
		modelMap.put("albumDate", album.getPublishDate());
		modelMap.put("albumId", album.getId());
		return "playlist/edit" ; 
	}
	
	
	@RequestMapping( value = { "edit" }, method = RequestMethod.POST)
	public String edit(@ModelAttribute("playlist") Playlist playlist, @RequestParam("thumbnailAlbum") MultipartFile thumbnailAlbum, @RequestParam(value = "tracks", required = false) String[] tracks, @RequestParam(value = "isHidden", required = false) String isHidden) {
		int artistId = 5;
		Playlist album = playlistService.find(playlist.getId());
		FileUploadHelper fileHelper = new FileUploadHelper();
		String directionThumbnail = "images/playlist/";
		
		// Set new thumbnail
		if (!thumbnailAlbum.isEmpty() && thumbnailAlbum.getSize() > 0) {
			String thumbnail = fileHelper.uploadFile(thumbnailAlbum, directionThumbnail, servletContext);
			if(thumbnail != null) {
				boolean isDelete = fileHelper.deleteFile(album.getThumbnail(), directionThumbnail, servletContext);
				if(isDelete) {
					album.setThumbnail(thumbnail);
				}				
			}
		}
		
		// Check/Set publish/hidden
		Status status = new Status();			
		if(isHidden != null) {
			status.setId(3);
		}else {
			status.setId(1);
		}
		album.setStatus(status);	
		
		album.setTitle(playlist.getTitle());
		album.setDescription(playlist.getDescription());
		album.setLastUpdated(new Date());
		
		// Update album
//		playlistService.save(album);
		
		// Delete old tracks from album
		playlistTrackService.removeAllTrackFromAlbum(album);
		
		// Add tracks to album
		if(tracks != null) {
			for(String trackIdString : tracks) {
				int trackId = Integer.parseInt(trackIdString);
				playlistTrackService.addTrackToAlbum(album.getId(), trackId);
			}		
		}		
		
		return "redirect:/playlist/manage" ; 
	}
	
	@RequestMapping(value = { "reloadTracks" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<TrackInfo>> reloadTracks(@RequestParam("id") int artistId) {
//		int artistId = 5;
		List<TrackInfo> trackInfos = new ArrayList<TrackInfo>();
		for(Track track : artistTrackService.getTracksOfArtist(artistId)) {
			TrackInfo trackInfo = new TrackInfo();
			trackInfo.setId(track.getId());
			trackInfo.setStatusId(track.getStatus().getId());
			trackInfo.setTitle(track.getTitle());
			trackInfo.setPremium(track.isIsPremium());
			
			trackInfos.add(trackInfo);
		}
		
		try {
			return new ResponseEntity<List<TrackInfo>>(trackInfos, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<TrackInfo>>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = { "delete" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Boolean> searchTopArtist(@RequestParam("id") int albumId) {
		boolean result = false;
		Playlist album = playlistService.find(albumId);
		
		accountPlaylistService.removeAccountHasAlbum(album);
		
		playlistTrackService.removeAllTrackFromAlbum(album);
		
		playlistService.delete(albumId);
		
		result = true;
		try {
			return new ResponseEntity<Boolean>(result, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Boolean>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}
	
	public void showElList(String[] list) {
		for(String content : list) {
			System.out.println(content);
		}
	}
}
