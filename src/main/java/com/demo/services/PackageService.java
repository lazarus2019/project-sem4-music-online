package com.demo.services;

import java.util.*;

import org.springframework.data.repository.query.Param;

import com.demo.entities.*;
import com.demo.models.PackageInfoModel;
import com.demo.models.PackageModel;

public interface PackageService {

	public List<ServicePackage> getAllByStatus();
	
	public List<ServicePackage> getAllPackage();

	public ServicePackage save(ServicePackage servicePackage);

	public void delete(int id);

	public Iterable<ServicePackage> findAll();

	public ServicePackage findById(int id);

	public PackageInfo getPackageInforByAccountId(int accountId);

	public ServicePackage getServicePackageById(int id);

	public PackageInfo getServicePackage(Account account);

	public long countPackage();
	
	public List<PackageModel> getAllPackageModel();
	
	public List<PackageInfoModel> getHistoryPackageSign(int packageId);
}
