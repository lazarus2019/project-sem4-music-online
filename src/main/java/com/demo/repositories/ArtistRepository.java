package com.demo.repositories;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.Account;
import com.demo.models.ArtistInfo;

@Repository("artistRepository")
public interface ArtistRepository extends PagingAndSortingRepository<Account, Integer>{
	
	@Query("SELECT new com.demo.models.ArtistInfo(id,nickname,image) FROM Account WHERE isArtist = true AND (nickname LIKE %:keyword% OR firstname LIKE %:keyword% OR lastname LIKE %:keyword%)")
	public List<ArtistInfo> searchByKeyword(@Param("keyword")String keyword, Pageable pageable);
	
	@Query("SELECT new com.demo.models.ArtistInfo(id,nickname,image) FROM Account WHERE id = :id")
	public ArtistInfo getArtistById(@Param("id")int id);
	
	@Query("SELECT new com.demo.models.ArtistInfo(id,nickname,image) FROM Account ORDER BY follower DESC")
	public List<ArtistInfo> getPopularArtists(Pageable pageable);

	@Query("SELECT new com.demo.models.ArtistInfo(id,nickname,image) FROM Account WHERE id != :id")
	public List<ArtistInfo> getArtistsWithoutId(@Param("id")int id);

	@Query("from Account where isArtist = :status")
	public List<Account> getArtistByStatus(@Param("status") boolean status) ;
	
	@Query("from Account where isArtist = false and isRequest = true")
	public List<Account> getRequestArtist() ;

}
