package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import com.demo.entities.Account;
import com.demo.entities.PackageInfo;

public interface PackageInfoRepository extends CrudRepository<PackageInfo, Integer> {

	@Query("SELECT account FROM PackageInfo WHERE package_id = :id")
	public List<Account> getAccountsSignPackageById(@Param("id") int packageId);

	@Query(value = "SELECT * FROM package_info WHERE package_id = :id", nativeQuery = true)
	public List<PackageInfo> getPackageInfosById(@Param("id") int packageId);

	@Query("select count(id) from PackageInfo where package_id = :packageId and month(purchase_date) = :month")
	public int countByPackageId(@Param("packageId") int packageId, @Param("month") int month);

	@Query("select count(id) from PackageInfo where month(purchase_date) = :month")
	public int countAll(@Param("month") int month);

	@Query("select sum(price) from PackageInfo where year(purchase_date) = :year and month(purchase_date) = :month")
	public double totalPrice(@Param("year") int year, @Param("month") int month);
}