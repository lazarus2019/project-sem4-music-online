package com.demo.controllers.user;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.demo.entities.Account;
import com.demo.entities.AccountPlaylist;
import com.demo.entities.ArtistTrack;
import com.demo.entities.Playlist;
import com.demo.entities.Track;
import com.demo.models.ArtistsInfor;
import com.demo.services.AccountService;
import com.demo.services.CookieService;

import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = { "artist" })
public class ArtistsController {

	@Autowired
	private AccountService accountService;


	@Autowired
	CookieService cookieService ;


	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		try {
			List<ArtistsInfor> find = accountService.getallArtists();
			modelMap.put("arti", find);
		} catch (Exception e) {
			modelMap.put("erro", e.getMessage());
		}

		return "artist/index";
	}

	@RequestMapping( value = {"yourtrack" } , method = RequestMethod.GET )
	public String yourtrack(  ModelMap modelMap , Authentication authentication ) {
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
				modelMap.put("accountSignined", account) ; 
				List<Track> tracks = new ArrayList<Track>() ; 
				for( ArtistTrack artistTrack : account.getArtistTracks()) {
					if( artistTrack.isIsOwn()) {
						tracks.add(artistTrack.getTrack()) ; 
						System.out.println(artistTrack.getTrack().getTitle());						
					}					
				}
				
				modelMap.put("tracks", tracks) ; 

				
			}
		} 
		return "artist/yourtrack" ; 
	}
	
	@RequestMapping( value = {"youralbum" } , method = RequestMethod.GET )
	public String youralbum(  ModelMap modelMap , Authentication authentication ) {
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
				modelMap.put("accountSignined", account) ; 
				
				List<Playlist> tracks = new ArrayList<Playlist>() ; 
				for( AccountPlaylist artistTrack : account.getAccountPlaylists()) {
					if( artistTrack.isIsOwn()) {
						tracks.add(artistTrack.getPlaylist()) ; 
						//System.out.println(artistTrack.getPlaylist().getTitle());						
					}					
				}
				
				modelMap.put("albums", tracks) ; 
				
				
			}
		} 
		return "artist/youralbum" ; 
	}
	
	@RequestMapping(value = "albumDetail" , method = RequestMethod.GET) 
	public String albumDetail() {
		return "artist/albumDetail" ; 
	}


	
	//New
	
	@RequestMapping( value = {"search" } , method = RequestMethod.GET )
	public String search(@RequestParam("keyword") String keyword ,ModelMap modelMap) {
		try {
			List<ArtistsInfor> searchArtis = accountService.getSearchArtis(keyword);
			modelMap.put("arti", searchArtis );
		} catch (Exception e) {
			modelMap.put("erro", e.getMessage());
		}
		
		return "artist/index";
	}

}
