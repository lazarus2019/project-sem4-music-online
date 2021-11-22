package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.demo.entities.Account;
import com.demo.entities.ServicePackage;

@Repository("accountRepository")
public interface AccountRepository extends CrudRepository<Account, Integer> {

	@Query(value = "select * from Account where isArtist = true and status = true order by follower desc limit 10", nativeQuery = true) 
	  public List<Account> getAllPopularArtists();
	
}
