package com.demo.helpers;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;
import java.util.Date;


public class CalculateDateTimeHelper {
	
	public String weeklyChartDate() {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
		Calendar c = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();
		c.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
		c2.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
		c2.add(Calendar.DATE, -7);
		String weeklyDate = (c2.get(Calendar.DATE)) + "/" + (c2.get(Calendar.MONTH) + 1) + "/" + c2.get(Calendar.YEAR) + " - " 
				+ (c.get(Calendar.DATE) - 1) + "/" + (c.get(Calendar.MONTH) + 1) + "/" + c.get(Calendar.YEAR); 
		return weeklyDate;
	}
	
	public String FormatSecondToMinute(int totalSecs) {
		long hours = totalSecs / 3600;
		long minutes = (totalSecs % 3600) / 60;
		long seconds = totalSecs % 60;
		
		if(hours == 0) {
			return String.format("%2d:%02d", minutes, seconds);
		}
		return String.format("%2d:%02d:%02d", hours, minutes, seconds);
	}
	
	public long differentOfDay(LocalDate currentDate, LocalDate pastDate) {
		return ChronoUnit.DAYS.between(pastDate, currentDate);
	}

	public String timeAgo(Date currentDate, Date pastDate) {

		  long milliSecPerMinute = 60 * 1000; //Milliseconds Per Minute
		  long milliSecPerHour = milliSecPerMinute * 60; //Milliseconds Per Hour
		  long milliSecPerDay = milliSecPerHour * 24; //Milliseconds Per Day
		  long milliSecPerMonth = milliSecPerDay * 30; //Milliseconds Per Month
		  long milliSecPerYear = milliSecPerDay * 365; //Milliseconds Per Year
		  //Difference in Milliseconds between two dates
		  long msExpired = currentDate.getTime() - pastDate.getTime();

		  //Second or Seconds ago calculation
		  if (msExpired < milliSecPerMinute) {
		    if (Math.round(msExpired / 1000) == 1) {
		      return String.valueOf(Math.round(msExpired / 1000)) + " second ago";
		    } else {
		      return String.valueOf(Math.round(msExpired / 1000) + " seconds ago");
		    }
		  }

		  //Minute or Minutes ago calculation
		  else if (msExpired < milliSecPerHour) {
		    if (Math.round(msExpired / milliSecPerMinute) == 1) {
		      return String.valueOf(Math.round(msExpired / milliSecPerMinute)) + " minute ago";
		    } else {
		      return String.valueOf(Math.round(msExpired / milliSecPerMinute)) + " minutes ago";
		    }
		  }

		  //Hour or Hours ago calculation
		  else if (msExpired < milliSecPerDay) {
		    if (Math.round(msExpired / milliSecPerHour) == 1) {
		      return String.valueOf(Math.round(msExpired / milliSecPerHour)) + " hour ago";
		    } else {
		      return String.valueOf(Math.round(msExpired / milliSecPerHour)) + " hours ago";
		    }
		  }

		  //Day or Days ago calculation
		  else if (msExpired < milliSecPerMonth) {
		    if (Math.round(msExpired / milliSecPerDay) == 1) {
		      return String.valueOf(Math.round(msExpired / milliSecPerDay)) + " day ago";
		    } else {
		      return String.valueOf(Math.round(msExpired / milliSecPerDay)) + " days ago";
		    }
		  }
		  //Month or Months ago calculation 
		  else if (msExpired < milliSecPerYear) {
		    if (Math.round(msExpired / milliSecPerMonth) == 1) {
		      return String.valueOf(Math.round(msExpired / milliSecPerMonth)) + "  month ago";
		    } else {
		      return String.valueOf(Math.round(msExpired / milliSecPerMonth)) + "  months ago";
		    }
		  }
		  //Year or Years ago calculation 
		  else {
		    if (Math.round(msExpired / milliSecPerYear) == 1) {
		      return String.valueOf(Math.round(msExpired / milliSecPerYear)) + " year ago";
		    } else {
		      return String.valueOf(Math.round(msExpired / milliSecPerYear)) + " years ago";
		    }
		  }

		}
	
}
