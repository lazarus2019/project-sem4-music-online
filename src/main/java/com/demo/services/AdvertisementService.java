package com.demo.services;

import com.demo.entities.Advertisement;

public interface AdvertisementService {
	public Advertisement findById(int id);
	public Iterable<Advertisement> findAll();
	public Advertisement save(Advertisement advertisement);
	public void delete(int id);
	public Advertisement findActiveAds();
}
