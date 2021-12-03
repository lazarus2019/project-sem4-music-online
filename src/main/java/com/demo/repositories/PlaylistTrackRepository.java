package com.demo.repositories;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.Playlist;
import com.demo.entities.PlaylistCategory;
import com.demo.entities.PlaylistTrack;
import com.demo.entities.PlaylistTrackId;
import com.demo.entities.ServicePackage;

@Repository("playlistTrackRepository")
public interface PlaylistTrackRepository extends CrudRepository<PlaylistTrack, PlaylistTrackId> {


}
