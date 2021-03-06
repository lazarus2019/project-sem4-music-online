package com.demo.controllers.admin;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import com.demo.entities.Account;
import com.demo.entities.AccountPlaylist;
import com.demo.entities.ArtistTrack;
import com.demo.entities.Playlist;
import com.demo.entities.PlaylistCategory;
import com.demo.entities.Status;
import com.demo.entities.Track;
import com.demo.helpers.FileUploadHelper;
import com.demo.models.PlaylistModel;
import com.demo.models.TrackInfo;
import com.demo.services.AccountPlaylistService;
import com.demo.services.NotificationService;
import com.demo.services.PlaylistCategoryService;
import com.demo.services.PlaylistService;
import com.demo.services.TrackService;

@Controller
@RequestMapping(value = "admin/playlist")
public class PlaylistController implements ServletContextAware {

	private ServletContext servletContext;

	@Autowired
	private PlaylistService playlistService;

	@Autowired
	private TrackService trackService;

	@Autowired
	private AccountPlaylistService accountPlaylistService;

	@Autowired
	private PlaylistCategoryService playlistCategoryService;

	@Autowired
	private NotificationService notificationService;

	@Autowired
	private HttpSession session;

	@RequestMapping(value = { "", "index" })
	public String index(ModelMap modelMap) {
		List<PlaylistModel> playlistModels = new ArrayList<PlaylistModel>();
		for (Playlist playlist : playlistService.getAllAlbum()) {
			PlaylistModel playlistModel = new PlaylistModel();
			playlistModel.setId(playlist.getId());
			playlistModel.setThumbnail(playlist.getThumbnail());
			playlistModel.setTitle(playlist.getTitle());
			playlistModel.setPublishDate(playlist.getPublishDate());
			playlistModel.setLikes(playlist.getLikes());
			playlistModel.setPlaylistCategory(playlist.getPlaylistCategory().getName());
			playlistModel.setStatus(playlist.getStatus().getId());
			playlistModel.setDescription(playlist.getDescription());
			List<Account> accounts = new ArrayList<Account>();
			for (Account account : playlist.findAccountThroughAccountPlaylist()) {
				AccountPlaylist accountPlaylist = accountPlaylistService.getOwnerPlaylist(playlist.getId());
				if (accountPlaylist.isIsOwn() == true && accountPlaylist.getAccount().getId() == account.getId()) {
					accounts.add(account);
				}
			}
			playlistModel.setAccounts(accounts);
			playlistModels.add(playlistModel);
		}
		for (PlaylistModel playlistModel : playlistModels) {
		}
		modelMap.put("albums", playlistModels);
		modelMap.put("playlists", playlistService.getAllPlaylist());
		return "admin/playlist/index";
	}

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(ModelMap modelMap) {
		Playlist playlist = new Playlist();
		modelMap.put("playlistCategories", playlistCategoryService.getAllPlaylistCategories());
		modelMap.put("playlist", playlist);
		return "admin/playlist/add";
	}

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(@ModelAttribute("playlist") Playlist playlist, @RequestParam("photo") MultipartFile photo) {
		FileUploadHelper fileHelper = new FileUploadHelper();
		PlaylistCategory playlistCategory = new PlaylistCategory();
		Status status = new Status();
		String thumbnail = fileHelper.uploadImage(photo, servletContext, "playlist");
		playlist.setThumbnail(thumbnail);
		playlist.setPublishDate(new Date());
		playlist.setLastUpdated(new Date());
		playlist.setLikes(0);
		playlistCategory.setId(playlist.getPlaylistCategory().getId());
		playlist.setPlaylistCategory(playlistCategory);
		status.setId(1);
		playlist.setStatus(status);
		playlistService.save(playlist);
		return "redirect:/admin/playlist/index";
	}

