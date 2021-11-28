package com.demo.controllers.admin;

import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import com.demo.entities.Account;
import com.demo.entities.Playlist;
import com.demo.entities.Status;
import com.demo.helpers.FileUploadHelper;
import com.demo.repositories.AccountRepository;
import com.demo.services.PlaylistCategoryService;
import com.demo.services.PlaylistService;

@Controller
@RequestMapping(value = "admin/playlist")
public class PlaylistController implements ServletContextAware {

	private ServletContext servletContext;

	@Autowired
	private PlaylistService playlistService;

	@Autowired
	private PlaylistCategoryService playlistCategoryService;

	@RequestMapping(value = { "", "index" })
	public String index(ModelMap modelMap) {
		modelMap.put("playlistTabTitle", "All Playlist");
		modelMap.put("AlbumTabTitle", "All Album");
		modelMap.put("playlists", playlistService.getAllPlaylist());
		modelMap.put("albums", playlistService.getAllAlbum());
		/*
		 * for (Playlist playlist : playlistService.getAllPlaylist()) { for(Account
		 * account : playlist.findAccounts()) { System.out.println(account.getId()); }
		 * 
		 * }
		 */
		return "admin/playlist/index";
	}

	@RequestMapping(value = "edit-status")
	public String editStatus(@RequestParam(value = "id", required = false) int id, ModelMap modelMap) {
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
		modelMap.put("playlists", playlistService.getAllPlaylist());
		return "redirect:/admin/playlist/index";
	}

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(ModelMap modelMap) {
		Playlist playlist = new Playlist();
		modelMap.put("playlistCategories", playlistCategoryService.getAllPlaylist());
		modelMap.put("playlist", playlist);
		return "admin/playlist/add";
	}

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(@ModelAttribute("playlist") Playlist playlist, @RequestParam("photo") MultipartFile photo) {
		FileUploadHelper fileHelper = new FileUploadHelper();
		String fileName = fileHelper.upload(photo, servletContext);
		playlist.setThumbnail(fileName);
		playlist.setPublishDate(new Date());
		playlist.setLastUpdated(new Date());
		playlist.setLikes(0);
		playlist.getStatus().setId(1);
		playlistService.save(playlist);
		return "redirect:/admin/playlist/index";
	}

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

}
