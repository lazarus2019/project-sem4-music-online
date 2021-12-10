package com.demo.controllers.admin;

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

import com.demo.entities.Aboutus;
import com.demo.entities.Banner;
import com.demo.entities.Playlist;
import com.demo.entities.PlaylistCategory;
import com.demo.entities.Status;
import com.demo.helpers.FileUploadHelper;
import com.demo.services.AboutUsService;
import com.demo.services.BannerService;

@Controller
@RequestMapping(value = { "admin/banner" })
public class BannerController implements ServletContextAware {

	private ServletContext servletContext;

	@Autowired
	private BannerService bannerService;

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		modelMap.put("banners", bannerService.findAll());
		return "admin/banner/index";
	}

	@RequestMapping(value = { "add" }, method = RequestMethod.GET)
	public String add(ModelMap modelMap) {
		Aboutus banner = new Aboutus();
		modelMap.put("banner", banner);
		return "admin/banner/add";
	}

	@RequestMapping(value = { "add" }, method = RequestMethod.POST)
	public String add(@ModelAttribute("banner") Banner banner, @RequestParam("photo") MultipartFile photo) {
		FileUploadHelper fileHelper = new FileUploadHelper();
		String image = fileHelper.uploadImage(photo, servletContext, "banner");
		banner.setImage(image);
		banner.setStatus(true);
		bannerService.save(banner);
		return "redirect:/admin/banner/index";
	}

	@RequestMapping(value = { "edit" }, method = RequestMethod.GET)
	public String edit(@RequestParam(value = "id", required = true) int id, ModelMap modelMap) {
		Banner banner = bannerService.findById(id);
		modelMap.put("image", banner.getImage());
		modelMap.put("banner", banner);
		return "admin/banner/edit";
	}

	@RequestMapping(value = { "edit" }, method = RequestMethod.POST)
	public String edit(@ModelAttribute("banner") Banner banner, @RequestParam("photo") MultipartFile photo) {
		Banner newBanner = bannerService.findById(banner.getId());
		if (!photo.isEmpty() && photo.getSize() > 0) {
			FileUploadHelper.deleteImage(newBanner.getImage(), servletContext, "banner");
			String image = FileUploadHelper.uploadImage(photo, servletContext, "banner");
			newBanner.setImage(image);
		}
		newBanner.setTitle(banner.getTitle());
		newBanner.setDescription(banner.getDescription());
		bannerService.save(newBanner);
		return "redirect:/admin/banner/index";
	}

	@RequestMapping(value = { "delete" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Boolean> delete(@RequestParam("id") int id) {
		boolean result = false;
		bannerService.delete(id);
		result = true;
		try {
			return new ResponseEntity<Boolean>(result, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Boolean>(HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value = {
			"edit-status" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Boolean> editStatus(@RequestParam(value = "id", required = false) int id) {
		try {
			Banner banner = bannerService.findById(id);
			if (banner.isStatus() == true) {
				banner.setStatus(false);
			} else {
				banner.setStatus(true);
			}
			bannerService.save(banner);
			return new ResponseEntity<Boolean>(banner.isStatus(), HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Boolean>(HttpStatus.BAD_REQUEST);
		}
	}

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

}
