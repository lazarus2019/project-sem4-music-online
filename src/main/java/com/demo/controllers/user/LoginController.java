package com.demo.controllers.user;

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
import com.demo.entities.Role;
import com.demo.services.AccountService;
import com.demo.services.CookieService;

@Controller

@RequestMapping(value = {"login" ,"user/login" , })

public class LoginController {

	@Autowired
	private AccountService accountService ; 
	
	@Autowired
	CookieService cookieService ; 
	
	@RequestMapping(value = {"","login"}, method = RequestMethod.GET)
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
	
	
	@RequestMapping( value = {"notfound" } , method = RequestMethod.GET )
	public String notfound() {

		return "login/notfound" ; 

	}
	
	@RequestMapping(value = "signup", method = RequestMethod.GET)
	public String signup(ModelMap modelMap) {
		Account account = new Account() ; 
		modelMap.put("account", account) ; 
		

		return "login/signup";

	}
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String register(@ModelAttribute("account") Account account) {
		
		accountService.registerNewSignUp(account,AuthenticationProvider.LOCAL);
		System.out.println("Success: " + account.getId());

		return "redirect:/login/";

	}
	

	
}
