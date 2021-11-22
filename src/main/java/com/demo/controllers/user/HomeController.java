package com.demo.controllers.user;

import java.util.List;

import org.apache.catalina.authenticator.SpnegoAuthenticator.AuthenticateAction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.entities.Account;
import com.demo.entities.SignIn;
import com.demo.security.oauth2.CustomOAuth2User;
import com.demo.services.AccountService;
import com.demo.services.SignInService;

import net.bytebuddy.implementation.bind.MethodDelegationBinder.ParameterBinding.Anonymous;

@Controller
@RequestMapping(value = {"","user/home"} )
public class HomeController {

	@Autowired
	private AccountService accountService ; 
	
	private String isLocal ;
	
	@Autowired 
	private SignInService signInService ; 
	
	@RequestMapping( value = {"","index" } , method = RequestMethod.GET )
	public String index(ModelMap modelMap, @RequestParam(value = "local", required = false) String local) {

//		Authentication authentication = SecurityContextHolder.getContext().getAuthentication() ;
//		if( authentication == null || authentication instanceof AnonymousAuthenticationToken) {
//			
//		}
//		else {
//			CustomOAuth2User oAuth2User = (CustomOAuth2User) authentication.getPrincipal(); 
//			String email = oAuth2User.getEmail() ;
//			System.out.println("Username : " + email) ;
//			Account account = accountService.findByEmail(email) ;
//			if( account != null ) {				
//				
//				modelMap.put("acc", account) ; 
//				System.out.println("Name Home : " + account.getNickname());
//			}
//		}
		return "user/home/index" ; 
	}
	
}
