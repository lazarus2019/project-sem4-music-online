package com.demo.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.Account;
import com.demo.entities.SignIn;

@Repository("signInRepository")
public interface SignInRepository extends CrudRepository<SignIn, Integer>  {

	@Query("from SignIn where username = :username")
	public SignIn find(@Param("username") String username);
	
	@Query("from SignIn where email = :email")
	public SignIn findByEmail(@Param("email") String email);
	
	
}
