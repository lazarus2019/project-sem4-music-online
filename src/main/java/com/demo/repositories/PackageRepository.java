package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.demo.entities.ServicePackage;

@Repository("packageRepository")
public interface PackageRepository extends CrudRepository<ServicePackage, Integer> {

	@Query("from ServicePackage where status = true")
	public List<ServicePackage> getAllByStatus();
	
}
