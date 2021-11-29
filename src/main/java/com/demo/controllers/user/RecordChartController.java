package com.demo.controllers.user;

import java.util.Iterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.demo.entities.Track;
import com.demo.services.SettingService;
import com.demo.services.TrackService;

@Controller
@RequestMapping(value = { "record-chart"} )
public class RecordChartController {
	
	@Autowired
	private TrackService trackService;
	
	@Autowired
	private SettingService settingService;

	@RequestMapping( value = { "","index" })
	public String index(ModelMap modelMap) {
		int showTopCount = settingService.find(1).getShowTopChart();
		modelMap.put("topCount", showTopCount);
		modelMap.put("top100Tracks", trackService.getTopAll(showTopCount));
		return "recordChart/index" ; 
	} 
	
}
