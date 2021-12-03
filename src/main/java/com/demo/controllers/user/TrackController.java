package com.demo.controllers.user;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.aspectj.weaver.ast.Var;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
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
import com.demo.entities.Status;
import com.demo.entities.Track;
import com.demo.helpers.FileUploadHelper;
import com.demo.models.AlbumInfo;
import com.demo.models.ArtistInfo;
import com.demo.models.TrackInfo;
import com.demo.services.AccountPlaylistService;
import com.demo.services.AccountService;
import com.demo.services.ArtistTrackService;
import com.demo.services.CommentService;
import com.demo.services.GenresService;
import com.demo.services.PlaylistTrackService;
import com.demo.services.TrackService;

@Controller
@RequestMapping(value = {"track"})
public class TrackController implements ServletContextAware{
	
	private ServletContext servletContext;
	
	@Autowired
	private TrackService trackService;
	
	@Autowired
	private GenresService genresService;
	
	@Autowired
	private AccountService accountService;
	
	@Autowired
	private AccountPlaylistService accountPlaylistService;
	
	@Autowired
	private ArtistTrackService artistTrackService;
	
	@Autowired
	private PlaylistTrackService playlistTrackService;
	
	@Autowired
	private CommentService commentService;
	
	@RequestMapping( value = {"index/{id}" } , method = RequestMethod.GET )
	public String index( @PathVariable("id") int id , ModelMap modelMap) {
		modelMap.put("listtrack", trackService.findTrackByGenresId(id));
		return "track/index" ; 
	}
	/*
	 * @RequestMapping( value = {"index" }) public String index() { return
	 * "track/index" ; }
	 */
	
	@RequestMapping( value = { "" })
	public String index(@RequestParam("keyword")String keyword, @RequestParam("type")String type) {
		System.out.println("keyword:" + keyword);
		System.out.println("type:" + type);
		return "track/index" ; 
	}
	
	@RequestMapping( value = { "add" })
	public String add(ModelMap modelMap) {
		int artistId = 5;
		modelMap.addAttribute("artists", accountService.getArtistWithoutId(artistId));
		modelMap.addAttribute("genres", genresService.findAll());
		modelMap.addAttribute("albums", accountPlaylistService.getAlbumsByArtistId(artistId));
		return "track/add" ; 
	}
	
	@RequestMapping( value = { "add" }, method = RequestMethod.POST)
	public String add(@ModelAttribute("track") Track track, @RequestParam("thumbnailTrack") MultipartFile thumbnailTrack, @RequestParam("audioTrack") MultipartFile audioTrack, @RequestParam(value = "artists", required = false) String[] artists, @RequestParam(value = "albums", required = false) String[] albums, @RequestParam(value = "trackDate", required = false)String trackDate, @RequestParam("duration")int duration) {
		int artistId = 5;
		FileUploadHelper fileHelper = new FileUploadHelper();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String directionThumbnail = "images/tracks/";
		String directionAudio = "audio/tracks/";
		
		Status status = new Status();
		status.setId(2);
		String fileName = fileHelper.uploadFile(audioTrack, directionAudio, servletContext);
		String thumbnail = fileHelper.uploadFile(thumbnailTrack, directionThumbnail, servletContext);
		if(fileName != null && thumbnail != null) {
			Track newTrack = new Track();		
			newTrack.setGenres(track.getGenres());
			newTrack.setStatus(status);
			newTrack.setFileName(fileName);
			newTrack.setTitle(track.getTitle());
			newTrack.setLyrics(track.getLyrics());
			newTrack.setThumbnail(thumbnail);
			newTrack.setLikes(0);
			newTrack.setDuration(duration);
			newTrack.setListens(0);
			newTrack.setBaseListens(0);
			newTrack.setWeeklyListens(0);
			newTrack.setIsPremium(track.isIsPremium());
			if(trackDate !="") {
				try {
					newTrack.setPublishDate(simpleDateFormat.parse(trackDate));
				} catch (ParseException e1) {
					System.out.println(e1.getMessage());
				}			
			}else {
				newTrack.setPublishDate(new Date());
			}
			
			Track trackTmp = trackService.save(newTrack);
			if(trackTmp.getId() != 0) {
				// Set owner track
				artistTrackService.setOwnerTrack(artistId, trackTmp.getId());
				
				// Set feat artists
				if(artists != null) {
					for(String featArtistIdString : artists) {
						int featArtistId = Integer.parseInt(featArtistIdString);
						artistTrackService.addFeatArtistToTrack(trackTmp, featArtistId);
					}						
				}
				
				// Set track for albums
				if(albums != null) {
					for(String albumIdString : albums) {
						int albumId = Integer.parseInt(albumIdString);
						playlistTrackService.addTrackToAlbum(albumId, trackTmp.getId());
					}						
				}
			}
		}
		
		return "redirect:/track/manage" ; 
	}
	
