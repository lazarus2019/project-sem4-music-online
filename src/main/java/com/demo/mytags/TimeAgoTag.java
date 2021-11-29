package com.demo.mytags;

import java.io.IOException;
import java.util.Date;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import com.demo.helpers.CalculateDateTimeHelper;

public class TimeAgoTag extends SimpleTagSupport {

	private Date currentDate;
	private Date pastDate;

	public Date getCurrentDate() {
		return currentDate;
	}

	public void setCurrentDate(Date currentDate) {
		this.currentDate = currentDate;
	}

	public Date getPastDate() {
		return pastDate;
	}

	public void setPastDate(Date pastDate) {
		this.pastDate = pastDate;
	}

	@Override
	public void doTag() throws JspException, IOException {
		JspWriter writer = getJspContext().getOut();
		CalculateDateTimeHelper calculateTimeAgo = new CalculateDateTimeHelper();
		writer.print(calculateTimeAgo.timeAgo(new Date(), this.pastDate));
	}

}