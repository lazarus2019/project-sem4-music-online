package com.demo.mytags;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.tags.RequestContextAwareTag;

import com.demo.entities.Account;
import com.demo.entities.PackageInfo;
import com.demo.entities.Role;
import com.demo.security.database.CustomUserDetails;
import com.demo.security.oauth2.CustomOAuth2User;
import com.demo.services.AccountService;
import com.demo.services.ArtistService;
import com.demo.services.CookieService;
import com.demo.services.PackageService;

public class AmountRequestTag extends RequestContextAwareTag {

	@Autowired
	private ArtistService artistService ; 
	
	@Autowired
	private CookieService cookieService;
	


	
	@Override
	protected int doStartTagInternal() throws Exception {
		if(artistService == null) {
			WebApplicationContext applicationContext = getRequestContext().getWebApplicationContext();
			AutowireCapableBeanFactory autowireCapableBeanFactory = applicationContext.getAutowireCapableBeanFactory();
			autowireCapableBeanFactory.autowireBean(this);
		}
		return SKIP_BODY;
	}
	
	@Override
	public void doFinally(){
		
		JspWriter writer = pageContext.getOut();
		try {
			String jspPage = "../mytags/artist/amountRequest.jsp";
			HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();				
			int amount = artistService.getRequestArtist().size() ; 
			request.setAttribute("amount", amount);
			request.getRequestDispatcher(jspPage);
			pageContext.include(jspPage);
		}catch(Exception e){
			try {
				writer.print(e.getMessage());
			}catch(IOException e1) {
				e1.printStackTrace();
			}
		}
	}
	

}
