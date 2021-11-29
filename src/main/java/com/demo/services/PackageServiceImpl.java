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

	
	
}
