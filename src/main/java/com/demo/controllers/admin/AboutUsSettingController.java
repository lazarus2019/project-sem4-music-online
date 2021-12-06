package com.demo.controllers.admin;

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

import com.demo.entities.Aboutus;
import com.demo.entities.Playlist;
import com.demo.services.AboutUsService;

@Controller
@RequestMapping(value = { "admin/aboutus" })
public class AboutUsSettingController {

	@Autowired
	private AboutUsService aboutUsService;

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		modelMap.put("aboutus", aboutUsService.findAlls());
		return "admin/aboutus/index";
	}

	@RequestMapping(value = { "add" }, method = RequestMethod.GET)
	public String add(ModelMap modelMap) {
		Aboutus aboutus = new Aboutus();
		modelMap.put("aboutus", aboutus);
		return "admin/aboutus/add";
	}

	@RequestMapping(value = { "add" }, method = RequestMethod.POST)
	public String add(@ModelAttribute("aboutus") Aboutus aboutus) {
		if (aboutus != null) {
			aboutUsService.save(aboutus);
		}
		return "redirect:/admin/aboutus/index";
	}

	@RequestMapping(value = { "edit" }, method = RequestMethod.GET)
	public String edit(@RequestParam(value = "id", required = true) int id, ModelMap modelMap) {
		Aboutus aboutus = aboutUsService.findById(id);
		modelMap.put("aboutus", aboutus);
		return "admin/aboutus/edit";
	}

	@RequestMapping(value = { "edit" }, method = RequestMethod.POST)
	public String edit(@ModelAttribute("aboutus") Aboutus aboutus) {
		if (aboutus != null) {
			aboutUsService.save(aboutus);
		}
		return "redirect:/admin/aboutus/index";
	}

	@RequestMapping(value = { "delete" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Boolean> delete(@RequestParam("id") int id) {
		boolean result = false;
		aboutUsService.delete(id);
		result = true;
		try {
			return new ResponseEntity<Boolean>(result, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Boolean>(HttpStatus.BAD_REQUEST);
		}
	}

}
