package com.demo.mytags;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.tags.RequestContextAwareTag;

import com.demo.models.TrackInfo;
import com.demo.services.PlaylistService;
import com.demo.services.TrackService;

public class WeeklyChartTag extends RequestContextAwareTag {

	@Autowired
	private TrackService trackService;

	@Override
	protected int doStartTagInternal() throws Exception {
		if (trackService == null) {
			WebApplicationContext applicationContext = getRequestContext().getWebApplicationContext();
			AutowireCapableBeanFactory autowireCapableBeanFactory = applicationContext.getAutowireCapableBeanFactory();
			autowireCapableBeanFactory.autowireBean(this);
		}
		return SKIP_BODY;
	}

	@Override
	public void doFinally() {
		JspWriter writer = pageContext.getOut();
		try {
			String jspPage = "../mytags/chart/weeklyChartTag.jsp";
			HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
			
			// get all weekyly chart by status = true and get limit 5
			request.setAttribute("allWeeklyTracks", trackService.getTopAllWeekly(1, 5));
			// get US-UK weekyly chart by status = true and get limit 5
			request.setAttribute("usUkWeeklyTracks", trackService.getTopUsUkWeekly(1, 5));
			// get VietName weekyly chart by status = true and get limit 5
			request.setAttribute("vnWeeklyTracks", trackService.getTopVnWeekly(1, 5));
			
			request.getRequestDispatcher(jspPage);
			pageContext.include(jspPage);
		} catch (Exception e) {
			try {
				writer.print(e.getMessage());
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
	}
}