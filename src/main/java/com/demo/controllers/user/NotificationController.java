package com.demo.controllers.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.services.CookieService;
import com.demo.services.NotificationService;

@Controller
@RequestMapping(value = { "notification" })
public class NotificationController {

	@Autowired
	private NotificationService notificationService;

	@Autowired
	private CookieService cookieService ; 

	@RequestMapping(value = { "", "index" })
	public String index(ModelMap modelMap) {
		int accountId = Integer.parseInt(cookieService.getValue("acc_id", null)) ;
		modelMap.put("notifications", notificationService.getAllByAccountId(accountId));
		return "notification/index";
	}

	@RequestMapping(value = { "delete" }, method = RequestMethod.GET)
	public String index(@RequestParam("id") int[] id, ModelMap modelMap, RedirectAttributes redirectAttributes) {
		try {
			if (id.length > 0) {
				notificationService.delete(id);
			} else {
				redirectAttributes.addFlashAttribute("msg", "Delete failed, please try again!");
			}
			redirectAttributes.addFlashAttribute("msg", "Successful delete!");
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("msg", "Delete failed, please try again!");
		}
		return "redirect:/notification/index";
	}

}
