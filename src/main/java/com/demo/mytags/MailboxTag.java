package com.demo.mytags;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.tags.RequestContextAwareTag;

import com.demo.services.ContactService;

public class MailboxTag extends RequestContextAwareTag {

	@Autowired
	private ContactService contactService;

	@Override
	protected int doStartTagInternal() throws Exception {
		if (contactService == null) {
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
			String jspPage = "../mytags/mailbox/mailboxTag.jsp";
			HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
			System.out.println("amount:" + contactService.getAmountUnreadMailbox());
			request.setAttribute("amountUnReadMail", contactService.getAmountUnreadMailbox());
			request.setAttribute("topUnreadMailbox", contactService.getTopUnreadContact());

			
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