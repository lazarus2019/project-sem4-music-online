package com.demo.mytags;

import java.io.IOException;
import java.util.Date;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import com.demo.helpers.CalculateDateTimeHelper;

public class TrackTimeTag extends SimpleTagSupport {

	private int totalSeconds;

	public int getTotalSeconds() {
		return totalSeconds;
	}

	public void setTotalSeconds(int totalSeconds) {
		this.totalSeconds = totalSeconds;
	}

	@Override
	public void doTag() throws JspException, IOException {
		JspWriter writer = getJspContext().getOut();
		CalculateDateTimeHelper calculateTimeAgo = new CalculateDateTimeHelper();
		writer.print(calculateTimeAgo.FormatSecondToMinute(totalSeconds));
	}

}