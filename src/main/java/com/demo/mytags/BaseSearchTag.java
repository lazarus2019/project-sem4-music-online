package com.demo.mytags;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.tags.RequestContextAwareTag;

import com.demo.entities.Account;
import com.demo.entities.Track;
import com.demo.models.TrackInfo;
import com.demo.services.AccountService;
import com.demo.services.PlaylistService;
import com.demo.services.TrackService;

public class BaseSearchTag extends RequestContextAwareTag {
	
	@Autowired
	private AccountService accountService;
	
	@Autowired
	private TrackService trackService;
	
	@Autowired
	private PlaylistService playlistService;

	@Override
	protected int doStartTagInternal() throws Exception {
		if(accountService == null) {
			WebApplicationContext applicationContext = getRequestContext().getWebApplicationContext();
			AutowireCapableBeanFactory autowireCapableBeanFactory = applicationContext.getAutowireCapableBeanFactory();
			autowireCapableBeanFactory.autowireBean(this);
		}
		if(trackService == null) {
			WebApplicationContext applicationContext = getRequestContext().getWebApplicationContext();
			AutowireCapableBeanFactory autowireCapableBeanFactory = applicationContext.getAutowireCapableBeanFactory();
			autowireCapableBeanFactory.autowireBean(this);
		}
		if(playlistService == null) {
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
			String jspPage = "../mytags/baseSearch/baseSearchTag.jsp";
			HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
			request.setAttribute("popularArtists", accountService.getPopularArtists(PageRequest.of(0, 6)));
			List<TrackInfo> newReleasesTrack = new ArrayList<TrackInfo>();
			for (Track track: trackService.getNewRelease(1, 12)) {
				TrackInfo trackInfo = new TrackInfo();
				trackInfo.setId(track.getId());
				trackInfo.setThumbnail(track.getThumbnail());
				trackInfo.setTitle(track.getTitle());
				trackInfo.setLikes(track.getLikes());
				trackInfo.setListens(track.getListens());
				trackInfo.setArtistLength(track.getArtistTracks().size());
				List<Account> accounts = new ArrayList<Account>();
				for (Account account : track.findAccountThroughAtristTrack()) {
					accounts.add(account);
				}
				trackInfo.setAccounts(accounts);
				newReleasesTrack.add(trackInfo);
			}
			request.setAttribute("newReleaseTracks", newReleasesTrack);
			request.setAttribute("upcomingAlbums", playlistService.getAllUpcommingAlbum());
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