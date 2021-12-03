package com.demo.controllers.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.openqa.selenium.html5.LocalStorage;
import com.demo.paypal.PayPalConfig;
import com.demo.paypal.PayPalResult;
import com.demo.paypal.PayPalSucess;
import com.demo.services.PackageService;	

@Controller
@RequestMapping(value = { "package"} )
public class PackageController {
	
	@Autowired
	private PackageService packageService;
	
	@Autowired
	private Environment environment;
	
	/*
	 * @Autowired private LocalStorage localStorage;
	 */
	@RequestMapping( value = { "","index" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		String postUrl = environment.getProperty("paypal.posturl");
		String returnUrl = environment.getProperty("paypal.returnurl");
		String business = environment.getProperty("paypal.business");
		modelMap.put("postUrl", postUrl);
		modelMap.put("returnUrl", returnUrl);
		modelMap.put("business", business);
		modelMap.put("packages", packageService.getAllByStatus());
		return "package/index" ; 
	}
	
	@RequestMapping(value = { "success"}, method = RequestMethod.GET)
	public  String success(HttpServletRequest request) { 
		/*
		 * PayPalConfig payPalConfig = new PayPalConfig();
		 * payPalConfig.setAuthToken(environment.getProperty("paypal.authtoken"));
		 * payPalConfig.setPosturl(environment.getProperty("paypal.posturl"));
		 * payPalConfig.setBusiness(environment.getProperty("paypal.business"));
		 * payPalConfig.setReturnurl(environment.getProperty("paypal.returnurl"));
		 * PayPalResult payPalResult = PayPalSucess.getPayPal(request, payPalConfig);
		 * System.out.println("FirstName: " + payPalResult.getFirst_name());
		 * System.out.println("Email: " + payPalResult.getPayer_email());
		 * System.out.println("Payment fee: " + payPalResult.getPayment_fee());
		 * System.out.println("Gross: " + payPalResult.getPayment_gross());
		 * System.out.println("Item: " + payPalResult.getNum_cart_items());
		 * System.out.println("Item number: " + payPalResult.getItem_number());
		 */
		return "package/index";
	}
	
}
