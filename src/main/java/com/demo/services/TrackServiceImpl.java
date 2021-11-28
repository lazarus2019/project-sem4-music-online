package com.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.demo.entities.Track;
import com.demo.models.TrackInfo;
import com.demo.repositories.TrackRepository;

@Service("trackService")
public class TrackServiceImpl implements TrackService {

	@Autowired
	private TrackRepository trackRepository;
	
	@Override
	public List<Track> getAllNewRelease() {
		return trackRepository.getAllNewRelease();
	}

	@Override
	public List<TrackInfo> searchByTitle(String keyword, Pageable pageable) {
		return trackRepository.searchByTitle(keyword, pageable);
	}

	@Override
	public TrackInfo findById(int trackId) {
		return trackRepository.findById(trackId);
	}

	@Override
	public List<TrackInfo> getWaitingTrackByGenres(int id, int genresId, Pageable pageable) {
		return trackRepository.getWaitingTrackByGenres(id, genresId, pageable);
	}

	
	
}
