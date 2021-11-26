package com.demo.controllers.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.demo.models.AlbumInfo;

@Controller
@RequestMapping(value = { "notification"} )
public class NotificationController {
	
	//AlbumInfo albumInfo = new AlbumInfo();
	
	  @RequestMapping( value = { "","index" }) public String index() { return
	  "notification/index" ;
	  
	  }
	 
	//ahihihihi
	
}


