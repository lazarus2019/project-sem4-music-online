package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.Account;
import com.demo.models.ArtistInfo;

@Repository("artistRepository")
public interface ArtistRepository extends CrudRepository<Account, Integer>{
	@Query("SELECT new com.demo.models.ArtistInfo(id,nickname, image) FROM Account WHERE isArtist = true AND nickname LIKE %:keyword% OR firstname LIKE %:keyword% OR lastname LIKE %:keyword% ORDER BY id DESC LIMIT :n", nativeQuery = true)
	public List<ArtistInfo> searchByKeyword(@Param("keyword")String keyword, @Param("n") int n);
}
