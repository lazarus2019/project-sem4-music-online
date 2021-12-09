package com.demo.controllers.admin;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import com.demo.entities.Account;
import com.demo.entities.Genres;
import com.demo.entities.Playlist;
import com.demo.entities.PlaylistCategory;
import com.demo.entities.Role;
import com.demo.entities.Status;
import com.demo.entities.Track;
import com.demo.helpers.FileUploadHelper;
import com.demo.models.PlaylistModel;
import com.demo.models.TrackInfo;
import com.demo.repositories.CountryRepository;
import com.demo.services.AccountService;
import com.demo.services.ArtistService;
import com.demo.services.CookieService;
import com.demo.services.GenresService;

@Controller
@RequestMapping(value = { "admin/genres" })
public class GenresAdminController implements ServletContextAware  {

	private ServletContext servletContext;

	@Autowired
	private CookieService cookieService;

	@Autowired
	private AccountService accountService;
	
	@Autowired
	private CountryRepository countryRepository;
	
	@Autowired
	private GenresService genresService ; 

	@RequestMapping(value = { "", "index" })
	public String index(ModelMap modelMap) {
		
		modelMap.put("genres", genresService.findAll());
		
		return "admin/genres/index";
	}


	@RequestMapping(value = { "addNewAdmin" })
	public String addNewAdmin(ModelMap modelMap) {
		List<String> gender = new ArrayList<String>();
		gender.add("Male");
		gender.add("Female");
		modelMap.put("gender", gender);
		modelMap.put("countries", countryRepository.findAll());
		modelMap.put("accountNew", new Account()) ;
		return "admin/manageAdmin/addNewAdmin";
	}
	
	@RequestMapping(value = { "addNewAdmin" } , method = RequestMethod.POST)
	public String addNewAdmin(@ModelAttribute("accountNew") Account account , @RequestParam("imageArtist") MultipartFile photo   ) {
 
		String imageName = FileUploadHelper.uploadImage(photo, servletContext, "artist");
		accountService.addNewAdmin(account, imageName);
		
		return "redirect:/admin/manageAdmin/index";
	}

	
	@RequestMapping(value = "edit", method = RequestMethod.GET)
	public String edit(ModelMap modelMap, @RequestParam(value = "id", required = false) int id) {
		Genres genres = genresService.find(id) ; 
		String thumbnail = genres.getThumbnail() ; 
		modelMap.put("genres", genres);
		modelMap.put("thumbnail", thumbnail);
		return "admin/genres/edit";
	}

	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public String edit(@ModelAttribute("genres") Genres genres, @RequestParam("photo") MultipartFile photo) {
		Genres genresOld = genresService.find(genres.getId()) ; 
		if (!photo.isEmpty() && photo.getSize() > 0) {
			//FileUploadHelper.deleteImage(genres.getThumbnail(), servletContext, "playlist");
			String thumbnail = FileUploadHelper.uploadImage(photo, servletContext, "genres");
			genresOld.setThumbnail(thumbnail);
		}
		
		genresOld.setName(genres.getName());
		genresService.save(genresOld) ; 
		return "redirect:/admin/genres/index";
	}
	
	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(ModelMap modelMap) {
		Genres	genres = new Genres()  ;	
		modelMap.put("genres", genres);
		return "admin/genres/add";
	}

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(@ModelAttribute("genres") Genres genres, @RequestParam("photo") MultipartFile photo) {
		if (!photo.isEmpty() && photo.getSize() > 0) {
			String thumbnail = FileUploadHelper.uploadImage(photo, servletContext, "genres");
			genres.setThumbnail(thumbnail);
		}
		else {
			genres.setThumbnail("01.jpg");
		}
		genresService.save(genres) ; 
		return "redirect:/admin/genres/index";
	}
	
	/*
	 * @RequestMapping(value = "delete-genres", method = RequestMethod.GET) public
	 * ResponseEntity<List<Genres>> deleteTrack(@RequestParam(value = "id", required
	 * = false) int id) { try {
	 * 
	 * int playlistId = (Integer) session.getAttribute("playlistId");
	 * 
	 * Playlist playlist = playlistService.find(playlistId);
	 * playlist.getTracks().remove(trackService.findById(id));
	 * playlistService.save(playlist); List<TrackInfo> tracks = new
	 * ArrayList<TrackInfo>(); for (Track track : playlist.getTracks()) { TrackInfo
	 * trackInfo = new TrackInfo(); trackInfo.setId(track.getId());
	 * trackInfo.setTitle(track.getTitle());
	 * trackInfo.setStatusId(track.getStatus().getId()); tracks.add(trackInfo); }
	 * 
	 * return new ResponseEntity<List<Genres>>(tracks, HttpStatus.OK); } catch
	 * (Exception e) { return new
	 * ResponseEntity<List<Genres>>(HttpStatus.BAD_REQUEST); } }
	 */
	
	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}
	
	public boolean checkRole(Set<Role> roles) {
		for (Role role : roles) {
			if( role.getId() == 2) {
				return true ; 
			}			
		}
		return false ;
	}

}
