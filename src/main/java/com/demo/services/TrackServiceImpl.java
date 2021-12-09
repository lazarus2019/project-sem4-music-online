package com.demo.services;

import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.demo.entities.Account;
import com.demo.entities.ArtistTrack;
import com.demo.entities.Status;
import com.demo.entities.Track;
import com.demo.helpers.CalculateDateTimeHelper;
import com.demo.models.ArtistInfo;
import com.demo.models.TrackInfo;
import com.demo.models.TrackInfor;
import com.demo.models.WeeklyTrackModel;
import com.demo.repositories.AccountRepository;
import com.demo.repositories.TrackRepository;

@Service("trackService")
public class TrackServiceImpl implements TrackService {

	@Autowired
	private TrackRepository trackRepository;

	@Autowired
	private AccountRepository accountRepository;

	@Autowired
	private ArtistTrackService artistTrackService;

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
	public List<TrackInfo> getTopAllWeekly(int statusId, int n) {
		List<TrackInfo> trackInfos = new ArrayList<TrackInfo>();
		for (Track track : trackRepository.getTopAllWeekly(statusId, n)) {
			TrackInfo trackInfo = new TrackInfo();
			trackInfo.setId(track.getId());
			trackInfo.setTitle(track.getTitle());
			trackInfo.setThumbnail(track.getThumbnail());
			trackInfo.setDuration(track.getDuration());
			trackInfo.setPremium(track.isIsPremium());
			trackInfo.setArtistLength(track.getArtistTracks().size());
			List<Account> accounts = new ArrayList<Account>();
			for (Account account : track.findAccountThroughAtristTrack()) {
				accounts.add(account);
			}
			trackInfo.setAccounts(accounts);
			trackInfos.add(trackInfo);
		}
		return trackInfos;
	}

	@Override
	public List<TrackInfo> getTopUsUkWeekly(int statusId, int n) {
		List<Track> findAll = (List<Track>) trackRepository.findAll();
		int totalTrack = findAll.size();
		List<TrackInfo> topAllWeekly = getTopAllWeekly(1, totalTrack);
		List<TrackInfo> trackInfos = new ArrayList<TrackInfo>();
		for (TrackInfo trackInfo : topAllWeekly) {
			Account ownerTrack = null;
			for (Account account : trackInfo.getAccounts()) {
				for (ArtistTrack artistTrack : account.getArtistTracks()) {
					if (artistTrack.isIsOwn() == true) {
						ownerTrack = accountRepository.findById(artistTrack.getAccount().getId()).get();
					}
				}
			}
			if (ownerTrack != null && ownerTrack.getCountry().getCountryCode().equalsIgnoreCase("US")) {
				trackInfos.add(trackInfo);
			}
		}
		List<TrackInfo> topUsUktracks = new ArrayList<>();
		for (TrackInfo trackInfo : trackInfos) {
			if (topUsUktracks.size() < n) {
				topUsUktracks.add(trackInfo);
			} else {
				break;
			}
		}
		return topUsUktracks;
	}

	@Override
	public List<TrackInfo> getTopVnWeekly(int statusId, int n) {
		List<Track> findAll = (List<Track>) trackRepository.findAll();
		int totalTrack = findAll.size();
		List<TrackInfo> topAllWeekly = getTopAllWeekly(1, totalTrack);
		List<TrackInfo> trackInfos = new ArrayList<TrackInfo>();
		for (TrackInfo trackInfo : topAllWeekly) {
			Account ownerTrack = null;
			for (Account account : trackInfo.getAccounts()) {
				for (ArtistTrack artistTrack : account.getArtistTracks()) {
					if (artistTrack.isIsOwn() == true) {
						ownerTrack = accountRepository.findById(artistTrack.getAccount().getId()).get();
					}
				}
			}
			if (ownerTrack != null && ownerTrack.getCountry().getCountryCode().equalsIgnoreCase("VN")) {
				trackInfos.add(trackInfo);
			}
		}
		List<TrackInfo> topUsUktracks = new ArrayList<>();
		for (TrackInfo trackInfo : trackInfos) {
			if (topUsUktracks.size() < n) {
				topUsUktracks.add(trackInfo);
			} else {
				break;
			}
		}
		return topUsUktracks;
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
		TrackInfo trackInfo = trackRepository.findByTrackId(trackId);
		Track track = findById(trackId);
		List<ArtistInfo> artistInfos = new ArrayList<ArtistInfo>();
		for(ArtistTrack artistTrack: track.getArtistTracks()) {
			if(artistTrack.isIsOwn()) {
				ArtistInfo artistInfo = new ArtistInfo();
				artistInfo.setId(artistTrack.getAccount().getId());
				artistInfo.setNickname(artistTrack.getAccount().getNickname());
				artistInfos.add(artistInfo);				
			}
		}
		for(ArtistTrack artistTrack: track.getArtistTracks()) {
			if(!artistTrack.isIsOwn()) {
				ArtistInfo artistInfo = new ArtistInfo();
				artistInfo.setId(artistTrack.getAccount().getId());
				artistInfo.setNickname(artistTrack.getAccount().getNickname());
				artistInfos.add(artistInfo);				
			}
		}
		trackInfo.setArtists(artistInfos);
		return trackInfo;
	}

