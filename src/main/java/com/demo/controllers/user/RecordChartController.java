package com.demo.controllers.user;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.demo.entities.Account;
import com.demo.entities.Track;
import com.demo.models.TrackChartModel;
import com.demo.models.TrackInfo;
import com.demo.services.SettingService;
import com.demo.services.TrackService;

@Controller
@RequestMapping(value = { "record-chart" })
public class RecordChartController {

	@Autowired
	private TrackService trackService;

	@Autowired
	private SettingService settingService;

	@RequestMapping(value = { "", "index" })
	public String index(ModelMap modelMap) {
		int showTopCount = settingService.find(1).getShowTopChart();
		List<TrackChartModel> trackList = new ArrayList<TrackChartModel>();
		for (Track track : trackService.getTopAll(showTopCount)) {
			TrackChartModel trackChartModel = new TrackChartModel();
			trackChartModel.setTrackId(track.getId());
			trackChartModel.setTitle(track.getTitle());
			trackChartModel.setDuration(track.getDuration());
			List<String> nicknames = new ArrayList<String>();
			for (Account account : track.findAccountThroughAtristTrack()) {
				if (account.getNickname() != null) {
					nicknames.add(account.getNickname());
				}
			}
			trackChartModel.setArtistNicknames(nicknames);
			trackList.add(trackChartModel);
		}
		modelMap.put("topCount", showTopCount);
		modelMap.put("topTracks", trackList);
		return "recordChart/index";
	}

}
