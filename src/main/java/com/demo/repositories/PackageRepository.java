package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.PackageInfo;
import com.demo.entities.ServicePackage;

@Repository("packageRepository")
public interface PackageRepository extends CrudRepository<ServicePackage, Integer> {

	@Query("from ServicePackage where status = true AND is_delete = FALSE")
	public List<ServicePackage> getAllByStatus();
	
	@Query( value = "select * from package_info where account_id = :accountId order by expiration_date desc limit 1", nativeQuery = true)
	public PackageInfo getPackageInforByAccountId(@Param("accountId") int accountId ) ; 
	
	@Query("from ServicePackage where is_delete = false and id = :id ") 
	public ServicePackage getServicePackageById(@Param("id") int id ) ; 

	@Query("select count(id) from ServicePackage where is_delete = false")
	public long countPackage();

	@Query("from ServicePackage where is_delete = FALSE")
	public List<ServicePackage> getAllPackage();
}
