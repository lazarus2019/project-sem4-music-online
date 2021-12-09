package com.demo.controllers.admin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import com.demo.entities.Account;
import com.demo.entities.Country;
import com.demo.entities.PackageInfo;
import com.demo.helpers.FileUploadHelper;
import com.demo.repositories.CountryRepository;
import com.demo.services.AccountService;
import com.demo.services.CookieService;
import com.demo.services.PackageService;

@Controller
@RequestMapping(value = { "admin/profile" })
public class ProfileAdminController implements ServletContextAware {

	private ServletContext servletContext;

	@Autowired
	private AccountService accountService;

	@Autowired
	private CookieService cookieService;

	@Autowired
	private CountryRepository countryRepository;

	@Autowired
	private PackageService packageService;

	@RequestMapping( value = {"","index" } , method = RequestMethod.GET )
	public String index(ModelMap modelMap) {
		
		Account account = new Account();
		String id = cookieService.getValue("acc_id", "");
		if (id.equalsIgnoreCase("")) {
			return "redirect:/login/login";
		} else {
			account = accountService.findById(Integer.parseInt(id));
		}
		if (account != null) {
			modelMap.put("accountSignined", account);

			modelMap.put("accountUpdate", account);

			List<String> gender = new ArrayList<String>();
			gender.add("Male");
			gender.add("Female");
			modelMap.put("genders", gender);
			modelMap.put("countries", countries());
			// Get Package Info
			PackageInfo packageInfo = packageService.getServicePackage(account);
			modelMap.put("accountPackage", packageInfo);
			modelMap.put("accountOrder", account.getPackageInfos());
		}
		return "admin/profile/index";
	}
	
	@RequestMapping(value = { "updateProfile" }, method = RequestMethod.POST)
	public String updateProfile(@ModelAttribute("accountSignined") Account account, BindingResult errors, @RequestParam(value = "photoAccount",  required = false) MultipartFile file) {
		//System.out.println(account.toString());

		if (errors.hasErrors()) {

			return "redirect:/login/login";
		} else {

			String id = cookieService.getValue("acc_id", "");

			try {
				System.out.println("id : " + id);
				Account newAccount = accountService.findById(Integer.parseInt(id));
				if( file != null ) {
					String imageName = FileUploadHelper.uploadImage(file, servletContext, "artist");
					newAccount.setImage(imageName) ; 					
				}
				newAccount.setFirstname(account.getFirstname());
				newAccount.setLastname(account.getLastname());
				newAccount.setBirthday(account.getBirthday());
				newAccount.setGender(account.getGender());
				newAccount.setCountry(account.getCountry());
				newAccount.setDescription(account.getDescription());
	
				accountService.updateAccountFromSetting(newAccount);

				return "redirect:/admin/profile/index";

			} catch (Exception e) {
				System.out.println(e.getMessage());

				return "redirect:/admin/profile/index";

			}

		}
	}
	
	@RequestMapping(value = { "updateAccountPasswordFromSetting" }, method = RequestMethod.POST)
	public String updateAccountPasswordFromSetting(@RequestParam("oldpass") String oldPass,
			@RequestParam("newpass") String newPass, ModelMap modelMap) {

		String id = cookieService.getValue("acc_id", "");

		try {
			System.out.println("id : " + id);
			Account newAccount = accountService.findById(Integer.parseInt(id));

			boolean checkPw = BCrypt.checkpw(oldPass, newAccount.getPassword());
			if (!checkPw) {
				modelMap.put("tab4", true);
				modelMap.put("msgPassInvalid", "You must enter your current password correctly !");
				modelMap.put("accountSignined", newAccount);

				modelMap.put("accountUpdate", newAccount);

				List<String> gender = new ArrayList<String>();
				gender.add("Male");
				gender.add("Female");
				modelMap.put("gender", gender);
				modelMap.put("countries", countries());
				// Get Package Info
				PackageInfo packageInfo = packageService.getServicePackage(newAccount);
				modelMap.put("accountPackage", packageInfo);
				modelMap.put("accountOrder", newAccount.getPackageInfos());
				return "admin/profile/index";
			} else {
				String newPass2 = BCrypt.hashpw(newPass, BCrypt.gensalt());
				newAccount.setPassword(newPass2);

				//System.out.println(newAccount.toString());
				accountService.updateAccountFromSetting(newAccount);
			}
			// accountService.updateAccountFromSetting(newAccount);

			return "redirect:/admin/profile/index";

		} catch (Exception e) {
			System.out.println(e.getMessage());

			return "redirect:/home/index";

		}
	}
	

	public Iterable<Country> countries() {

		Iterable<Country> countries = countryRepository.findAll();
		return countries;
	}

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}
}