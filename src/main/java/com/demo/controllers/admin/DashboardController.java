package com.demo.controllers.admin;

import java.text.DateFormatSymbols;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.demo.entities.Account;
import com.demo.entities.Playlist;
import com.demo.entities.Track;
import com.demo.models.TrackInfo;
import com.demo.services.AccountService;
import com.demo.services.PackageInfoService;
import com.demo.services.PackageService;
import com.demo.services.PlaylistService;
import com.demo.services.TrackService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.IntNode;

@Controller
@RequestMapping(value = { "admin", "admin/dashboard" })
public class DashboardController {

	@Autowired
	private AccountService accountService;

	@Autowired
	private TrackService trackService;

	@Autowired
	private PackageService packageService;

	@Autowired
	private PackageInfoService packageInfoService;

	@Autowired
	private PlaylistService playlistService;

	@RequestMapping(value = { "", "index" })
	public String index(ModelMap modelMap) {
		// count for 4 card
		modelMap.put("countArtist", accountService.countArtist());
		modelMap.put("countTrack", trackService.countTrack());
		modelMap.put("countUser", accountService.countUser());
		modelMap.put("countPackage", packageService.countPackage());

		// get best Artist limit 3
		modelMap.put("bestArtists", accountService.getAllPopularArtists(4));

		// get best Album limit 3
		modelMap.put("bestAlbums", playlistService.getBestAlbum());

		// get best track limit 5
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
		
		// take 3 the most sole packs
		modelMap.put("bestPackages", packageInfoService.getPackageChart());

		return "admin/dashboard/index";
	}

	@RequestMapping(value = {
			"load-tracks-data" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<TrackInfo>> loadTracksData() {
		try {
			List<TrackInfo> trackInfos = new ArrayList<TrackInfo>();
			for (Track track : trackService.getTopAll(10)) {
				TrackInfo trackInfo = new TrackInfo();
				trackInfo.setId(track.getId());
				trackInfo.setTitle(track.getTitle());
				trackInfo.setListens(track.getListens());
				trackInfos.add(trackInfo);
			}

			return new ResponseEntity<List<TrackInfo>>(trackInfos, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<TrackInfo>>(HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value = {
			"load-package-price" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<Double>> loadPackagePrice() {
		try {
			List<Double> totalPrices = new ArrayList<Double>();
			if (packageInfoService.getTotalPricePerMonth() != null) {
				totalPrices = packageInfoService.getTotalPricePerMonth();
				int size = packageInfoService.getTotalPricePerMonth().size();
				int less = 12 - size;
				if (less > 0) {
					for (int i = 0; i < less; i++) {
						totalPrices.add(0.0);
					}

				}
			}
			return new ResponseEntity<List<Double>>(totalPrices, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<Double>>(HttpStatus.BAD_REQUEST);
		}
	}

}