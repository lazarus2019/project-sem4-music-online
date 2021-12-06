package com.demo.schedules;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.demo.services.TrackService;

@Component
public class UpdateDbSchedule {
	
	@Autowired
	private TrackService trackService;

	//  second, minute, hour, day of month, month and day of week. 
	@Scheduled(cron = "0 * * * * MON")
	public void mondaySchedule() {
		if(trackService.updateWeeklyListens()) {
			trackService.updateBaseListens();
		} else {
			System.out.println("Update Failed");
			mondaySchedule();
		}
		System.out.println("Updated db: " + new Date());
	}
	
}
