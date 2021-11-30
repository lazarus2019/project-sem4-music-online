package com.demo.controllers.admin;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.entities.Account;
import com.demo.entities.AccountPlaylist;
import com.demo.entities.Playlist;
import com.demo.entities.PlaylistCategory;
import com.demo.entities.Status;
import com.demo.helpers.FileUploadHelper;
import com.demo.models.PlaylistModel;
import com.demo.repositories.AccountRepository;
import com.demo.services.AccountPlaylistService;
import com.demo.services.PlaylistCategoryService;
import com.demo.services.PlaylistService;

@Controller
@RequestMapping(value = "admin/playlist")
public class PlaylistController implements ServletContextAware {

	private ServletContext servletContext;

	@Autowired
	private PlaylistService playlistService;
	
	@Autowired
	private AccountPlaylistService accountPlaylistService;

	@Autowired
	private PlaylistCategoryService playlistCategoryService;

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
				if(accountPlaylist.isIsOwn() == true && accountPlaylist.getAccount().getId() == account.getId()) {
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
		String fileName = fileHelper.uploadImage(photo, servletContext, "playlist");
		playlist.setThumbnail(fileName);
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
			String fileName = fileHelper.uploadImage(photo, servletContext, "playlist");
			newPlaylist.setThumbnail(fileName);
		}
		if (playlist.getPlaylistCategory() == null) {
			newPlaylist.getPlaylistCategory().setId(3);
		} else {
			newPlaylist.setPlaylistCategory(playlist.getPlaylistCategory());
		}
		newPlaylist.setTitle(playlist.getTitle());
		newPlaylist.setDescription(playlist.getDescription());
		newPlaylist.setLastUpdated(new Date());
		playlistService.save(newPlaylist);
		return "redirect:/admin/playlist/index";
	}

	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(@RequestParam(value = "id", required = false) int id) {
		Playlist playlist = playlistService.find(id);
		playlistService.delete(id);
		FileUploadHelper fileHelper = new FileUploadHelper();
		fileHelper.deleteImage(playlist.getThumbnail(), servletContext, "playlist");
		return "redirect:/admin/playlist/index";
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

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

}
