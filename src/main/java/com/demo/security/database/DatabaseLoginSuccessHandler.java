package com.demo.security.database;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.demo.services.CookieService;

@Component
public class DatabaseLoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
 
//    @Autowired 
//    private UserService userService;

	@Autowired
	private CookieService cookieService ; 
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws ServletException, IOException {
		// TODO Auto-generated method stub
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal() ; 
		String email = userDetails.getEmail() ;
		String name = userDetails.getNickName() ;
		System.out.println("Email : " + email);
		System.out.println("Name : " +name);
		cookieService.add("login_type", "local", 5);
		
		super.onAuthenticationSuccess(request, response, authentication);
	}
	
     

    
    
    
 
}
