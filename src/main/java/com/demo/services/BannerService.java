package com.demo.services;

import java.util.List;

import com.demo.entities.Aboutus;
import com.demo.entities.Banner;

public interface BannerService {

	public List<Banner> findAll();
	
	public Banner save(Banner banner);
	
	public Banner findById(int id);
	
	public List<Banner> getByStatus();
	
	public void delete(int id);
	
}
