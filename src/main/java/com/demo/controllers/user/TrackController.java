package com.demo.controllers.user;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
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

import com.demo.entities.Account;
import com.demo.entities.ArtistTrack;
import com.demo.entities.Playlist;
import com.demo.entities.Status;
import com.demo.entities.Track;
import com.demo.helpers.FileUploadHelper;
import com.demo.models.AlbumInfo;
import com.demo.models.TrackInfo;
import com.demo.services.AccountPlaylistService;
import com.demo.services.AccountService;
import com.demo.services.ArtistTrackService;
import com.demo.services.CommentService;
import com.demo.services.CookieService;
import com.demo.services.GenresService;
import com.demo.services.PlaylistService;
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
	private CommentService commentService;
	
	@Autowired
	private PlaylistService playlistService;
	
	@Autowired
	CookieService cookieService ;
	
	@RequestMapping( value = {"id/{id}" } , method = RequestMethod.GET )
	public String index( @PathVariable("id") int id , ModelMap modelMap) {
		
		modelMap.put("na", genresService.getNameById(id));
		modelMap.put("listtrack", trackService.findTrackByGenresId(id));
		return "track/index" ; 
	}
	/*
	 * @RequestMapping( value = {"index" }) public String index() { return
	 * "track/index" ; }
	 */
	@RequestMapping( value = { "" })
	public String index(@RequestParam("keyword")String keyword, ModelMap modelMap) {
			modelMap.put("listtrack", trackService.searchByTitle(keyword));
		return "track/all" ; 
	}
	
	@RequestMapping( value = { "add" })
	public String add(ModelMap modelMap, Authentication authentication) {
		if( authentication == null || authentication instanceof AnonymousAuthenticationToken) {
			modelMap.put("msg", "You must sign in first") ; 
			return "redirect:/login/login" ; 
		}
		else {			
			Account account = new Account() ; 
			String id = cookieService.getValue("acc_id", "") ; 
			if( id.equalsIgnoreCase("")) {
				return "redirect:/login/login" ; 
			}
			else {
				account = accountService.findById(Integer.parseInt(id)) ;					
			}
			if( account != null ) {					
				if(!account.isIsArtist()) {
					modelMap.put("msg", "You not allow to be here!"); 
					return "redirect:/home" ;
				}else {
					modelMap.put("accountSignined", account) ; 
					int artistId = account.getId();
					modelMap.addAttribute("artists", accountService.getArtistWithoutId(artistId));
					modelMap.addAttribute("genres", genresService.findAll());
					modelMap.addAttribute("albums", accountPlaylistService.getAlbumsByArtistId(artistId));
				}			
			}
		} 
		return "track/add" ; 
	}
	
	@RequestMapping( value = { "add" }, method = RequestMethod.POST)
	public String add(@ModelAttribute("track") Track track, @RequestParam("thumbnailTrack") MultipartFile thumbnailTrack, @RequestParam("audioTrack") MultipartFile audioTrack, @RequestParam(value = "artists", required = false) String[] artists, @RequestParam(value = "albums", required = false) String[] albums, @RequestParam(value = "trackDate", required = false)String trackDate, @RequestParam("duration")int duration, ModelMap modelMap, Authentication authentication) {
		if( authentication == null || authentication instanceof AnonymousAuthenticationToken) {
			modelMap.put("msg", "You must sign in first") ; 
			return "redirect:/login/login" ; 
		}
		else {			
			Account account = new Account() ; 
			String id = cookieService.getValue("acc_id", "") ; 
			if( id.equalsIgnoreCase("")) {
				return "redirect:/login/login" ; 
			}
			else {
				account = accountService.findById(Integer.parseInt(id)) ;					
			}
			if( account != null ) {					
				if(!account.isIsArtist()) {
					modelMap.put("msg", "You not allow to this action!"); 
					return "redirect:/home" ;
				}else {
					modelMap.put("accountSignined", account) ; 
					int artistId = account.getId();				
					FileUploadHelper fileHelper = new FileUploadHelper();
					SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
					String directionThumbnail = "images/track/";
					String directionAudio = "audio/track/";
					
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
						if(trackTmp.getId() != null) {
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
									Playlist album = playlistService.find(albumId);
									album.getTracks().add(trackTmp);
									// playlistTrackService.addTrackToAlbum(albumId, trackTmp.getId());
									playlistService.save(album);
								}						
							}
						}
					}
				}			
			}
		} 		
		
		return "redirect:/track/manage" ; 
	}
	
	@RequestMapping( value = { "edit/{id}" }, method = RequestMethod.GET)
	public String edit(ModelMap modelMap, @PathVariable("id")int trackId, Authentication authentication) {
		if( authentication == null || authentication instanceof AnonymousAuthenticationToken) {
			modelMap.put("msg", "You must sign in first") ; 
			return "redirect:/login/login" ; 
		}
		else {			
			Account account = new Account() ; 
			String id = cookieService.getValue("acc_id", "") ; 
			if( id.equalsIgnoreCase("")) {
				return "redirect:/login/login" ; 
			}
			else {
				account = accountService.findById(Integer.parseInt(id)) ;					
			}
			if( account != null ) {					
				if(!account.isIsArtist()) {
					modelMap.put("msg", "You not allow to be here!"); 
					return "redirect:/home" ;
				}else {
					modelMap.put("accountSignined", account) ; 
					int artistId = account.getId();
					if(artistTrackService.checkTrackOwner(artistId, trackId)) {
						Track track = trackService.findById(trackId);
						modelMap.put("artists", accountService.getArtistWithoutId(artistId));
						modelMap.put("genres", genresService.findAll());
						modelMap.put("albums", accountPlaylistService.getAlbumsByArtistId(artistId));
						modelMap.put("featArtistIds", artistTrackService.getFeatAccountIdByTrackId(trackId));
						List<Integer> albumIds = new ArrayList<Integer>();
						for (Playlist album : track.getPlaylists()) {
							if (album.getPlaylistCategory().getId() == 3) {
								albumIds.add(album.getId());
							}
						}

						modelMap.put("albumOwnIds", albumIds);
						modelMap.put("trackId", track.getId());
						modelMap.put("track", track);
						modelMap.put("trackDate", track.getPublishDate());
						modelMap.put("statusId", track.getStatus().getId());
						modelMap.put("thumbnail", track.getThumbnail());						
					}else {
						modelMap.put("msg", "Sorry, but you didn't own this track!"); 
						return "redirect:/track/manage" ;
					}
				}			
			}
		} 

		return "track/edit" ; 
	}
	
	@RequestMapping( value = { "edit" }, method = RequestMethod.POST)
	public String edit(@ModelAttribute("track") Track track, @RequestParam("thumbnailTrack") MultipartFile thumbnailTrack, @RequestParam(value = "artists", required = false) String[] artists, @RequestParam(value = "albums", required = false) String[] albums, @RequestParam(value = "isHidden", required = false) String isHidden, ModelMap modelMap, Authentication authentication) {
		if( authentication == null || authentication instanceof AnonymousAuthenticationToken) {
			modelMap.put("msg", "You must sign in first") ; 
			return "redirect:/login/login" ; 
		}
		else {			
			Account account = new Account() ; 
			String id = cookieService.getValue("acc_id", "") ; 
			if( id.equalsIgnoreCase("")) {
				return "redirect:/login/login" ; 
			}
			else {
				account = accountService.findById(Integer.parseInt(id)) ;					
			}
			if( account != null ) {					
				if(!account.isIsArtist()) {
					modelMap.put("msg", "You not allow to do this action!"); 
					return "redirect:/home" ;
				}else {
					modelMap.put("accountSignined", account) ; 
					int artistId = account.getId();					
						if(artistTrackService.checkTrackOwner(artistId, track.getId())) {
							Track newTrack = trackService.findById(track.getId());
							FileUploadHelper fileHelper = new FileUploadHelper();
							String directionThumbnail = "images/track/";
							
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
							if(isHidden != null) {
								if(newTrack.getStatus().getId() == 1){
									Status status = new Status();			
									status.setId(3);
									newTrack.setStatus(status);		
								}
							}else {
								if(newTrack.getStatus().getId() == 3 && newTrack.getStatus().getId() != 2) {
									Status status = new Status();			
									status.setId(1);
									newTrack.setStatus(status);	
								}
							}
							
							newTrack.setGenres(track.getGenres());
							newTrack.setTitle(track.getTitle());
							newTrack.setLyrics(track.getLyrics());
							newTrack.setIsPremium(track.isIsPremium());
							trackService.save(newTrack);
							
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
							for (Playlist album : newTrack.getPlaylists()) {
								newTrack.getPlaylists().remove(album);
							}
							
							// Add track to album
							if(albums != null) {
								for(String albumIdString : albums) {
									int albumId = Integer.parseInt(albumIdString);
									Playlist album = playlistService.find(albumId);
									album.getTracks().add(newTrack);
									playlistService.save(album);
								 }						
							}						
						}else {
							modelMap.put("msg", "Sorry, but you didn't own this track!"); 
							return "redirect:/track/manage" ;
						}
				}			
			}
		} 
		
		
		return "redirect:/track/manage" ; 
	}	

	@RequestMapping(value = { "delete" }, method = RequestMethod.GET, produces = MimeTypeUtils.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> delete(@RequestParam("id") int trackId, ModelMap modelMap, Authentication authentication) {
		String result = "";
		if( authentication == null || authentication instanceof AnonymousAuthenticationToken) {
			result = "MUST_SIGN_IN";
		}
		else {			
			Account account = new Account() ; 
			String id = cookieService.getValue("acc_id", "") ; 
			if( id.equalsIgnoreCase("")) {
				result = "MUST_SIGN_IN";
			}
			else {
				account = accountService.findById(Integer.parseInt(id)) ;					
			}
			if( account != null ) {					
				if(!account.isIsArtist()) {
					result = "NOT_ALLOW";
				}else {
					modelMap.put("accountSignined", account) ; 
					int artistId = account.getId();
					if(artistTrackService.checkTrackOwner(artistId, trackId)) {
						Track track = trackService.findById(trackId);
						
						artistTrackService.removeAllArtistFromTrack(track);
						
						for (Playlist album : track.getPlaylists()) {
							track.getPlaylists().remove(album);
						}
						
						commentService.removeAllCommentInTrack(track);
						
						trackService.delete(trackId);
						result = "OK";						
					}
				}			
			}
		} 
		try {
			return new ResponseEntity<String>(result, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<String>("ERROR", HttpStatus.BAD_REQUEST);
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
	public String manage(ModelMap modelMap , Authentication authentication) {
		if( authentication == null || authentication instanceof AnonymousAuthenticationToken) {
			modelMap.put("msg", "You must sign in first") ; 
			return "redirect:/login/login" ; 
		}
		else {			
			Account account = new Account() ; 
			String id = cookieService.getValue("acc_id", "") ; 
			if( id.equalsIgnoreCase("")) {
				return "redirect:/login/login" ; 
			}
			else {
				account = accountService.findById(Integer.parseInt(id)) ;					
			}
			if( account != null ) {					
				if(!account.isIsArtist()) {
					modelMap.put("msg", "You not allow to be here!"); 
					return "redirect:/home" ;
				}else {
					modelMap.put("accountSignined", account) ; 
					List<Track> tracks = new ArrayList<Track>() ; 
					for( ArtistTrack artistTrack : account.getArtistTracks()) {
						if( artistTrack.isIsOwn()) {
							tracks.add(artistTrack.getTrack()); 
						}					
					}
					modelMap.put("tracks", tracks);
				}			
			}
		} 
		return "track/manage" ; 
	}
	
	// [Manage] Search
	@RequestMapping(value = { "searchTrackInManage" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<TrackInfo>> searchTrackInManage(@RequestParam("option") String option, @RequestParam("keyword") String keyword) {
		List<TrackInfo> trackInfos = new ArrayList<TrackInfo>();
		Account account = new Account() ; 
		String id = cookieService.getValue("acc_id", "") ;
		String optionValue = "";
		if(option.equalsIgnoreCase("all")) {
			optionValue = "";
		}else {
			optionValue = option;
		}
		if(!id.equalsIgnoreCase("")) {
			account = accountService.findById(Integer.parseInt(id));
			trackInfos = trackService.searchTrackInManage(optionValue, keyword.toLowerCase(), account.getId());
		}
		try {
			return new ResponseEntity<List<TrackInfo>>(trackInfos, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<TrackInfo>>(HttpStatus.BAD_REQUEST);
		}
	}
	
	public TrackController() {
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
