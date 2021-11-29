package com.demo.repositories;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.Playlist;
import com.demo.entities.PlaylistCategory;
import com.demo.entities.ServicePackage;

@Repository("playlistCategoryRepository")
public interface PlaylistCategoryRepository extends CrudRepository<PlaylistCategory, Integer> {


}
