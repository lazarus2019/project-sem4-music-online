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
import com.demo.services.CookieService;
import com.demo.services.PackageService;

public class ProfileTag extends RequestContextAwareTag {

	@Autowired
	private AccountService accountService ; 
	
	@Autowired
	private CookieService cookieService;
	
	@Autowired
	private PackageService packageService ; 

	
	@Override
	protected int doStartTagInternal() throws Exception {
		if(accountService == null) {
			WebApplicationContext applicationContext = getRequestContext().getWebApplicationContext();
			AutowireCapableBeanFactory autowireCapableBeanFactory = applicationContext.getAutowireCapableBeanFactory();
			autowireCapableBeanFactory.autowireBean(this);
		}
		return SKIP_BODY;
	}
	
	@Override
	public void doFinally(){
		
		JspWriter writer = pageContext.getOut();
		Account account = new Account() ; 
		String id = cookieService.getValue("acc_id", "") ; 
		try {
			String jspPage = "../mytags/profile/profile.jsp";
			HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();				
			if( !id.equalsIgnoreCase("") ) {
				account = accountService.findById(Integer.parseInt(id)) ;	
				request.setAttribute("accountSignined", account);				
			}
			
			if( checkRoleAdmin(account.getRoles())) {
				request.setAttribute("role", "ADMIN");
			}
			else {
				request.setAttribute("role", "MANAGER");
			}
				
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
	
	public boolean checkRoleAdmin(Set<Role> roles) {
		for (Role role : roles) {
			if( role.getId() == 3) {
				return false ; 
			}			
		}
		return true ;
	}

}
