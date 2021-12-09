package com.demo.controllers.user;

import java.time.Instant;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;
import java.time.ZoneId;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.naming.java.javaURLContextFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.entities.AccountPlaylist;
import com.demo.entities.PackageInfo;
import com.demo.entities.Playlist;
import com.demo.entities.ServicePackage;
import com.demo.entities.Status;
import com.demo.helpers.CalculateDateTimeHelper;
import com.demo.paypal.PayPalConfig;
import com.demo.paypal.PayPalResult;
import com.demo.paypal.PayPalSucess;
import com.demo.services.AccountService;
import com.demo.services.CookieService;
import com.demo.services.NotificationService;
import com.demo.services.PackageInfoService;
import com.demo.services.PackageService;

@Controller
@RequestMapping(value = { "package" })
public class PackageController {

	@Autowired
	private PackageService packageService;

	@Autowired
	private PackageInfoService packageInfoService;

	@Autowired
	private CookieService cookieService;

	@Autowired
	private AccountService accountService;

	@Autowired
	private NotificationService notificationService;

	@Autowired
	private Environment environment;

	/*
	 * @Autowired private LocalStorage localStorage;
	 */
	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		String postUrl = environment.getProperty("paypal.posturl");
		String returnUrl = environment.getProperty("paypal.returnurl");
		String business = environment.getProperty("paypal.business");
		modelMap.put("postUrl", postUrl);
		modelMap.put("returnUrl", returnUrl);
		modelMap.put("business", business);
		modelMap.put("packages", packageService.getAllByStatus());
		return "package/index";
	}

	@RequestMapping(value = { "success" }, method = RequestMethod.GET)
	public String success(HttpServletRequest request) {
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

	@RequestMapping(value = {
			"add-pack-info" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Boolean> addPackageInfo(@RequestParam(value = "id", required = false) int id) {
		try {
			CalculateDateTimeHelper dateTimeHelper = new CalculateDateTimeHelper();
			int accountId = Integer.parseInt(cookieService.getValue("acc_id", null));
			PackageInfo lastPackageInfo = packageInfoService.checkPackage(accountId);
			long expiration = 0;
			if(packageInfoService.checkPremiumByAccountId(accountId)) {
				Date date = lastPackageInfo.getExpirationDate();
				LocalDate currentDate = LocalDate.now();
				LocalDate pastDate = Instant.ofEpochMilli(date.getTime()).atZone(ZoneId.systemDefault()).toLocalDate();
				expiration = dateTimeHelper.differentOfDay(pastDate, currentDate);
			}
			boolean flag = false;
			ServicePackage servicePackage = packageService.findById(id);
			PackageInfo packageInfo = new PackageInfo();
			packageInfo.setAccount(accountService.findById(accountId));
			packageInfo.setServicePackage(servicePackage);
			packageInfo.setPrice(servicePackage.getPrice());
			Date purchaseDate = new Date();
			packageInfo.setPurchaseDate(purchaseDate);
			Calendar calendar = Calendar.getInstance();
			calendar.add(Calendar.DATE, (int) (servicePackage.getDuration()*30 + expiration));
			Date expirationDate = calendar.getTime();
			packageInfo.setExpirationDate(expirationDate);
			PackageInfo savePackageInfo = packageInfoService.save(packageInfo);
			if (savePackageInfo != null) {
				String message = "You have successfully purchased " + servicePackage.getName().toUpperCase()
						+ " package. Enjoy it!";
				notificationService.sendNotification(accountId, message);
				flag = true;
			}
			return new ResponseEntity<Boolean>(flag, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Boolean>(HttpStatus.BAD_REQUEST);
		}
	}

}
