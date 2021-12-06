package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.PackageInfo;
import com.demo.entities.PackageInfoId;
import com.demo.entities.ServicePackage;

@Repository("packageInfoRepository")
public interface PackageInfoRepository extends CrudRepository<PackageInfo, PackageInfoId> {

	@Query(value = "select count(servicePackage.id) PackageInfo where packageId = :packageId", nativeQuery = true)
	public List<PackageInfo> countByPackageId(@Param("packageId") int packageId);
	
}
