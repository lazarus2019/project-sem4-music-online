package com.demo.controllers.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.demo.models.AlbumInfo;

@Controller
@RequestMapping(value = { "notification" })
public class NotificationController {

	// AlbumInfo albumInfo = new AlbumInfo();

	@RequestMapping(value = { "", "index" })
	public String index() {
		System.out.println("aaaaaaaaaaaaa");
		System.out.println("bbbbbbbbbbbbbbbbs");
		
		
		System.out.println("ccccccccccccccc");
		return "notification/index";

	}

	// ahihihihi

}
