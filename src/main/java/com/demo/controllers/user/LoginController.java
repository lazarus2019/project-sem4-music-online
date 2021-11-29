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
@RequestMapping("user/login")
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
		return "user/login/login";
	}
	
	
	@RequestMapping( value = {"notfound" } , method = RequestMethod.GET )
	public String notfound() {
		return "user/login/notfound" ; 
	}
	
	@RequestMapping(value = "signup", method = RequestMethod.GET)
	public String signup(ModelMap modelMap) {
		Account account = new Account() ; 
		modelMap.put("account", account) ; 
		
		return "user/login/signup";
	}
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String register(@ModelAttribute("account") Account account) {
		
		accountService.registerNewSignUp(account,AuthenticationProvider.LOCAL);
		System.out.println("Success: " + account.getId());
		return "redirect:/user/login/";
	}
	
	
	
//	@RequestMapping(value = "register", method = RequestMethod.POST)
//	public String register(@ModelAttribute("account") Account account, @RequestParam("roles") int[] roles) {
//		account.setPassword(new BCryptPasswordEncoder().encode(account.getPassword()));
//		if (roles != null) {
//			account.getRoles().clear();
//			for (int role : roles) {
//				Role ro = new Role();
//				ro.setId(role);
//				account.getRoles().add(ro);
//			}
//		}
//		accountService.save(account);
//		return "redirect:/account/login";
//	}
	
	
	
}
