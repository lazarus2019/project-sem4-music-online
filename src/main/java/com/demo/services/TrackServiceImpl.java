package com.demo.services;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Month;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.TimeUnit;

import org.apache.jasper.tagplugins.jstl.core.If;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.demo.entities.ServicePackage;
import com.demo.entities.Track;
import com.demo.helpers.CalculateDateTimeHelper;
import com.demo.models.TrackInfo;
import com.demo.models.TrackInfor;
import com.demo.models.WeeklyTrackModel;
import com.demo.repositories.AccountRepository;
import com.demo.repositories.PackageRepository;
import com.demo.repositories.TrackRepository;
import com.fasterxml.jackson.core.format.InputAccessor.Std;

@Service("trackService")
public class TrackServiceImpl implements TrackService {

	@Autowired
	private TrackRepository trackRepository;

	@Override
	public List<Track> getNewRelease(int statusId, int n) {
		return trackRepository.getNewRelease(statusId, n);
	}

	@Override
	public List<Track> getAllByStatus(int statusId) {
		return trackRepository.getAllByStatus(statusId);
	}

	@Override
	public List<Track> getTopAll(int n) {
		try {
			List<Track> tracks = new ArrayList<Track>();
			List<WeeklyTrackModel> weeklyTrackModels = new ArrayList<WeeklyTrackModel>();
			List<WeeklyTrackModel> topList = new ArrayList<WeeklyTrackModel>();

			// statusId = 1 -> public track
			for (Track track : trackRepository.getAllByStatus(1)) {
				WeeklyTrackModel weeklyTrackModel = new WeeklyTrackModel();
				CalculateDateTimeHelper dateTimeHelper = new CalculateDateTimeHelper();

				LocalDate currentDate = LocalDate.now();
				Date date = track.getPublishDate();
				LocalDate pastDate = Instant.ofEpochMilli(date.getTime()).atZone(ZoneId.systemDefault()).toLocalDate();
				long days = dateTimeHelper.differentOfDay(currentDate, pastDate);

				if (days < 1) {
					days = 1;
				}

				weeklyTrackModel.setTrackId(track.getId());
				weeklyTrackModel.setCountTop(track.getListens() / days);
				weeklyTrackModels.add(weeklyTrackModel);
			}

			int weeklyTrackSize = weeklyTrackModels.size();
			for (int i = 0; i < weeklyTrackSize; i++) {
				WeeklyTrackModel max = weeklyTrackModels.get(0);
				for (int j = 0; j < weeklyTrackModels.size(); j++) {
					if (weeklyTrackModels.get(j).getCountTop() > max.getCountTop()) {
						max = weeklyTrackModels.get(j);
					}
				}

				if (topList.size() < n) {
					topList.add(max);
				}

				weeklyTrackModels.remove(max);

				if (topList.size() == n) {
					break;
				}
			}

			for (WeeklyTrackModel weeklyTrack : topList) {
				Track track = trackRepository.findById(weeklyTrack.getTrackId()).get();
				tracks.add(track);
			}

			return tracks;
		} catch (Exception e) {
			System.err.println(e.getMessage());
			return null;
		}
	}

	@Override
	public void updateTopWeekly() {
		// statusId = 1 -> public track
		for (Track track : trackRepository.getAllByStatus(1)) {
			Track newTrack = new Track();
			newTrack = track;
			int countTop = track.getListens() - track.getBaseListens();
			newTrack.setWeeklyListens(countTop);
			trackRepository.save(newTrack);
		}
	}

	@Override
	public void updateBaseListens() {
		// statusId = 1 -> public track
		for (Track track : trackRepository.getAllByStatus(1)) {
			Track newTrack = new Track();
			newTrack = track;
			newTrack.setBaseListens(track.getListens());
			trackRepository.save(newTrack);
		}
	}

	@Override
	public Track save(Track track) {
		return trackRepository.save(track);
	}

	@Override
	public List<TrackInfor> findTrackByGenresId(int id) {
		return trackRepository.findTrackByGenresId(id);
	}

	@Override
	public List<TrackInfo> searchByTitle(String keyword, Pageable pageable) {
		return trackRepository.searchByTitle(keyword, pageable);
	}

	@Override
	public TrackInfo findByTrackId(int trackId) {
		return trackRepository.findByTrackId(trackId);
	}

	@Override
	public List<TrackInfo> getWaitingTrackByGenres(int id, int genresId, Pageable pageable) {
		return trackRepository.getWaitingTrackByGenres(id, genresId, pageable);
	}

	@Override
	public Track findById(int id) {
		return trackRepository.findById(id).get();
	}

	@Override
	public List<Track> getTopAllWeekly(int statusId, int n) {
		return trackRepository.getTopAllWeekly(statusId, n);
	}
	@Override
	public List<Track> getTopUsUkWeekly(int statusId, int n, int genresId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Track> getTopVnWeekly(int statusId, int n, int genresId) {
		// TODO Auto-generated method stub
		return null;
	}
}
