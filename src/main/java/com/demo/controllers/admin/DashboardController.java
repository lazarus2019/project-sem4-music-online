package com.demo.controllers.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.demo.entities.Account;
import com.demo.entities.Track;
import com.demo.models.TrackInfo;
import com.demo.services.AccountService;
import com.demo.services.PackageInfoService;
import com.demo.services.PackageService;
import com.demo.services.TrackService;

@Controller
@RequestMapping(value = {"admin","admin/dashboard" })
public class DashboardController {
	
	@Autowired
	private AccountService accountService;
	
	@Autowired
	private TrackService trackService;
	
	@Autowired
	private PackageService packageService;
	
	@Autowired
	private PackageInfoService packageInfoService;

	@RequestMapping(value = { "", "index" })
	public String index(ModelMap modelMap) {
		//count for 4 card
		modelMap.put("countArtist", accountService.countArtist());
		modelMap.put("countTrack", trackService.countTrack());
		modelMap.put("countUser", accountService.countUser());
		modelMap.put("countPackage", packageService.countPackage());
		
		//get best Artist limit 3
		modelMap.put("bestArtists", accountService.getAllPopularArtists(3));
		
		//get best track limit 5
		List<TrackInfo> trackInfos = new ArrayList<TrackInfo>();
		for (Track track : trackService.getBestTrack(5)) {
			TrackInfo trackInfo = new TrackInfo();
			trackInfo.setId(track.getId());
			trackInfo.setGenres(track.getGenres());
			trackInfo.setTitle(track.getTitle());
			trackInfo.setThumbnail(track.getThumbnail());
			trackInfo.setListens(track.getListens());
			trackInfo.setPublishDate(track.getPublishDate());
			trackInfo.setLikes(track.getLikes());
			trackInfo.setStatusId(track.getStatus().getId());
			trackInfo.setPremium(track.isIsPremium());
			List<Account> accounts = new ArrayList<Account>();
			for (Account account : track.findAccountThroughAtristTrack()) {
				accounts.add(account);
			}
			trackInfo.setAccounts(accounts);
			trackInfos.add(trackInfo);
		}
		modelMap.put("bestTracks", trackInfos);
		
		
		
		return "admin/dashboard/index";
	}

}
