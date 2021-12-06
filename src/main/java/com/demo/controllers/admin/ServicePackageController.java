package com.demo.controllers.admin;

import java.util.ArrayList;
import java.util.List;

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

import com.demo.entities.Account;
import com.demo.entities.ServicePackage;
import com.demo.models.PackageInfoModel;
import com.demo.services.PackageInfoService;
import com.demo.services.PackageService;

@Controller
@RequestMapping(value = {"admin/package"})
public class ServicePackageController {
	
	@Autowired
	private PackageService packageService;
	
	@Autowired
	private PackageInfoService packageInfoService;
	
	@RequestMapping( value = {"","index" } , method = RequestMethod.GET )
	public String index(ModelMap modelMap) {
		modelMap.put("packages", packageService.getAllPackageModel());
		modelMap.put("packageInfos", packageInfoService.findAll());
		return "admin/package/index";
	}
	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(ModelMap modelMap) {
		ServicePackage servicePackage = new ServicePackage();
		modelMap.put("servicePackage", servicePackage);
		return "admin/package/add";
	}
	
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(@ModelAttribute("servicePackage") ServicePackage servicePackage) {
		servicePackage.setIsDelete(false);
		packageService.save(servicePackage);
		return "redirect:/admin/package/index";
	}
	
	@RequestMapping(value = { "edit" }, method = RequestMethod.GET)
	public String edit(@RequestParam(value = "id", required = false) int packageId, ModelMap modelMap) {
		ServicePackage servicePackage = packageService.findById(packageId);
		modelMap.put("servicePackage", servicePackage);
		return "admin/package/edit";
	}
	
	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public String edit(@ModelAttribute("servicePackage") ServicePackage servicePackage) {
		ServicePackage tmp = packageService.findById(servicePackage.getId());
		servicePackage.setIsDelete(tmp.isIsDelete());
		packageService.save(servicePackage);
		return "redirect:/admin/package/index";
	}
	
	@RequestMapping(value = {"delete" }, method = RequestMethod.GET, produces = MimeTypeUtils.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> deleteMailbox(@RequestParam("id") int packageId) {
		String result = "";
		ServicePackage servicePackage = packageService.findById(packageId);
		servicePackage.setIsDelete(true);
		packageService.save(servicePackage);
		result = "OK";
		try {
			return new ResponseEntity<String>(result, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<String>("ERROR", HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = {"getAccountsSign" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<PackageInfoModel>> getAccounsSignByPackageId(@RequestParam("id") int packageId) {
		List<PackageInfoModel> packageInfoModels = packageService.getHistoryPackageSign(packageId);
		try {
			return new ResponseEntity<List<PackageInfoModel>>(packageInfoModels, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<PackageInfoModel>>(HttpStatus.BAD_REQUEST);
		}
	}

}
