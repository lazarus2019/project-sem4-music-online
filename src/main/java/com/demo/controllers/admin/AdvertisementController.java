package com.demo.controllers.admin;

import java.util.List;

import javax.servlet.ServletContext;

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

import com.demo.entities.Advertisement;
import com.demo.entities.Playlist;
import com.demo.entities.ServicePackage;
import com.demo.entities.Status;
import com.demo.helpers.FileUploadHelper;
import com.demo.services.AdvertisementService;

@Controller
@RequestMapping(value = { "admin/advertisement" })
public class AdvertisementController implements ServletContextAware  {

	private ServletContext servletContext;
	
	@Autowired
	private AdvertisementService advertisementService;

	@RequestMapping( value = {"","index" } , method = RequestMethod.GET )
	public String index(ModelMap modelMap) {
		modelMap.put("advertisements", advertisementService.findAll());
		return "admin/advertisement/index";
	}
	
	@RequestMapping(value = { "edit" }, method = RequestMethod.GET)
	public String edit(@RequestParam(value = "id", required = false) int advertisementId, ModelMap modelMap) {
		Advertisement advertisement = advertisementService.findById(advertisementId);
		modelMap.put("advertisement", advertisement);
		modelMap.put("thumbnail", advertisement.getThumbnail());
		modelMap.put("audio", advertisement.getFileName());
		return "admin/advertisement/edit";
	}
	
	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public String edit(@ModelAttribute("advertisement") Advertisement advertisement, @RequestParam(value = "fileThumbnail", required = false) MultipartFile fileThumbnail) {
		Advertisement newAds = advertisementService.findById(advertisement.getId());
		String directionThumbnail = "images/advertisement/";
		if (!fileThumbnail.isEmpty() && fileThumbnail.getSize() > 0) {
			FileUploadHelper fileHelper = new FileUploadHelper();
			fileHelper.deleteFile(newAds.getThumbnail(), directionThumbnail, servletContext);
			String thumbnail = fileHelper.uploadFile(fileThumbnail, directionThumbnail, servletContext);
			if(thumbnail != null) {
				newAds.setThumbnail(thumbnail);
			}
		}
		newAds.setTitle(advertisement.getTitle());
		newAds.setDescription(advertisement.getDescription());
		advertisementService.save(newAds);
		
		return "redirect:/admin/advertisement/index";
	}	
	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(ModelMap modelMap) {
		modelMap.put("advertisement", new Advertisement());
		return "admin/advertisement/add";
	}
	
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(@ModelAttribute("advertisement") Advertisement advertisement, @RequestParam("adsAudio") MultipartFile adsAudio, @RequestParam("fileThumbnail") MultipartFile fileThumbnail, @RequestParam("duration")int duration) {		
		FileUploadHelper fileHelper = new FileUploadHelper();
		String directionAudio = "audio/advertisement/";
		String directionThumbnail = "images/advertisement/";
		
		Advertisement newAds = new Advertisement();
		String thumbnail = fileHelper.uploadFile(fileThumbnail, directionThumbnail, servletContext);
		String fileName = fileHelper.uploadFile(adsAudio, directionAudio, servletContext);
		if(thumbnail != null && fileName != null) {
			newAds.setTitle(advertisement.getTitle());
			newAds.setStatus(false);
			newAds.setDuration(duration);
			newAds.setFileName(fileName);
			newAds.setThumbnail(thumbnail);
			newAds.setDescription(advertisement.getDescription());
			
			advertisementService.save(newAds);
		}
		return "redirect:/admin/advertisement/index";
	}
	
	@RequestMapping(value = {"delete" }, method = RequestMethod.GET, produces = MimeTypeUtils.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> deleteMailbox(@RequestParam("id") int adsId) {
		String result = "";
		String directionAudio = "audio/advertisement/";
		String directionThumbnail = "images/advertisement/"; 
		List<Advertisement> advertisements = (List<Advertisement>)advertisementService.findAll();
		if(advertisements.size() > 1) {
			Advertisement advertisement = advertisementService.findById(adsId);
			FileUploadHelper.deleteFile(advertisement.getFileName(), directionAudio, servletContext);
			FileUploadHelper.deleteFile(advertisement.getThumbnail(), directionThumbnail, servletContext);
			boolean status = advertisement.isStatus();
			advertisementService.delete(adsId);
			if(status) {
				List<Advertisement> adsTmps = (List<Advertisement>)advertisementService.findAll();
				Advertisement activeAds = adsTmps.get(0);
				activeAds.setStatus(true);
				advertisementService.save(activeAds);
			}			
			result = "OK";
		}else {
			result = "MUST_HAVE_ONE";
		}
		try {
			return new ResponseEntity<String>(result, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<String>("ERROR", HttpStatus.BAD_REQUEST);
		}
	}
	
		@RequestMapping(value = {
		"edit-status" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Boolean> editStatus(@RequestParam(value = "id", required = false) int id) {
	try {
		boolean result = false;
		Advertisement advertisement = advertisementService.findById(id);
		if(advertisement.isStatus()) {
			advertisement.setStatus(false);
		}else {
			for(Advertisement adsTmp : advertisementService.findAll()) {
				adsTmp.setStatus(false);
				advertisementService.save(adsTmp);
			}
			advertisement.setStatus(true);
			result = true;
		}
		advertisementService.save(advertisement);

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
