package com.demo.controllers.user;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.entities.Contact;
import com.demo.services.ContactService;

@Controller
@RequestMapping(value = {"contact"})
public class ContactController {
	
	@Autowired
	private ContactService contactService;
	
	@RequestMapping(value = {"","index"}, method = RequestMethod.GET)
	public String index() {
		
		
		return "contact/index";
	}
	
	@RequestMapping(value = {"save"}, method = RequestMethod.POST)
	public String save(@RequestParam("fullname") String fullname, @RequestParam("email") String email, @RequestParam("phoneNumber") String phoneNumber, @RequestParam("content") String content) {
		
		try {

			Contact contact = new Contact(fullname, email, phoneNumber, content, false, new Date());
			contactService.save(contact);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "home/index";
		
	}

}
