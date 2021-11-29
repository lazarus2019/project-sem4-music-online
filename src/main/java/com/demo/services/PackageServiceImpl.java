package com.demo.services;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Account;
import com.demo.entities.PackageInfo;
import com.demo.entities.ServicePackage;
import com.demo.repositories.PackageRepository;

@Service("packageService")
public class PackageServiceImpl implements PackageService {

	@Autowired
	private PackageRepository packageRepository;
	
	@Override
	public List<ServicePackage> getAllByStatus() {
		return packageRepository.getAllByStatus();
	}

	@Override
	public PackageInfo getPackageInforByAccountId(int accountId) {
		return packageRepository.getPackageInforByAccountId(accountId);
	}

	@Override
	public ServicePackage getServicePackageById(int id) {
		return packageRepository.getServicePackageById(id);
	}

	@Override
	public PackageInfo getServicePackage(Account account) {
		Set<PackageInfo> packageInfos = account.getPackageInfos()  ;	
		List<PackageInfo> mainList = new ArrayList<PackageInfo>();
		mainList.addAll(packageInfos);
		PackageInfo packageInfoFirst = null ;
		if( mainList != null && mainList.size() > 0 ) {
			//System.out.println(mainList) ; 
			packageInfoFirst = mainList.get(0) ; 
			for( PackageInfo info : mainList) {						
				if(info != null ) {
					//System.out.println(info.getServicePackage().getName()); 
					if( info.getServicePackage().getId() > packageInfoFirst.getServicePackage().getId() && info.getExpirationDate().after(packageInfoFirst.getExpirationDate())) {
						packageInfoFirst = info ; 									
					}
				}
				else {
					System.err.println("loi r");
				}
				
			}
			if( packageInfoFirst.getExpirationDate().before(new Date())) {
				ServicePackage package1 = getServicePackageById(1) ;  
				packageInfoFirst.setServicePackage(package1); 
				packageInfoFirst.setPurchaseDate(new Date());
				
				Calendar calendar = Calendar.getInstance()  ;
				calendar.setTime(new Date()); 
				calendar.roll(Calendar.MONTH, 1) ; 
				packageInfoFirst.setExpirationDate(calendar.getTime());
				//System.out.println(calendar.getTime()); 
			}
		}
		if( packageInfoFirst == null) {
			packageInfoFirst = new PackageInfo() ;  
			ServicePackage package1 = getServicePackageById(1) ;  
			packageInfoFirst.setServicePackage(package1); 
			packageInfoFirst.setPurchaseDate(new Date());
			packageInfoFirst.setAccount(account);			
			Calendar calendar = Calendar.getInstance()  ;
			calendar.setTime(new Date()); 
			calendar.roll(Calendar.MONTH, 1) ; 
			packageInfoFirst.setExpirationDate(calendar.getTime());
			//System.out.println(calendar.getTime()); 
		}
		
		//System.out.println(packageInfoFirst.getServicePackage().getName()); 
		return packageInfoFirst;
	}

	
	
}
