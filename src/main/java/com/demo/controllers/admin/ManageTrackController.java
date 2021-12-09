package com.demo.controllers.admin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
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
import com.demo.entities.ArtistTrack;
import com.demo.entities.Playlist;
import com.demo.entities.Status;
import com.demo.entities.Track;
import com.demo.helpers.FileUploadHelper;
import com.demo.models.PlaylistModel;
import com.demo.models.TrackInfo;
import com.demo.services.ArtistTrackService;
import com.demo.services.CommentService;
import com.demo.services.GenresService;
import com.demo.services.NotificationService;
import com.demo.services.PlaylistService;
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
	private PlaylistService playlistService;

	@Autowired
	private HttpSession session;
	
	@Autowired
	private ArtistTrackService artistTrackService;

	@Autowired
	private CommentService commentService;
	
	@Autowired
	private NotificationService notificationService;


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
			trackInfo.setAccounts(accounts);
			trackInfos.add(trackInfo);
		}
		modelMap.put("tracks", trackInfos);
		return "admin/track/index";
	}

	@RequestMapping(value = { "edit" }, method = RequestMethod.GET)
	public String edit(ModelMap modelMap, @RequestParam(value = "id", required = false) int id) {
		Track track = trackService.findById(id);
		modelMap.put("thumbnail", track.getThumbnail());
		modelMap.put("genres", genresService.findAll());
		modelMap.put("track", track);
		return "admin/track/edit";
	}

	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public String edit(@ModelAttribute("track") Track track, @RequestParam("photo") MultipartFile photo) {
		Track newTrack = trackService.findById(track.getId());
		if (!photo.isEmpty() && photo.getSize() > 0) {
			FileUploadHelper fileHelper = new FileUploadHelper();
			String thumbnail = fileHelper.uploadImage(photo, servletContext, "track");
			newTrack.setThumbnail(thumbnail);
		}
		newTrack.setTitle(track.getTitle());
		newTrack.setGenres(track.getGenres());
		newTrack.setIsPremium(track.isIsPremium());
		newTrack.setLyrics(track.getLyrics());
		Track ediTrack = trackService.save(newTrack);

		// send notification
		int accountId = 0;
		for (ArtistTrack artistTrack : ediTrack.getArtistTracks()) {
			if (artistTrack.isIsOwn() == true) {
				accountId = artistTrack.getAccount().getId();
				System.out.println("account id: " + accountId);
			}
		}

		if (ediTrack != null) {
			String message = "Your track " + newTrack.getTitle().toUpperCase()
					+ " was changed something by admin. If you unsatisfied, send feedback please!";
			notificationService.sendNotification(accountId, message);
		}

		return "redirect:/admin/manage-track/index";
	}

	@RequestMapping(value = { "checkin" }, method = RequestMethod.GET)
	public String checkin(ModelMap modelMap, @RequestParam(value = "id", required = false) int id) {
		Track track = trackService.findById(id);
		modelMap.put("thumbnail", track.getThumbnail());
		modelMap.put("genre", track.getGenres().getName());
		modelMap.put("track", track);
		return "admin/track/checkin";
	}

	@RequestMapping(value = "checkin", method = RequestMethod.POST)
	public String checkin(@ModelAttribute("track") Track track) {
		Track newTrack = trackService.findById(track.getId());
		Status status = new Status();
		newTrack.setIsPremium(track.isIsPremium());
		status.setId(1);
		newTrack.setStatus(status);
		Track saveTrack = trackService.save(newTrack);
		// send notification
		int accountId = 0;
		for (ArtistTrack artistTrack : saveTrack.getArtistTracks()) {
			if (artistTrack.isIsOwn() == true) {
				accountId = artistTrack.getAccount().getId();
				System.out.println("account id: " + accountId);
			}
		}

		if (saveTrack != null) {
			String message = "Your track " + newTrack.getTitle().toUpperCase()
					+ " was public. Now everyone can listen this track!";
			notificationService.sendNotification(accountId, message);
		}

		return "redirect:/admin/manage-track/index";
	}

	@RequestMapping(value = {
			"edit-status" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Integer> editStatus(@RequestParam(value = "id", required = false) int id) {
		try {
			Track track = trackService.findById(id);
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

	@RequestMapping(value = {
			"view-lyric" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<TrackInfo> viewLyric(@RequestParam(value = "id", required = false) int id) {
		try {
			Track track = trackService.findById(id);
			TrackInfo trackInfo = new TrackInfo();
			trackInfo.setTitle(track.getTitle());
			trackInfo.setLyrics(track.getLyrics());
			return new ResponseEntity<TrackInfo>(trackInfo, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<TrackInfo>(HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value = {
			"show-playlist" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<PlaylistModel>> showPlaylist(@RequestParam(value = "id", required = false) int id) {
		try {
			List<PlaylistModel> playlistModels = new ArrayList<PlaylistModel>();
			for (Playlist playlist : playlistService.getAllPlaylist()) {
				PlaylistModel playlistModel = new PlaylistModel();
				playlistModel.setId(playlist.getId());
				playlistModel.setTitle(playlist.getTitle());
				playlistModels.add(playlistModel);
			}
			session.setAttribute("trackId", id);
			return new ResponseEntity<List<PlaylistModel>>(playlistModels, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<PlaylistModel>>(HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value = {
			"search-playlist" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<PlaylistModel>> searchPlaylist(
			@RequestParam(value = "keyword", required = false) String keyword) {
		try {
			List<PlaylistModel> playlistModels = new ArrayList<PlaylistModel>();
			if (keyword != null) {
				for (Playlist playlist : playlistService.searchByTitle(keyword)) {
					PlaylistModel playlistModel = new PlaylistModel();
					playlistModel.setId(playlist.getId());
					playlistModel.setTitle(playlist.getTitle());
					playlistModels.add(playlistModel);
				}
			} else {
				for (Playlist playlist : playlistService.getAllPlaylist()) {
					PlaylistModel playlistModel = new PlaylistModel();
					playlistModel.setId(playlist.getId());
					playlistModel.setTitle(playlist.getTitle());
					playlistModels.add(playlistModel);
				}
			}
			return new ResponseEntity<List<PlaylistModel>>(playlistModels, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<PlaylistModel>>(HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value = {
			"add-to-playlist" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Boolean> addToPlaylist(@RequestParam(value = "id", required = false) int id,
			HttpServletRequest request) {
		try {
			System.out.println("id: " + id);
			boolean flag = false;
			int trackId = (Integer) session.getAttribute("trackId");
			Track track = trackService.findById(trackId);
			Playlist playlist = playlistService.find(id);
			boolean status = playlist.getTracks().contains(track);

			if (!status) {
				playlist.getTracks().add(track);
				playlistService.save(playlist);
				flag = true;
			} else {
				flag = false;
			}

			return new ResponseEntity<Boolean>(flag, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Boolean>(HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value = { "delete" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Boolean> delete(@RequestParam("id") int trackId) {
		boolean result = false;
		Track track = trackService.findById(trackId);
		artistTrackService.removeAllArtistFromTrack(track);
		for (Playlist album : track.getPlaylists()) {
			track.getPlaylists().remove(album);
		}
		commentService.removeAllCommentInTrack(track);
		trackService.delete(trackId);

		int accountId = 0;
		for (ArtistTrack artistTrack : track.getArtistTracks()) {
			if (artistTrack.isIsOwn() == true) {
				accountId = artistTrack.getAccount().getId();
				System.out.println("account id: " + accountId);
			}
		}
		String message = "Your track " + track.getTitle().toUpperCase()
				+ " was deleted by admin. If you unsatisfied, send feedback please!";
		notificationService.sendNotification(accountId, message);

		result = true;
		try {
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