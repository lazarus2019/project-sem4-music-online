package com.demo.services;

import java.util.*;

import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;

import com.demo.entities.*;
import com.demo.models.TrackInfo;
import com.demo.models.TrackInfor;

public interface TrackService {

	public Track save(Track track);

	public Track find(int id);

	public void delete(int id);

	public List<Track> findAll();

	public List<Track> getNewRelease(int statusId, int n);

	public List<Track> getAllByStatus(int statusId);

	public void updateTopWeekly();

	public void updateBaseListens();

	public List<Track> getTopAllWeekly(int statusId, int n);

	public List<Track> getTopUsUkWeekly(int statusId, int n, int genresId);

	public List<Track> getTopVnWeekly(int statusId, int n, int genresId);

	public List<Track> getTopAll(int n);

	public List<TrackInfor> findTrackByGenresId(int id);

	public List<TrackInfo> searchByTitle(String keyword, Pageable pageable);

	public TrackInfo findByTrackId(int trackId);

	public List<TrackInfo> getWaitingTrackByGenres(int id, int genresId, Pageable pageable);
}
