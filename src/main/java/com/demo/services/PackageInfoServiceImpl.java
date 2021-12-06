package com.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Account;
import com.demo.entities.PackageInfo;
import com.demo.repositories.PackageInfoRepository;
@Service("packageInfoService")
public class PackageInfoServiceImpl implements PackageInfoService{
	
	@Autowired
	private PackageInfoRepository packageInfoRepository;

	@Override
	public List<Account> getAccountsSignPackageById(int packageId) {
		return packageInfoRepository.getAccountsSignPackageById(packageId);
	}

	@Override
	public int getAmountAccountSignPackageById(int packageId) {
		List<Account> accounts = packageInfoRepository.getAccountsSignPackageById(packageId);
		return accounts.size();
	}

	@Override
	public List<PackageInfo> getPackageInfosById(int packageId) {
		return packageInfoRepository.getPackageInfosById(packageId);
	}

	@Override
	public Iterable<PackageInfo> findAll() {
		return packageInfoRepository.findAll();
	}
	
	

}
