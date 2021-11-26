package com.demo.controllers.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.demo.models.AlbumInfo;

@Controller
@RequestMapping(value = { "notification" })
public class NewController {

	// AlbumInfo albumInfo = new AlbumInfo();

	@RequestMapping(value = { "", "index" })
	public String index() {
		
		System.out.println("them 1 dong moi nhaaaaaaaaa");
		System.out.println("them 2 dong moi nhaaaaaaaaa");
		System.out.println("them 3 dong moi nhaaaaaaaaa");
		return "notification/index";

	}

	// ahihihihi

}
