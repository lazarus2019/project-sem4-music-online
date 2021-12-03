package com.demo.controllers.user;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.entities.Account;
import com.demo.entities.AuthenticationProvider;
import com.demo.entities.PackageInfo;
import com.demo.entities.Role;
import com.demo.services.AccountService;
import com.demo.services.CookieService;

@Controller

@RequestMapping(value = { "login", "user/login", })

public class LoginController {

	@Autowired
	private AccountService accountService;

	@Autowired
	CookieService cookieService;

	@RequestMapping(value = { "", "login" }, method = RequestMethod.GET)
	public String login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, ModelMap modelMap) {
		if (error != null) {
			modelMap.put("msg", "Invalid");
		}
		if (logout != null) {
			modelMap.put("msg", "Logout");
			cookieService.remove("login_type");
			cookieService.remove("acc_id");
		}

		return "login/login";

	}

	@RequestMapping(value = { "notfound" }, method = RequestMethod.GET)
	public String notfound() {

		return "login/notfound";

	}

	@RequestMapping(value = "signup", method = RequestMethod.GET)
	public String signup(ModelMap modelMap) {
		Account account = new Account();
		modelMap.put("account", account);

		return "login/signup";

	}

	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String register(@ModelAttribute("account") Account account, ModelMap modelMap) {

		Account accoundCheck = accountService.findByEmail(account.getEmail());
		if (accoundCheck != null) {
			modelMap.put("msg", "This email already register. Do you want sign in ?");
			modelMap.put("email", account.getEmail());
			return "login/login";
		} else {
			accountService.registerNewSignUp(account, AuthenticationProvider.LOCAL);
			System.out.println("Success: " + account.getId());
			modelMap.put("acc_id", account.getId());
			cookieService.add("acc_id_signup", String.valueOf(account.getId()), 1);
			return "redirect:/login/confirmEmail";
		}
	}

	@RequestMapping(value = "confirmEmail", method = RequestMethod.GET)
	public String confirmEmail(ModelMap modelMap) {
		return "login/activeAccount";

	}

	@RequestMapping(value = "activeAccount", method = RequestMethod.POST)
	public String activeAccount(@RequestParam("emailcode") String emailcode, ModelMap modelMap) {
		String id = cookieService.getValue("acc_id_signup", "");

		Account account = new Account();
		if (id.equalsIgnoreCase("")) {
			return "redirect:/login/signup";
		} else {
			account = accountService.findById(Integer.parseInt(id));
		}
		if (account != null) {
			if (account.getEmailCode().equals(emailcode)) {
				account.setIsActive(true);
				accountService.updateAccountFromSetting(account);
				cookieService.remove("acc_id_signup");
			} else {
				modelMap.put("msg", "Wrong Code");
				return "redirect:/login/confirmEmail";
			}
		}

		return "redirect:/login/";
	}

	@RequestMapping(value = "forgotPw", method = RequestMethod.GET)
	public String forgotPw(ModelMap modelMap) {
		return "login/forgotPassword";

	}

	@RequestMapping(value = "forgotPassword", method = RequestMethod.POST)
	public String forgotPassword(@RequestParam("email") String email, ModelMap modelMap) {
		Account account = new Account();
		account = accountService.findByEmail(email);

		if (account == null) {
			modelMap.put("msg", "There are no accounts for this email !");
			return "login/forgotPassword";
		} else {
			accountService.forgotPassword(account);
			modelMap.put("msg", "Use new your password and sign in ");
			return "login/login";
		}
	}

}
