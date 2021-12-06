package com.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Account;
import com.demo.entities.PackageInfo;
import com.demo.models.PackageChartModel;
import com.demo.repositories.PackageInfoRepository;
@Service("packageInfoService")
public class PackageInfoServiceImpl implements PackageInfoService{
	
	@Autowired
	private PackageInfoRepository packageInfoRepository;

	@Override
	public List<PackageInfo> findAll() {
		return (List<PackageInfo>) packageInfoRepository.findAll();
	}

	@Override
	public List<PackageChartModel> getPackageChart() {
		return null;
	}

	@Override
	public List<PackageInfo> countByPackageId(int packageId) {
		return packageInfoRepository.countByPackageId(packageId);
	}

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

}
