package com.demo.services;

import java.util.*;

import org.springframework.data.repository.query.Param;

import com.demo.entities.*;

public interface PackageService {

	public List<ServicePackage> getAllByStatus();
	
	public PackageInfo getPackageInforByAccountId(int accountId) ; 
	
	public ServicePackage getServicePackageById( int id ) ; 
	
	public PackageInfo getServicePackage( Account account ) ; 
	
}
