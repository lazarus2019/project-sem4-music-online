package com.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Aboutus;
import com.demo.entities.Banner;
import com.demo.repositories.AboutUsRepositories;
import com.demo.repositories.BannerRepository;

@Service("bannerService")
public class BannerServiceImpl implements BannerService {

	@Autowired
	private BannerRepository bannerRepository;

	@Override
	public List<Banner> findAll() {
		return (List<Banner>) bannerRepository.findAll();
	}

	@Override
	public Banner save(Banner banner) {
		return bannerRepository.save(banner);
	}

	@Override
	public Banner findById(int id) {
		return bannerRepository.findById(id).get();
	}

	@Override
	public List<Banner> getByStatus() {
		return bannerRepository.getByStatus();
	}

	@Override
	public void delete(int id) {
		bannerRepository.deleteById(id);
	}
	

}
