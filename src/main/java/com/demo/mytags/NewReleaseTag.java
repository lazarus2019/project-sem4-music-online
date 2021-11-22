package com.demo.mytags;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.tags.RequestContextAwareTag;

import com.demo.repositories.PackageRepository;
import com.demo.services.PackageService;
import com.demo.services.TrackService;

public class NewReleaseTag extends RequestContextAwareTag {
	
	@Autowired
	private TrackService trackService;

	@Override
	protected int doStartTagInternal() throws Exception {
		if(trackService == null) {
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
			String jspPage = "../mytags/track/newReleaseTag.jsp";
			HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
			request.setAttribute("newReleases", trackService.getAllNewRelease());
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