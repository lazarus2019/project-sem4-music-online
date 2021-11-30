package com.demo.controllers.admin;

import java.io.Console;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import com.demo.entities.Account;
import com.demo.entities.AccountPlaylist;
import com.demo.entities.Playlist;
import com.demo.entities.Status;
import com.demo.entities.Track;
import com.demo.helpers.FileUploadHelper;
import com.demo.models.PlaylistModel;
import com.demo.models.TrackInfo;
import com.demo.models.TrackInfor;
import com.demo.services.AccountService;
import com.demo.services.GenresService;
import com.demo.services.TrackService;

@Controller
@RequestMapping(value = { "admin/manage-track" })
public class ManageTrackController implements ServletContextAware {

	private ServletContext servletContext;

	@Autowired
	private TrackService trackService;

	@Autowired
	private GenresService genresService;

	@Autowired
	private AccountService accountService;

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		List<TrackInfo> trackInfos = new ArrayList<TrackInfo>();
		for (Track track : trackService.findAll()) {
			TrackInfo trackInfo = new TrackInfo();
			trackInfo.setId(track.getId());
			trackInfo.setGenres(track.getGenres());
			trackInfo.setFileName(track.getThumbnail());
			trackInfo.setTitle(track.getTitle());
			trackInfo.setLyrics(track.getLyrics());
			trackInfo.setThumbnail(track.getThumbnail());
			trackInfo.setLikes(track.getLikes());
			trackInfo.setDuration(track.getDuration());
			trackInfo.setListens(track.getListens());
			trackInfo.setPublishDate(track.getPublishDate());
			trackInfo.setLikes(track.getLikes());
			trackInfo.setStatusId(track.getStatus().getId());
			trackInfo.setPremium(track.isIsPremium());
			List<Account> accounts = new ArrayList<Account>();
			for (Account account : track.findAccountThroughAtristTrack()) {
				accounts.add(account);
			}
			trackInfo.setAccount(accounts);
			trackInfos.add(trackInfo);
		}
		modelMap.put("tracks", trackInfos);
		return "admin/track/index";
	}

	@RequestMapping(value = { "edit" }, method = RequestMethod.GET)
	public String edit(ModelMap modelMap, @RequestParam(value = "id", required = false) int id) {
		Track track = trackService.find(id);
		modelMap.put("thumbnail", track.getThumbnail());
		modelMap.put("genres", genresService.findAll());
		modelMap.put("track", track);
		return "admin/track/edit";
	}

	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public String edit(@ModelAttribute("track") Track track, @RequestParam("photo") MultipartFile photo) {
		Track newTrack = trackService.find(track.getId());
		if (!photo.isEmpty() && photo.getSize() > 0) {
			FileUploadHelper fileHelper = new FileUploadHelper();
			String fileName = fileHelper.uploadImage(photo, servletContext, "track");
			newTrack.setThumbnail(fileName);
		}
		newTrack.setTitle(track.getTitle());
		newTrack.setGenres(track.getGenres());
		newTrack.setIsPremium(track.isIsPremium());
		newTrack.setLyrics(track.getLyrics());
		trackService.save(newTrack);
		return "redirect:/admin/manage-track/index";
	}

	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(@RequestParam(value = "id", required = false) int id) {
		Track track = trackService.find(id);
		track.setIsDelete(true);
		trackService.save(track);
		return "redirect:/admin/manage-track/index";
	}

	@RequestMapping(value = {
			"edit-status" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Integer> editStatus(@RequestParam(value = "id", required = false) int id) {
		try {
			Track track = trackService.find(id);
			Status status = new Status();
			if (track.getStatus().getId() == 1) {
				status.setId(3);
				track.setStatus(status);
			} else if (track.getStatus().getId() == 3) {
				status.setId(1);
				track.setStatus(status);
			}
			trackService.save(track);
			return new ResponseEntity<Integer>(status.getId(), HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Integer>(HttpStatus.BAD_REQUEST);
		}
	}

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}
}
