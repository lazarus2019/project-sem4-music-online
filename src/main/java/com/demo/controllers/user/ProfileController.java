package com.demo.controllers.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.entities.Account;
import com.demo.security.oauth2.CustomOAuth2User;
import com.demo.services.AccountService;


@Controller
@RequestMapping("user/profile")
public class ProfileController {
	
	@Autowired
	private AccountService accountService ; 

	@RequestMapping( value = {"","index" } , method = RequestMethod.GET )
	public String index(ModelMap modelMap, @RequestParam(value = "local", required = false) String local) {


		Authentication authentication = SecurityContextHolder.getContext().getAuthentication() ;
		if( authentication == null || authentication instanceof AnonymousAuthenticationToken) {
			modelMap.put("msg", "You must sign in first") ; 
			return "redirect:/user/login/login" ; 
		}
		else {
			Account account = new Account() ; 
			if (local != null) {
				String username = authentication.getName() ;
				account = accountService.find(username) ;
			}
			else {
				CustomOAuth2User oAuth2User = (CustomOAuth2User) authentication.getPrincipal(); 
				String email = oAuth2User.getEmail() ;
				account = accountService.findByEmail(email) ;
			}
			
			if( account != null ) {						
				modelMap.put("accountSignined", account) ; 
				System.out.println("Name Profile : " + account.getNickname());
			}
		}
		return "user/profile/index" ; 
	}
}
