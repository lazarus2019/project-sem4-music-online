package com.demo.controllers.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.demo.entities.Privacy;
import com.demo.models.ArtistsInfor;
import com.demo.services.PrivacyService;

@Controller
@RequestMapping(value = {"privacy"})
public class PrivacyController {
	
	@Autowired
	private PrivacyService privacyService;
	
	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		try {
			
			modelMap.put("priva", privacyService.getAll());
		} catch (Exception e) {
			modelMap.put("erro", e.getMessage());
		}

		return "privacy/index";
	}

}