	@Override
	public List<TrackInfo> getWaitingTrackByGenres(int id, int genresId, Pageable pageable) {
		return trackRepository.getWaitingTrackByGenres(id, genresId, pageable);
	}

	@Override
	public List<Track> findAll() {
		return (List<Track>) trackRepository.findAll();
	}

	@Override
	public Track findById(int id) {
		return trackRepository.findById(id).get();
	}

	@Override
	public boolean updateWeeklyListens() {
		try {
			for (Track track : trackRepository.findAll()) {
				Track newTrack = new Track();
				newTrack = track;
				int countListen = track.getListens() - track.getBaseListens();
				newTrack.setWeeklyListens(countListen);
				trackRepository.save(newTrack);
			}
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public void updateBaseListens() {
		for (Track track : trackRepository.findAll()) {
			Track newTrack = new Track();
			newTrack = track;
			newTrack.setBaseListens(track.getListens());
			trackRepository.save(newTrack);
		}
	}

	@Override
	public void delete(int id) {
		try {
			Track track = findById(id);
			trackRepository.delete(track);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	@Override
	public long countTrack() {
		return trackRepository.count();
	}

	@Override
	public List<Track> getBestTrack(int n) {
		return trackRepository.getBestTrack(n);
	}

	public List<TrackInfo> searchTrackInManage(String option, String keyword, int artistId) {
		List<TrackInfo> result = new ArrayList<TrackInfo>();
		List<Track> tracks = artistTrackService.getTracksOfArtist(artistId);
		int optionInt = 0;
		if (option != "") {
			optionInt = Integer.parseInt(option);
		}

		for (Track track : tracks) {
			if (optionInt != 0) {
				if (track.getTitle().toLowerCase().contains(keyword) && track.getStatus().getId() == optionInt) {
					TrackInfo trackInfo = setTrackToTrackInfo(track);
					result.add(trackInfo);
				}
			} else {
				if (track.getTitle().toLowerCase().contains(keyword)) {
					TrackInfo trackInfo = setTrackToTrackInfo(track);
					result.add(trackInfo);
				}
			}
		}

		return result;
	}

	public TrackInfo setTrackToTrackInfo(Track track) {
		TrackInfo trackInfo = new TrackInfo();
		trackInfo.setId(track.getId());
		trackInfo.setTitle(track.getTitle());
		trackInfo.setThumbnail(track.getThumbnail());
		trackInfo.setGenresId(track.getGenres().getId());
		trackInfo.setStatusId(track.getStatus().getId());
		trackInfo.setLikes(track.getLikes());
		trackInfo.setListens(track.getListens());
		trackInfo.setPremium(track.isIsPremium());
		return trackInfo;

	}

	@Override
	public List<TrackInfor> getAll() {
		return trackRepository.getAll();
	}

	public boolean publishTrack() {
		try {
			Status status = new Status();
			status.setId(1);
			for (Track track : trackRepository.findAll()) {
				Track newTrack = new Track();
				newTrack = track;
				Date beforeTwoDays = new Date(new Date().getTime() + (2 * 1000 * 60 * 60 * 24));
				if(newTrack.getStatus().getId() == 2 && newTrack.getPublishDate().before(beforeTwoDays)) {
					newTrack.setStatus(status);
					trackRepository.save(newTrack);					
				}
			}
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public List<TrackInfo> searchByTitle(String keyword) {
		return trackRepository.searchByTitle(keyword);
	}
}
