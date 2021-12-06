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

import com.demo.entities.Notification;
import com.demo.services.CookieService;
import com.demo.services.NotificationService;
import com.demo.services.PlaylistService;

public class NotificationTag extends RequestContextAwareTag {

	@Autowired
	private NotificationService notificationService;

	@Autowired
	private CookieService cookieService;

	@Override
	protected int doStartTagInternal() throws Exception {
		if (notificationService == null) {
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
			String jspPage = "../mytags/notification/notificationTag.jsp";
			HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();

			String accountId = cookieService.getValue("acc_id", "");
			if (accountId.equalsIgnoreCase("")) {
				int size = 0;
			} else {
				int size = notificationService.getAllNewByStatus(Integer.parseInt(accountId)).size();
				int n = 0;
				if (size < 5) {
					n = 5 - size;
				}
				request.setAttribute("newNotifications",
						notificationService.getAllNewByStatus(Integer.parseInt(accountId)));
				request.setAttribute("readNotifications", notificationService.getAllReadByStatus(Integer.parseInt(accountId), n));
			}

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