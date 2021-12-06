package com.demo.services;

import java.util.List;

import com.demo.entities.Account;
import com.demo.entities.PackageInfo;

public interface PackageInfoService {
	public List<Account> getAccountsSignPackageById(int packageId);
	
	public int getAmountAccountSignPackageById(int packageId);		
	
	public List<PackageInfo> getPackageInfosById(int packageId);
	
	public Iterable<PackageInfo> findAll();
}
