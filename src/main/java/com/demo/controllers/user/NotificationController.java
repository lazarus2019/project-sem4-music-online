package com.demo.controllers.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.entities.Notification;
import com.demo.entities.Playlist;
import com.demo.entities.Status;
import com.demo.services.CookieService;

import com.demo.services.NotificationService;

@Controller
@RequestMapping(value = { "notification" })
public class NotificationController {

	@Autowired
	private NotificationService notificationService;

	@Autowired
	private CookieService cookieService;

	@RequestMapping(value = { "", "index" })
	public String index(ModelMap modelMap) {
		int accountId = Integer.parseInt(cookieService.getValue("acc_id", null));
		modelMap.put("notifications", notificationService.getAllByAccountId(accountId));
		return "notification/index";
	}

	@RequestMapping(value = { "delete" }, method = RequestMethod.GET)
	public String index(@RequestParam("id") int[] id, ModelMap modelMap) {
		if (id.length > 0) {
			notificationService.delete(id);
		} else {
			return "notification/index";
		}
		return "redirect:/notification/index";
	}

	@RequestMapping(value = {
			"edit-status" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Boolean> editStatus(@RequestParam(value = "id", required = false) int id) {
		try {
			Notification notification = notificationService.findById(id);
			if (notification.isIsRead() == false) {
				notification.setIsRead(true);
			}
			notificationService.save(notification);
			return new ResponseEntity<Boolean>(true, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Boolean>(HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value = {
			"mark-all-as-read" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Boolean> MarkAllAsRead() {
		try {
			int accountId = Integer.parseInt(cookieService.getValue("acc_id", null));
			List<Notification> notifications = notificationService.getAllByAccountId(accountId);
			for (Notification notification : notifications) {
				notification.setIsRead(true);
				notificationService.save(notification);
			}
			return new ResponseEntity<Boolean>(true, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Boolean>(HttpStatus.BAD_REQUEST);
		}
	}
}