package com.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	
	
}
