package com.demo.services;

import java.util.*;

import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;

import com.demo.entities.*;
import com.demo.models.TrackInfo;
import com.demo.models.TrackInfor;

public interface TrackService {

	public Track save(Track track);
	
	public Track findById(int id);

	public void delete(int id);

	public List<Track> findAll();

	public List<Track> getNewRelease(int statusId, int n);

	public List<Track> getAllByStatus(int statusId);

	public List<TrackInfo> getTopAllWeekly(int statusId, int n);

	public List<TrackInfo> getTopUsUkWeekly(int statusId, int n);

	public List<TrackInfo> getTopVnWeekly(int statusId, int n);

	public List<Track> getTopAll(int n);

	public List<TrackInfor> findTrackByGenresId(int id);

	public List<TrackInfo> searchByTitle(String keyword, Pageable pageable);

	public TrackInfo findByTrackId(int trackId);

	public List<TrackInfo> getWaitingTrackByGenres(int id, int genresId, Pageable pageable);
	
	public boolean updateWeeklyListens();

	public void updateBaseListens();
	
	public long countTrack();
	
	public List<Track> getBestTrack(int n);

}

