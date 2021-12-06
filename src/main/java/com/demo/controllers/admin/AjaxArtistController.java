package com.demo.controllers.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.demo.entities.Account;
import com.demo.services.AccountService;
import com.demo.services.ArtistService;

@RestController
@RequestMapping("ajaxArtist")
public class AjaxArtistController {

	@Autowired
	private AccountService accountService;

	@Autowired
	private ArtistService artistService;

	@RequestMapping(value = {
			"acceptArtist" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Boolean> editStatus(@RequestParam(value = "id", required = false) int id) {
		try {
			Account account = accountService.findById(id);

			account.setIsArtist(true);
			account.setIsRequest(false); 			
			return new ResponseEntity<Boolean>(accountService.acceptOrRejectArtist(account), HttpStatus.OK);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ResponseEntity<Boolean>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = {
	"rejectArtist" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Boolean> rejectArtist(@RequestParam(value = "id", required = false) int id) {
		try {
			Account account = accountService.findById(id);

			account.setIsArtist(false);
			account.setIsRequest(false); 			
			return new ResponseEntity<Boolean>(accountService.acceptOrRejectArtist(account), HttpStatus.OK);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ResponseEntity<Boolean>(HttpStatus.BAD_REQUEST);
		}
	}
}