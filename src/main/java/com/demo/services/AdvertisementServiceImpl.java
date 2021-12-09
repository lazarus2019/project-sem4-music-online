package com.demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Advertisement;
import com.demo.repositories.AdvertisementRepository;
@Service("advertisementService")
public class AdvertisementServiceImpl implements AdvertisementService{
	
	@Autowired
	private AdvertisementRepository advertisementRepository;

	@Override
	public Advertisement findById(int id) {
		return advertisementRepository.findById(id).get();
	}

	@Override
	public Iterable<Advertisement> findAll() {
		return advertisementRepository.findAll();
	}

	@Override
	public Advertisement save(Advertisement advertisement) {
		return advertisementRepository.save(advertisement);
	}

	@Override
	public void delete(int id) {
		try {
			advertisementRepository.deleteById(id);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
	}

	@Override
	public Advertisement findActiveAds() {
		return advertisementRepository.findActiveAds();
	}

}
