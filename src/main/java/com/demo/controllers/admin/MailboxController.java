package com.demo.controllers.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.entities.Account;
import com.demo.entities.Contact;
import com.demo.models.ContactInfo;
import com.demo.services.AccountService;
import com.demo.services.ContactService;

@Controller
@RequestMapping(value = { "admin/contact" })
public class MailboxController {


	@Autowired
	private ContactService contactService;
	
	@Autowired
	private AccountService accountService;

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		modelMap.put("amountMailbox", contactService.getAmountUnreadMailbox());
		modelMap.put("contacts", contactService.findAll());
		return "admin/contact/index";
	}

	@RequestMapping(value = {"checkReadMailbox" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Boolean> checkReadMailbox(@RequestParam("id") int contactId) {
		boolean result = false;
		Contact contact = contactService.findById(contactId);
		if (contact.getId() != null) {
			if(contact.isIsRead()) {
				result = false;
			}else {
				contact.setIsRead(true);
				contactService.save(contact);
				result = true;				
			}
		}
		try {
			return new ResponseEntity<Boolean>(result, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Boolean>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = {"delete" }, method = RequestMethod.GET, produces = MimeTypeUtils.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> deleteMailbox(@RequestParam("id") int contactId) {
		String result = "";
		contactService.delete(contactId);
		result = "OK";
		try {
			return new ResponseEntity<String>(result, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<String>("ERROR", HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = {"sendMail" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Boolean> sendMail(@RequestParam("email") String email, @RequestParam("content") String content) {
		boolean result = false;
		// Send mail here
		Account account = new Account();
		account = accountService.findByEmail(email);
		if(account != null) {
			contactService.replyContactAccount(account, content);
		}else {
			contactService.replyContactEmail(email, content);
		}
		result = true;
		try {
			return new ResponseEntity<Boolean>(result, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Boolean>(false, HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = {"findById" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<ContactInfo> findById(@RequestParam("id") int contactId) {
		ContactInfo contactInfo = contactService.findContactInfoById(contactId);
		try {
			return new ResponseEntity<ContactInfo>(contactInfo, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<ContactInfo>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = {"getAmountUnreadMailbox" }, method = RequestMethod.GET, produces = MimeTypeUtils.TEXT_PLAIN_VALUE)
	public ResponseEntity<Integer> getAmountUnreadMailbox() {
		int amount = contactService.getAmountUnreadMailbox();
		try {
			return new ResponseEntity<Integer>(amount, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Integer>(HttpStatus.BAD_REQUEST);
		}
	}
}
