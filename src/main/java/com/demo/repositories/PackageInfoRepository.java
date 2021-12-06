package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import com.demo.entities.Account;
import com.demo.entities.PackageInfo;
import com.demo.entities.PackageInfoId;

public interface PackageInfoRepository extends CrudRepository<PackageInfo, PackageInfoId>{

	@Query("SELECT account FROM PackageInfo WHERE package_id = :id")
	public List<Account> getAccountsSignPackageById(@Param("id") int packageId);
	
	@Query(value = "SELECT * FROM package_info WHERE package_id = :id", nativeQuery = true)
	public List<PackageInfo> getPackageInfosById(@Param("id") int packageId);
	
	@Query(value = "select count(servicePackage.id) PackageInfo where packageId = :packageId", nativeQuery = true)
	public List<PackageInfo> countByPackageId(@Param("packageId") int packageId);
}
