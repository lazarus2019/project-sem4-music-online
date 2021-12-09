package com.demo.mytags;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.tags.RequestContextAwareTag;

import com.demo.entities.Account;
import com.demo.entities.Track;
import com.demo.models.TrackInfo;
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
			//get new release track by status = true and get limit 12
			List<TrackInfo> newReleasesTrack = new ArrayList<TrackInfo>();
			for (Track track: trackService.getNewRelease(1, 12)) {
				TrackInfo trackInfo = new TrackInfo();
				trackInfo.setId(track.getId());
				trackInfo.setThumbnail(track.getThumbnail());
				trackInfo.setTitle(track.getTitle());
				trackInfo.setLikes(track.getLikes());
				trackInfo.setListens(track.getListens());
				List<Account> accounts = new ArrayList<Account>();
				for (Account account : track.findAccountThroughAtristTrack()) {
					accounts.add(account);
				}
				trackInfo.setAccounts(accounts);
				newReleasesTrack.add(trackInfo);
			}
			request.setAttribute("newReleases", newReleasesTrack);
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