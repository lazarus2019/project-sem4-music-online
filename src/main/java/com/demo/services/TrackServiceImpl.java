package com.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.ServicePackage;
import com.demo.entities.Track;
import com.demo.repositories.AccountRepository;
import com.demo.repositories.PackageRepository;
import com.demo.repositories.TrackRepository;

@Service("trackService")
public class TrackServiceImpl implements TrackService {

	@Autowired
	private TrackRepository trackRepository;

	@Override
	public List<Track> getAllNewRelease() {
		return trackRepository.getAllNewRelease();
	}

	
	
}
