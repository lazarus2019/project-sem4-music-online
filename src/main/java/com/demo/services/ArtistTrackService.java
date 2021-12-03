package com.demo.services;

import java.util.List;

import com.demo.entities.Account;
import com.demo.models.ArtistInfo;

public interface ArtistTrackService {
	public List<ArtistInfo> getAccountByTrackId(int id);
}
