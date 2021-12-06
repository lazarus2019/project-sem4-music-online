package com.demo.controllers.user;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.jasper.tagplugins.jstl.core.If;
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
import com.demo.entities.Playlist;
import com.demo.entities.PlaylistCategory;
import com.demo.entities.Status;
import com.demo.entities.Track;
import com.demo.helpers.FileUploadHelper;
import com.demo.models.AlbumInfo;
import com.demo.models.TrackInfo;
import com.demo.services.AccountPlaylistService;
import com.demo.services.AccountService;
import com.demo.services.ArtistTrackService;
import com.demo.services.CookieService;
import com.demo.services.PlaylistService;
import com.demo.services.TrackService;

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
	private CookieService cookieService;
	
	@Autowired
	private AccountService accountService;
	
	@Autowired
	private TrackService trackService;

	@RequestMapping( value = {"","index", "manage" })
	public String index(ModelMap modelMap, Authentication authentication) {
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
					modelMap.put("albums", accountPlaylistService.getAlbumsByArtistId(artistId));
				}			
			}
		} 
		return "playlist/manage" ; 
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
					modelMap.put("tracks", artistTrackService.getTracksOfArtist(artistId));
				}			
			}
		} 
		return "playlist/add" ; 
	}
	
	@RequestMapping( value = { "add" }, method = RequestMethod.POST)
	public String add(@ModelAttribute("playlist") Playlist playlist, @RequestParam(value = "albumDate", required = false) String publishDate, @RequestParam("thumbnailAlbum") MultipartFile thumbnailAlbum, @RequestParam(value = "tracks", required = false) String[] tracks, ModelMap modelMap, Authentication authentication) {
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
						if(albumTmp.getId() != null) {
							
							// Set album owner
							accountPlaylistService.setOwnerAlbum(albumTmp, artistId);
							
							// Set tracks for album
							if(tracks != null) {
								for(String trackIdString : tracks) {
									int trackId = Integer.parseInt(trackIdString);
									albumTmp.getTracks().add(trackService.findById(trackId));
									playlistService.save(albumTmp);
								}		
							}							
						}			
					}
				}			
			}
		} 
		
		return "redirect:/playlist/manage" ; 
	}
	
	
	@RequestMapping( value = { "edit/{id}" })
	public String edit(ModelMap modelMap, @PathVariable("id") int albumId, Authentication authentication) {
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
					if(accountPlaylistService.checkAlbumOwner(artistId, albumId)) {
						Playlist album = playlistService.find(albumId);
						modelMap.put("tracks", artistTrackService.getTracksOfArtist(artistId));
						modelMap.put("chooseTracks", album.getTracks());
						modelMap.put("albumId", album.getId());
						modelMap.put("playlist", album);
						modelMap.put("thumbnail", album.getThumbnail());
						modelMap.put("statusId", album.getStatus().getId());
						modelMap.put("albumDate", album.getPublishDate());
						modelMap.put("albumId", album.getId());						
					}else {
						modelMap.put("msg", "Sorry, but you didn't own this album!"); 
						return "redirect:/playlist/manage" ;
					}
				}			
			}
		} 
		return "playlist/edit" ; 
	}
	
	
	@RequestMapping( value = { "edit" }, method = RequestMethod.POST)
	public String edit(@ModelAttribute("playlist") Playlist playlist, @RequestParam("thumbnailAlbum") MultipartFile thumbnailAlbum, @RequestParam(value = "tracks", required = false) String[] tracks, @RequestParam(value = "isHidden", required = false) String isHidden, ModelMap modelMap, Authentication authentication) {
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
					if(accountPlaylistService.checkAlbumOwner(artistId, playlist.getId())) {
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
						playlistService.save(album);
						
						// Delete old tracks from album
						album.setTracks(new HashSet<Track>(0));
						playlistService.save(album);
						
						// Add tracks to album
						if(tracks != null) {
							for(String trackIdString : tracks) {
								int trackId = Integer.parseInt(trackIdString);
								album.getTracks().add(trackService.findById(trackId));
								playlistService.save(album);
							}		
						}		
					}else {
						modelMap.put("msg", "Sorry, but you didn't own this album!"); 
						return "redirect:/playlist/manage" ;
					}
				}			
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
	
	@RequestMapping(value = { "delete" }, method = RequestMethod.GET, produces = MimeTypeUtils.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> delete(@RequestParam("id") int albumId, ModelMap modelMap, Authentication authentication) {
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
					if(accountPlaylistService.checkAlbumOwner(artistId, albumId)) {
						Playlist album = playlistService.find(albumId);
						
						accountPlaylistService.removeAccountHasAlbum(album);
						
						for (Track track : album.getTracks()) {
							album.getTracks().remove(track);
						}
						
						playlistService.delete(albumId);
						
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
	
	// [Manage] Search
	@RequestMapping(value = { "searchAlbumInManage" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<AlbumInfo>> searchTrackInManage(@RequestParam("option") String option, @RequestParam("keyword") String keyword) {
		List<AlbumInfo> albumInfos = new ArrayList<AlbumInfo>();
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
			albumInfos = playlistService.searchAlbumInManage(optionValue, keyword.toLowerCase(), account.getId());
		}
		try {
			return new ResponseEntity<List<AlbumInfo>>(albumInfos, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<AlbumInfo>>(HttpStatus.BAD_REQUEST);
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
