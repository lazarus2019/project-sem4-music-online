package com.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Account;
import com.demo.entities.ServicePackage;
import com.demo.repositories.AccountRepository;
import com.demo.repositories.PackageRepository;

@Service("accountService")
public class AccountServiceImpl implements AccountService {

	@Autowired
	private AccountRepository accountRepository;

	@Override
	public List<Account> getAllPopularArtists() {
		return accountRepository.getAllPopularArtists();
	}
	

	
	
}
