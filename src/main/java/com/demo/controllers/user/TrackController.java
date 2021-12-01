package com.demo.controllers.user;

import java.io.Console;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;

import org.apache.jasper.tagplugins.jstl.core.If;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import com.demo.entities.Account;
import com.demo.entities.ArtistTrack;
import com.demo.entities.ArtistTrackId;
import com.demo.entities.Comment;
import com.demo.entities.Playlist;
import com.demo.entities.PlaylistTrack;
import com.demo.entities.PlaylistTrackId;
import com.demo.entities.Status;
import com.demo.entities.Track;
import com.demo.helpers.FileUploadHelper;
import com.demo.models.AlbumInfo;
import com.demo.models.ArtistInfo;
import com.demo.models.TrackInfo;
import com.demo.models.TrackInfor;
import com.demo.services.AccountPlaylistService;
import com.demo.services.AccountService;
import com.demo.services.ArtistTrackService;
import com.demo.services.CommentService;
import com.demo.services.GenresService;
import com.demo.services.PlaylistService;
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
	private PlaylistService playlistService;
	
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
		modelMap.addAttribute("artists", accountService.getArtistWithoutId(1));
		modelMap.addAttribute("genres", genresService.findAll());
		modelMap.addAttribute("albums", accountPlaylistService.getAlbumsByArtistId(5));
		return "track/add" ; 
	}
	
	@RequestMapping( value = { "add" }, method = RequestMethod.POST)
	public String add(@ModelAttribute("track") Track track, @RequestParam("thumbnailTrack") MultipartFile thumbnailTrack, @RequestParam("audioTrack") MultipartFile audioTrack, @RequestParam(value = "artists", required = false) String[] artists, @RequestParam(value = "albums", required = false) String[] albums, @RequestParam("trackDate")String trackDate, @RequestParam("duration")int duration) {
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
			try {
				newTrack.setPublishDate(simpleDateFormat.parse(trackDate));
			} catch (ParseException e1) {
				System.out.println(e1.getMessage());
			}		
			
			Track tmp = trackService.save(newTrack);
			if(tmp.getId() != 0) {
				// Set owner track
				ArtistTrack artistTrack = new ArtistTrack();
				artistTrack.setId(new ArtistTrackId(artistId, tmp.getId()));
				artistTrack.setAccount(accountService.findById(artistId));
				artistTrack.setTrack(tmp);
				artistTrack.setIsOwn(true);
				ArtistTrack artistTrackTmp = artistTrackService.save(artistTrack);
				
				// Set feat artists
				if(artistTrackTmp != null) {
					if(artists != null) {
						for(String featArtistIdString : artists) {
							int featArtistId = Integer.parseInt(featArtistIdString);
							addFeatArtistToTrack(newTrack, featArtistId);		
						}						
					}
				}
				
				// Set track for album
				if(albums != null) {
					for(String albumIdString : albums) {
						int albumId = Integer.parseInt(albumIdString);
						addTrackToAlbum(newTrack, albumId);
					}						
				}
			}
		}
		
		return "redirect:/track/index" ; 
	}
	
	@RequestMapping( value = { "edit/{id}" }, method = RequestMethod.GET)
	public String edit(ModelMap modelMap, @PathVariable("id")int trackId) {
		Track track = trackService.findById(trackId);
		modelMap.put("artists", accountService.getArtistWithoutId(1));
		modelMap.put("genres", genresService.findAll());
		modelMap.put("albums", accountPlaylistService.getAlbumsByArtistId(5));
		modelMap.put("featArtistIds", artistTrackService.getFeatAccountIdByTrackId(trackId));
		modelMap.put("albumOwnIds", playlistTrackService.getAlbumOwnIdsByTrackId(trackId));
		modelMap.put("track", track);
		modelMap.put("thumbnail", track.getThumbnail());
		return "track/edit" ; 
	}
	
	@RequestMapping( value = { "edit" }, method = RequestMethod.POST)
	public String edit(@ModelAttribute("track") Track track, @RequestParam("thumbnailTrack") MultipartFile thumbnailTrack, @RequestParam(value = "artists", required = false) String[] artists, @RequestParam(value = "albums", required = false) String[] albums, @RequestParam("isHidden") String isHidden) {
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
		
		// Check publish/hidden
//		if(isHidden == true && newTrack.getStatus().getId() == 1) {
//			Status status = new Status();			
//			status.setId(3);
//			newTrack.setStatus(status);
//		}		
//		if(isHidden == false && newTrack.getStatus().getId() == 3) {
//			Status status = new Status();			
//			status.setId(1);
//			newTrack.setStatus(status);
//		}
		newTrack.setGenres(track.getGenres());
		newTrack.setTitle(track.getTitle());
		newTrack.setLyrics(track.getLyrics());
		newTrack.setLikes(track.getLikes());
		newTrack.setDuration(track.getDuration());
		newTrack.setListens(track.getListens());
		newTrack.setBaseListens(track.getBaseListens());
		newTrack.setWeeklyListens(track.getWeeklyListens());
		newTrack.setIsPremium(track.isIsPremium());
		
		// Delete old feat artists from artist track
		deleteFeatArtistFromTrack(newTrack, artistId);
		
		// Add new feat artists
		if(artists != null) {
			for(String featArtistIdString : artists) {
				int featArtistId = Integer.parseInt(featArtistIdString);
				addFeatArtistToTrack(newTrack, featArtistId);
			}						
		}
				
		// Delete old track from album
		deleteTrackFromAlbum(newTrack);
		
		// Add track to album
		if(albums != null) {
			for(String albumIdString : albums) {
				int albumId = Integer.parseInt(albumIdString);
				addTrackToAlbum(newTrack, albumId);
			}						
		}
		
		return "redirect:/track/index" ; 
	}	
	
	@RequestMapping( value = { "delete" }, method = RequestMethod.GET)
	public String delete(@RequestParam("id") int trackId) {
		Track track = trackService.findById(trackId);
		
		deleteArtistFromTrack(track);
		
		deleteTrackFromAlbum(track);
		
		deleteAllCommentInTrack(track);		
		
		trackService.delete(trackId);
		return "track/manage" ; 
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
	
	public void addTrackToAlbum(Track track, int albumId) {
		PlaylistTrack albumTrack = new PlaylistTrack();
		albumTrack.setId(new PlaylistTrackId(albumId, track.getId()));
		albumTrack.setPlaylist(playlistService.find(albumId));
		albumTrack.setTrack(track);
		playlistTrackService.save(albumTrack);
	}
	
	public void addFeatArtistToTrack(Track track, int featArtistId) {
		ArtistTrack featArtistTrack = new ArtistTrack();
		featArtistTrack.setId(new ArtistTrackId(featArtistId, track.getId()));
		featArtistTrack.setAccount(accountService.findById(featArtistId));
		featArtistTrack.setTrack(track);
		featArtistTrack.setIsOwn(false);
		artistTrackService.save(featArtistTrack);	
	}
	
	public void deleteArtistFromTrack(Track track) {
		for(Account account : track.findAccountThroughAtristTrack()) {
			for(ArtistTrack artistTrack : account.getArtistTracks()) {
				artistTrackService.delete(artistTrack.getId());
			}
		}
	}
	public void deleteFeatArtistFromTrack(Track track, int artistId) {
		for(Account account : track.findAccountThroughAtristTrack()) {
			if(account.getId() != artistId) {
				for(ArtistTrack artistTrack : account.getArtistTracks()) {
					artistTrackService.delete(artistTrack.getId());
				}
			}
		}
	}
	
	public void deleteTrackFromAlbum(Track track) {
		for(Playlist playlist : track.findPlaylistThroughPlaylistTrack()) {
			for(PlaylistTrack playlistTrack : playlist.getPlaylistTracks()) {
				playlistTrackService.delete(playlistTrack.getId());
			}
		}
	}
	
	public void deleteAllCommentInTrack(Track track) {
		for(Comment comment : track.getComments()) {
			commentService.delete(comment.getId());
		}
	}

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}
}
