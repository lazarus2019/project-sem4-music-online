package com.demo.controllers.admin;

import java.util.ArrayList;
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
import com.demo.entities.Playlist;
import com.demo.entities.Role;
import com.demo.entities.Status;
import com.demo.helpers.FileUploadHelper;
import com.demo.models.PlaylistModel;
import com.demo.repositories.CountryRepository;
import com.demo.services.AccountService;
import com.demo.services.ArtistService;
import com.demo.services.CookieService;

@Controller
@RequestMapping(value = { "admin/artist" })
public class ArtistController implements ServletContextAware  {

	private ServletContext servletContext;
	
	@Autowired
	private ArtistService artistService;

	@Autowired
	private CookieService cookieService;

	
	@Autowired
	private AccountService accountService;
	
	@Autowired
	private CountryRepository countryRepository;

	@RequestMapping(value = { "", "index" })
	public String index(ModelMap modelMap) {
		String id = cookieService.getValue("acc_id", "") ; 
		
		List<Account> artists = artistService.getArtistByStatus(true);
		List<Account> artists2 = new ArrayList<Account>() ;
		for (Account account : artists) {
			if( checkRole(account.getRoles())) {
				if( account.getId() != Integer.parseInt(id)) {					
					artists2.add(account) ; 
				}
			}
		}
		List<Account> users = artistService.getArtistByStatus(false);
		List<Account> users2 = new ArrayList<Account>() ;
		for (Account account : users) {
			if( checkRole(account.getRoles())) {
				if( account.getId() != Integer.parseInt(id)) {					
					users2.add(account) ; 
				}
			}
		}
		modelMap.put("artists", artists2);
		modelMap.put("users", users2);
		
		return "admin/artist/index";
	}

	@RequestMapping(value = { "artistRequest" })
	public String artistRequest(ModelMap modelMap) {
		List<Account> artists = artistService.getRequestArtist();
		modelMap.put("artists", artists);

		return "admin/artist/artistRequest";
	}

	@RequestMapping(value = { "addNewArtist" })
	public String addNewArtist(ModelMap modelMap) {
		List<String> gender = new ArrayList<String>();
		gender.add("Male");
		gender.add("Female");
		modelMap.put("gender", gender);
		modelMap.put("countries", countryRepository.findAll());
		modelMap.put("accountNew", new Account()) ;
		return "admin/artist/addNewArtist";
	}
	
	@RequestMapping(value = { "addNewArtist" } , method = RequestMethod.POST)
	public String addNewArtist(@ModelAttribute("accountNew") Account account , @RequestParam("imageArtist") MultipartFile photo   ) {
 
		String imageName = FileUploadHelper.uploadImage(photo, servletContext, "artist");
		artistService.addNewArtist(account, imageName);
		
		return "redirect:/admin/artist/index";
	}

	@RequestMapping(value = {
			"edit-status" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Boolean> editStatus(@RequestParam(value = "id", required = false) int id) {
		try {
			Account account = accountService.findById(id);

			account.setIsActive(!account.isIsActive());
			accountService.updateAccountFromSetting(account);
			return new ResponseEntity<Boolean>(account.isIsActive(), HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Boolean>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}
	
	public boolean checkRole(Set<Role> roles) {
		for (Role role : roles) {
			if( role.getId() == 2 || role.getId() == 3) {
				return false ; 
			}			
		}
		return true ;
	}

}