	@RequestMapping( value = { "edit/{id}" }, method = RequestMethod.GET)
	public String edit(ModelMap modelMap, @PathVariable("id")int trackId) {
		int artistId = 5;
		Track track = trackService.findById(trackId);
		modelMap.put("artists", accountService.getArtistWithoutId(artistId));
		modelMap.put("genres", genresService.findAll());
		modelMap.put("albums", accountPlaylistService.getAlbumsByArtistId(artistId));
		modelMap.put("featArtistIds", artistTrackService.getFeatAccountIdByTrackId(trackId));
		modelMap.put("albumOwnIds", playlistTrackService.getAlbumOwnIdsByTrackId(trackId));
		modelMap.put("trackId", track.getId());
		modelMap.put("track", track);
		modelMap.put("trackDate", track.getPublishDate());
		modelMap.put("statusId", track.getStatus().getId());
		modelMap.put("thumbnail", track.getThumbnail());
		return "track/edit" ; 
	}
	
	@RequestMapping( value = { "edit" }, method = RequestMethod.POST)
	public String edit(@ModelAttribute("track") Track track, @RequestParam("thumbnailTrack") MultipartFile thumbnailTrack, @RequestParam(value = "artists", required = false) String[] artists, @RequestParam(value = "albums", required = false) String[] albums, @RequestParam(value = "isHidden", required = false) String isHidden) {
		int artistId = 5;
		Track newTrack = trackService.findById(track.getId());
		FileUploadHelper fileHelper = new FileUploadHelper();
		String directionThumbnail = "images/tracks/";
		
		// Set new thumbnail
		if (!thumbnailTrack.isEmpty() && thumbnailTrack.getSize() > 0) {
			String thumbnail = fileHelper.uploadFile(thumbnailTrack, directionThumbnail, servletContext);
			if(thumbnail != null) {
				boolean isDelete = fileHelper.deleteFile(track.getThumbnail(), directionThumbnail, servletContext);
				if(isDelete) {
					newTrack.setThumbnail(thumbnail);
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
		newTrack.setStatus(status);	
		
		newTrack.setGenres(track.getGenres());
		newTrack.setTitle(track.getTitle());
		newTrack.setLyrics(track.getLyrics());
		newTrack.setLikes(track.getLikes());
		newTrack.setDuration(track.getDuration());
		newTrack.setListens(track.getListens());
		newTrack.setBaseListens(track.getBaseListens());
		newTrack.setWeeklyListens(track.getWeeklyListens());
		newTrack.setIsPremium(track.isIsPremium());
//		trackService.save(newTrack);
		
		// Delete old feat artists from artist track
		artistTrackService.removeFeatArtistFromTrack(newTrack, artistId);
		
		// Add new feat artists
		if(artists != null) {
			for(String featArtistIdString : artists) {
				int featArtistId = Integer.parseInt(featArtistIdString);
				artistTrackService.addFeatArtistToTrack(newTrack, featArtistId);
			}						
		}
				
		// Delete old track from album
		playlistTrackService.removeTrackFromAllAlbum(newTrack);
		
		// Add track to album
		if(albums != null) {
			for(String albumIdString : albums) {
				int albumId = Integer.parseInt(albumIdString);
				playlistTrackService.addTrackToAlbum(albumId, newTrack.getId());
			}						
		}
		
		return "redirect:/track/manage" ; 
	}	

	@RequestMapping(value = { "delete" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Boolean> searchTopArtist(@RequestParam("id") int trackId) {
		boolean result = false;
		Track track = trackService.findById(trackId);
		
		artistTrackService.removeAllArtistFromTrack(track);
		
		playlistTrackService.removeTrackFromAllAlbum(track);
		
		commentService.removeAllCommentInTrack(track);
		
		trackService.delete(trackId);
		
		result = true;
		try {
			return new ResponseEntity<Boolean>(result, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Boolean>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = { "reloadAlbums" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<AlbumInfo>> reloadTracks(@RequestParam("id") int artistId) {
//		int artistId = 5;
		List<AlbumInfo> albumInfos = accountPlaylistService.getAlbumsByArtistId(artistId);		
		try {
			return new ResponseEntity<List<AlbumInfo>>(albumInfos, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<AlbumInfo>>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping( value = { "manage" })
	public String manage() {
		return "track/manage" ; 
	}
	public TrackController() {
		// TODO Auto-generated constructor stub
	}
	
	public void showElList(String[] list) {
		for(String content : list) {
			System.out.println(content);
		}
	}

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}
}
