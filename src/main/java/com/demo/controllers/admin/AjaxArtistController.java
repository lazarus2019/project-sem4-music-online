package com.demo.controllers.admin;

import java.util.ArrayList;
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
import com.demo.models.AccountRquestInfo;
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
	public ResponseEntity<List<AccountRquestInfo>> editStatus(@RequestParam(value = "id", required = false) int id) {
		try {
			Account account = accountService.findById(id);
			account.setIsArtist(true);
			account.setIsRequest(false); 	
			accountService.acceptOrRejectArtist(account);
			List<AccountRquestInfo> requestInfos = new ArrayList<AccountRquestInfo>();
			for( Account acc : artistService.getRequestArtist()) {
				AccountRquestInfo accountRquestInfo = new AccountRquestInfo(acc);
				requestInfos.add(accountRquestInfo) ; 
			}
			
			return new ResponseEntity<List<AccountRquestInfo>>(requestInfos, HttpStatus.OK);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ResponseEntity<List<AccountRquestInfo>>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = {
	"rejectArtist" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<AccountRquestInfo>> rejectArtist(@RequestParam(value = "id", required = false) int id) {
		try {
			Account account = accountService.findById(id);

			account.setIsArtist(false);
			account.setIsRequest(false); 
			accountService.acceptOrRejectArtist(account);
			List<AccountRquestInfo> requestInfos = new ArrayList<AccountRquestInfo>();
			for( Account acc : artistService.getRequestArtist()) {
				AccountRquestInfo accountRquestInfo = new AccountRquestInfo(acc);
				requestInfos.add(accountRquestInfo) ; 
			}
			
			return new ResponseEntity<List<AccountRquestInfo>>(requestInfos, HttpStatus.OK);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ResponseEntity<List<AccountRquestInfo>>(HttpStatus.BAD_REQUEST);
		}
	}
}
