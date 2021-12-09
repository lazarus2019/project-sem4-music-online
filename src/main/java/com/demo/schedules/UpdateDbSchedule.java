package com.demo.schedules;

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

	// second, minute, hour, day of month, month and day of week.
	//@Scheduled(cron = "0 0 0 * * ?", zone = "Asia/Ho_Chi_Minh")
	@Scheduled(cron = "@midnight")
	public void mondaySchedule() {
		Calendar c = Calendar.getInstance();
		c.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
		Date monday = c.getTime();
		Date today = new Date();
		System.out.println("monday: " + monday);
		System.out.println("today: " + today);
		System.out.println("hello new day");
		int result = today.compareTo(monday);
		System.out.println(result);

		if (result == 0) {
			if (trackService.updateWeeklyListens()) {
				trackService.updateBaseListens();
			} else {
				System.out.println("Update Failed");
				mondaySchedule();
			}
			System.out.println("Updated db: " + new Date());
		}

	}
	// second, minute, hour, day of month, month and day of week.
	@Scheduled(cron = "9 0 0 * * *", zone = "Asia/Ho_Chi_Minh")
	public void publicTrackAndAlbumSchedule() {
		Calendar c = Calendar.getInstance();
		c.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
		Date monday = c.getTime();
		Date today = new Date();
		int result = today.compareTo(monday);
		
		if (result == 0) {
			if (trackService.updateWeeklyListens()) {
				trackService.updateBaseListens();
			} else {
				System.out.println("Update Failed");
				mondaySchedule();
			}
			System.out.println("Updated publish track & album: " + new Date());
		}
	}

}

