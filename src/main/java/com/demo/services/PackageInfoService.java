package com.demo.services;

import java.util.Date;
import java.util.List;

import com.demo.entities.Account;
import com.demo.entities.PackageInfo;
import com.demo.models.PackageChartModel;

public interface PackageInfoService {
	public List<Account> getAccountsSignPackageById(int packageId);

	public int getAmountAccountSignPackageById(int packageId);

	public List<PackageInfo> getPackageInfosById(int packageId);

	public Iterable<PackageInfo> findAll();

	public PackageInfo save(PackageInfo packageInfo);

	public List<PackageChartModel> getPackageChart();

	public List<Double> getTotalPricePerMonth();

	public List<PackageInfo> countByPackageId(int packageId);
	
	public boolean checkPremiumByAccountId(int accountId);
	
	public PackageInfo checkPackage(int accountId);
}
