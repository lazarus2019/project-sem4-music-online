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
import com.demo.models.PackageChartModel;
import com.demo.repositories.PackageInfoRepository;
import com.demo.repositories.PackageRepository;

@Service("packageInfoService")
public class PackageInfoServiceImpl implements PackageInfoService {

	@Autowired
	private PackageInfoRepository packageInfoRepository;

	@Autowired
	private PackageService packageService;

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

}
