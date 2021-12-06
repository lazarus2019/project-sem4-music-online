package com.demo.services;

import java.util.*;

import org.springframework.data.repository.query.Param;

import com.demo.entities.*;
import com.demo.models.PackageChartModel;

public interface PackageInfoService {

	public List<PackageInfo> findAll();
	
	public List<PackageChartModel> getPackageChart(); 

	public List<PackageInfo> countByPackageId(int packageId);
}