	@RequestMapping(value = "edit", method = RequestMethod.GET)
	public String edit(ModelMap modelMap, @RequestParam(value = "id", required = false) int id) {
		Playlist playlist = playlistService.find(id);
		modelMap.put("thumbnail", playlist.getThumbnail());
		modelMap.put("categoryId", playlist.getPlaylistCategory().getId());
		modelMap.put("playlistCategories", playlistCategoryService.getAllPlaylistCategories());
		modelMap.put("playlist", playlist);
		return "admin/playlist/edit";
	}

	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public String edit(@ModelAttribute("playlist") Playlist playlist, @RequestParam("photo") MultipartFile photo) {
		Playlist newPlaylist = playlistService.find(playlist.getId());
		if (!photo.isEmpty() && photo.getSize() > 0) {
			FileUploadHelper fileHelper = new FileUploadHelper();
			fileHelper.deleteImage(newPlaylist.getThumbnail(), servletContext, "playlist");
			String thumbnail = fileHelper.uploadImage(photo, servletContext, "playlist");
			newPlaylist.setThumbnail(thumbnail);
		}
		if (playlist.getPlaylistCategory() == null) {
			newPlaylist.getPlaylistCategory().setId(3);
		} else {
			newPlaylist.setPlaylistCategory(playlist.getPlaylistCategory());
		}
		newPlaylist.setTitle(playlist.getTitle());
		newPlaylist.setDescription(playlist.getDescription());
		newPlaylist.setLastUpdated(new Date());
		Playlist editPlaylist = playlistService.save(newPlaylist);

		// send notification
		if (editPlaylist.getPlaylistCategory().getId() == 3) {
			int accountId = 0;
			for (AccountPlaylist accountPlaylist : editPlaylist.getAccountPlaylists()) {
				if (accountPlaylist.isIsOwn() == true) {
					accountId = accountPlaylist.getAccount().getId();
				}
			}
			if (editPlaylist != null) {
				String message = "Your album " + playlist.getTitle().toUpperCase()
						+ " was changed by admin. If you unsatisfied, send feedback please!";
				notificationService.sendNotification(accountId, message);
			}
		}
		return "redirect:/admin/playlist/index";
	}

	@RequestMapping(value = "view-tracks", method = RequestMethod.GET)
	public ResponseEntity<List<TrackInfo>> viewTracks(@RequestParam(value = "id", required = false) int id) {
		try {
			Playlist playlist = playlistService.find(id);
			List<TrackInfo> tracks = new ArrayList<TrackInfo>();
			for (Track track : playlist.getTracks()) {
				TrackInfo trackInfo = new TrackInfo();
				trackInfo.setId(track.getId());
				trackInfo.setTitle(track.getTitle());
				trackInfo.setStatusId(track.getStatus().getId());
				tracks.add(trackInfo);
			}
			session.setAttribute("playlistId", id);
			return new ResponseEntity<List<TrackInfo>>(tracks, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<TrackInfo>>(HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value = "delete-track", method = RequestMethod.GET)
	public ResponseEntity<List<TrackInfo>> deleteTrack(@RequestParam(value = "id", required = false) int id) {
		try {
			int playlistId = (Integer) session.getAttribute("playlistId");

			Playlist playlist = playlistService.find(playlistId);
			playlist.getTracks().remove(trackService.findById(id));
			playlistService.save(playlist);
			List<TrackInfo> tracks = new ArrayList<TrackInfo>();
			for (Track track : playlist.getTracks()) {
				TrackInfo trackInfo = new TrackInfo();
				trackInfo.setId(track.getId());
				trackInfo.setTitle(track.getTitle());
				trackInfo.setStatusId(track.getStatus().getId());
				tracks.add(trackInfo);
			}

			return new ResponseEntity<List<TrackInfo>>(tracks, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<TrackInfo>>(HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value = {
			"edit-status" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Integer> editStatus(@RequestParam(value = "id", required = false) int id) {
		try {
			Playlist playlist = playlistService.find(id);
			Status status = new Status();
			if (playlist.getStatus().getId() == 1) {
				status.setId(3);
				playlist.setStatus(status);
			} else if (playlist.getStatus().getId() == 3) {
				status.setId(1);
				playlist.setStatus(status);
			}
			playlistService.save(playlist);
			return new ResponseEntity<Integer>(status.getId(), HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Integer>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = { "delete" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Boolean> delete(@RequestParam("id") int playlistId) {
		try {
			boolean result = false;
			Playlist playlist = playlistService.find(playlistId);
			accountPlaylistService.removeAccountHasAlbum(playlist);
			playlist.setTracks(new HashSet<Track>(0));
			playlistService.delete(playlistId);

			// send notification
			if (playlist.getPlaylistCategory().getId() == 3) {
				int accountId = 0;
				for (AccountPlaylist accountPlaylist : playlist.getAccountPlaylists()) {
					if (accountPlaylist.isIsOwn() == true) {
						accountId = accountPlaylist.getAccount().getId();
						System.out.println("Account Id: " + accountId);
					}
				}
				String message = "Your album " + playlist.getTitle().toUpperCase()
						+ " was deleted by admin. If you unsatisfied, send feedback please!";
				notificationService.sendNotification(accountId, message);
			}
			
			result = true;
			return new ResponseEntity<Boolean>(result, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Boolean>(HttpStatus.BAD_REQUEST);
		}
	}

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

}
