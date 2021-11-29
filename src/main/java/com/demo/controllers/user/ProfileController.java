package com.demo.controllers.user;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.entities.Account;
import com.demo.entities.Country;
import com.demo.repositories.CountryRepository;
import com.demo.services.AccountService;
import com.demo.services.CookieService;


@Controller
@ControllerAdvice
@RequestMapping("user/profile")
public class ProfileController {
	
	@Autowired
	private AccountService accountService ; 
	
	@Autowired
	private CookieService cookieService ; 
	
	@Autowired
	private CountryRepository countryRepository ; 

	@RequestMapping( value = {"","index" } , method = RequestMethod.GET )
	public String index(ModelMap modelMap, Authentication authentication ) {


		
		if( authentication == null || authentication instanceof AnonymousAuthenticationToken) {
			modelMap.put("msg", "You must sign in first") ; 
			return "redirect:/user/login/login" ; 
		}
		else {
			
			Account account = new Account() ; 
			String id = cookieService.getValue("acc_id", "") ; 
			if( id.equalsIgnoreCase("")) {
				return "redirect:/user/login/login" ; 
			}
			else {
				account = accountService.findById(Integer.parseInt(id)) ;					
			}
			if( account != null ) {						
				modelMap.put("accountSignined", account) ; 
				
				modelMap.put("accountUpdate", account);
				
				//System.out.println("Name Profile : " + account.getNickname());
				List<String> gender = new ArrayList<String>() ; 
				gender.add("Male") ; 
				gender.add("Female")  ;
				modelMap.put("gender", gender);
				modelMap.put("countries", countries()) ; 		
				
				//modelMap.addAttribute("accountUpdate", account) ;
			}
		}
		return "user/profile/index" ; 
	}
	
	
	@RequestMapping( value = {"updateAccountFromSetting" } , method = RequestMethod.POST )
	public String updateAccountFromSetting( @ModelAttribute("accountUpdate") Account account, BindingResult errors ) { 
		System.out.println(account.toString()) ;
		
		if (errors.hasErrors()) {
			
			return "redirect:/user/login/login" ;
		} else {
			
			String id = cookieService.getValue("acc_id", "") ; 
			
			
			try {
				System.out.println("id : " + id) ;
				
				Account newAccount = accountService.findById(Integer.parseInt(id)) ; 	
				String loginType = cookieService.getValue("login_type", "") ; 
				if (loginType.equalsIgnoreCase("local")) {
					newAccount.setUsername(account.getUsername()); 
					newAccount.setNickname(account.getNickname());
					newAccount.setFirstname(account.getFirstname()) ; 
					newAccount.setLastname(account.getLastname());
					newAccount.setEmail(account.getEmail());
					newAccount.setBirthday(account.getBirthday());
					newAccount.setGender(account.getGender());
					newAccount.setCountry(account.getCountry()); 
					newAccount.setDescription(account.getDescription());
				}
				if(loginType.equalsIgnoreCase("facebook") ) { 
					newAccount.setNickname(account.getNickname());
					newAccount.setBirthday(account.getBirthday());
					newAccount.setGender(account.getGender());
					newAccount.setCountry(account.getCountry()); 
					newAccount.setDescription(account.getDescription());
				}
				
//				System.out.println("Auth : " + newAccount.getAuthProvider());
				accountService.updateAccountFromSetting(newAccount);
				//accountService.updateAccountFromSetting(newaccount,AuthenticationProvider.FACEBOOK); 
				return "redirect:/user/profile/index";
				
			} 
			catch (Exception e) {
				System.out.println(e.getMessage());
				return "redirect:/user/home/index" ;
			}
			
		}
		
		
		
	}
	
	
	@RequestMapping( value = {"updateAccountPasswordFromSetting" } , method = RequestMethod.POST )
	public String updateAccountPasswordFromSetting(@RequestParam("oldpass") String oldPass ,  @RequestParam("newpass") String newPass ) { 
		
			
			String id = cookieService.getValue("acc_id", "") ; 
			
			
			try {
				System.out.println("id : " + id) ;
					
				System.out.println("");
				Account newAccount = accountService.findById(Integer.parseInt(id)) ; 	
				System.out.println("Old pass : " + BCrypt.checkpw(oldPass, newAccount.getPassword()));
				System.out.println("New pass : "  + newPass  );

				//accountService.updateAccountFromSetting(newAccount); 
				return "redirect:/user/profile/index";
				
			} 
			catch (Exception e) {
				System.out.println(e.getMessage());
				return "redirect:/user/home/index" ;
			}	
	}
	
	
	
	
	
	public Iterable<Country> countries() {
		
		Iterable<Country> countries = countryRepository.findAll() ;
		return countries ; 
	}
}
