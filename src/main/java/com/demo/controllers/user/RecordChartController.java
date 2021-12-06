package com.demo.controllers.user;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.demo.entities.Account;
import com.demo.entities.Track;
import com.demo.helpers.CalculateDateTimeHelper;
import com.demo.models.TrackChartModel;
import com.demo.models.TrackInfo;
import com.demo.services.TrackService;

import javassist.expr.NewArray;

@Controller
@RequestMapping(value = { "record-chart" })
public class RecordChartController {

	@Autowired
	private TrackService trackService;

	@RequestMapping(value = { "", "index" })
	public String index(ModelMap modelMap) {
		int showTopCount = 50;
		List<TrackChartModel> trackList = new ArrayList<TrackChartModel>();
		for (Track track : trackService.getTopAll(showTopCount)) {
			TrackChartModel trackChartModel = new TrackChartModel();
			trackChartModel.setTrackId(track.getId());
			trackChartModel.setThumbnail(track.getThumbnail());
			trackChartModel.setTitle(track.getTitle());
			trackChartModel.setDuration(track.getDuration());
			trackChartModel.setLikes(track.getLikes());
			trackChartModel.setPremium(track.isIsPremium());
			List<String> nicknames = new ArrayList<String>();
			for (Account account : track.findAccountThroughAtristTrack()) {
				if (account.getNickname() != null) {
					nicknames.add(account.getNickname());
				}
			}
			trackChartModel.setArtistNicknames(nicknames);
			trackList.add(trackChartModel);
		}
		modelMap.put("topCount", 50);
		modelMap.put("topTracks", trackList);
		return "recordChart/index";
	}

	@RequestMapping(value = { "all-track-weekly" })
	public String allTrack(ModelMap modelMap) {
		List<TrackInfo> weeklyTracks = trackService.getTopAllWeekly(1, 20);
		CalculateDateTimeHelper calculateDateTimeHelper = new CalculateDateTimeHelper();
		modelMap.put("weeklyDate", calculateDateTimeHelper.weeklyChartDate());
		modelMap.put("weeklyTracks", weeklyTracks);
		return "recordChart/allTrack";
	}

	@RequestMapping(value = { "us-uk-track-weekly" })
	public String usukTrack(ModelMap modelMap) {
		List<TrackInfo> weeklyTracks = trackService.getTopUsUkWeekly(1, 20);
		CalculateDateTimeHelper calculateDateTimeHelper = new CalculateDateTimeHelper();
		modelMap.put("weeklyDate", calculateDateTimeHelper.weeklyChartDate());
		System.out.println(calculateDateTimeHelper.weeklyChartDate());
		modelMap.put("weeklyTracks", weeklyTracks);
		return "recordChart/usukTrack";
	}

	@RequestMapping(value = { "vietnam-track-weekly" })
	public String vietnamTrack(ModelMap modelMap) {
		List<TrackInfo> weeklyTracks = trackService.getTopVnWeekly(1, 20);
		CalculateDateTimeHelper calculateDateTimeHelper = new CalculateDateTimeHelper();
		modelMap.put("weeklyDate", calculateDateTimeHelper.weeklyChartDate());
		modelMap.put("weeklyTracks", weeklyTracks);
		return "recordChart/vietnamTrack";
	}
}