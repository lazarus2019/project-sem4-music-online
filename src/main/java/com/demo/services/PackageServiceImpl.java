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
import com.demo.models.PackageInfoModel;
import com.demo.models.PackageModel;
import com.demo.repositories.PackageRepository;

@Service("packageService")
public class PackageServiceImpl implements PackageService {

	@Autowired
	private PackageRepository packageRepository;
	
	@Autowired
	private PackageInfoService packageInfoService;
	
	@Override
	public List<ServicePackage> getAllByStatus() {
		return packageRepository.getAllByStatus();
	}

	@Override
	public ServicePackage save(ServicePackage servicePackage) {
		return packageRepository.save(servicePackage);
	}

	@Override
	public void delete(int id) {
		try {
			packageRepository.deleteById(id);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}

	@Override
	public Iterable<ServicePackage> findAll() {
		return packageRepository.findAll();
	}

	@Override
	public ServicePackage findById(int id) {
		return packageRepository.findById(id).get();

	}
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

	@Override
	public List<PackageModel> getAllPackageModel() {
		List<PackageModel> result = new ArrayList<PackageModel>();
		List<ServicePackage> servicePackages = getAllPackage();
		for(ServicePackage servicePackage : servicePackages) {
			PackageModel packageModel = new PackageModel();
			packageModel.setId(servicePackage.getId());
			packageModel.setName(servicePackage.getName());
			packageModel.setPrice(servicePackage.getPrice());
			packageModel.setDuration(servicePackage.getDuration());
			packageModel.setStatus(servicePackage.isStatus());
			packageModel.setDescription(servicePackage.getDescription());
			packageModel.setDelete(servicePackage.isIsDelete());
			packageModel.setAmountAccount(packageInfoService.getAmountAccountSignPackageById(servicePackage.getId()));
			
			result.add(packageModel);
		}
		return result;
	}

	@Override
	public List<ServicePackage> getAllPackage() {
		return packageRepository.getAllPackage();
	}

	@Override
	public List<PackageInfoModel> getHistoryPackageSign(int packageId) {
		List<PackageInfoModel> result = new ArrayList<PackageInfoModel>();
		List<PackageInfo> packageInfos = packageInfoService.getPackageInfosById(packageId);
		for(PackageInfo packageInfo : packageInfos) {
			PackageInfoModel packageInfoModel = new PackageInfoModel();
			packageInfoModel.setPackage_id(packageId);
			packageInfoModel.setAccount_id(packageInfo.getAccount().getId());
			packageInfoModel.setAccount_nickname(packageInfo.getAccount().getNickname());
			packageInfoModel.setExpiration_date(packageInfo.getExpirationDate());
			packageInfoModel.setPurchase_date(packageInfo.getPurchaseDate());
			packageInfoModel.setPrice(packageInfo.getServicePackage().getPrice());
			
			result.add(packageInfoModel);
		}
		
		return result;
	}

	
	
}
