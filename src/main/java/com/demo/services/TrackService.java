package com.demo.services;

import java.util.*;

import org.springframework.data.domain.Pageable;

import com.demo.entities.*;
import com.demo.models.TrackInfo;

public interface TrackService {

	public List<Track> getAllNewRelease();
	
	public List<TrackInfo> searchByTitle(String keyword, Pageable pageable);
	
	public TrackInfo findById(int trackId);
	
	public List<TrackInfo> getWaitingTrackByGenres(int id, int genresId, Pageable pageable);
	
}
