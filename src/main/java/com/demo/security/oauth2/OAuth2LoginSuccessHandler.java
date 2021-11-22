package com.demo.security.oauth2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.demo.entities.Account;
import com.demo.entities.AuthenticationProvider;
import com.demo.entities.SignIn;
import com.demo.services.AccountService;
import com.demo.services.SignInService;


@Component
public class OAuth2LoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

	@Autowired
	private SignInService signInService ;
	
	@Autowired
	private AccountService accountService ;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		CustomOAuth2User oAuth2User = (CustomOAuth2User) authentication.getPrincipal(); 
		String email = oAuth2User.getEmail() ;
		String name = oAuth2User.getFullName() ;
		System.out.println("Email : " + email);
		System.out.println("Name : " +name);
		
		Account account = accountService.findByEmail(email) ; 
		if( account == null ) {
			accountService.registerNewSignInAfterFacebookLoginSuccess(email, name , AuthenticationProvider.FACEBOOK) ;
		}
		else {
			accountService.updateNewSignInAfterFacebookLoginSuccess(account, name, AuthenticationProvider.FACEBOOK);
		}
		
		super.onAuthenticationSuccess(request, response, authentication);
	}

	
}
