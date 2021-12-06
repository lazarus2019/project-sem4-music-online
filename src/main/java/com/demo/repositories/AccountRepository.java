package com.demo.repositories;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.Account;
import com.demo.entities.ServicePackage;
import com.demo.models.ArtistInfo;
import com.demo.models.ArtistsInfor;

@Repository("accountRepository")
public interface AccountRepository extends PagingAndSortingRepository<Account, Integer> {

	@Query(value = "select * from Account where is_artist = true order by follower desc limit :n", nativeQuery = true)
	public List<Account> getAllPopularArtists(@Param("n") int n);

	@Query("from Account where username = :username")
	public Account findByUsername(@Param("username") String username);

	@Query("from Account where email = :email")
	public Account findByEmail(@Param("email") String email);

	@Query("select new com.demo.models.ArtistsInfor(id, nickname, image, follower) from Account where isArtist = true ")
	public List<ArtistsInfor> getallArtists();

	@Query("SELECT new com.demo.models.ArtistInfo(id,nickname,image) FROM Account WHERE isArtist = true AND (nickname LIKE %:keyword% OR firstname LIKE %:keyword% OR lastname LIKE %:keyword%)")
	public List<ArtistInfo> searchByKeyword(@Param("keyword") String keyword, Pageable pageable);

	@Query("SELECT new com.demo.models.ArtistInfo(id,nickname,image) FROM Account ORDER BY follower DESC")
	public List<ArtistInfo> getPopularArtists(Pageable pageable);

	@Query("SELECT new com.demo.models.ArtistInfo(id,nickname,image) FROM Account WHERE id != :id")
	public List<ArtistInfo> getArtistsWithoutId(@Param("id") int id);

	@Query("SELECT new com.demo.models.ArtistInfo(id,nickname,image) FROM Account WHERE id = :id")
	public ArtistInfo getArtistById(@Param("id") int id);

	@Query("select new com.demo.models.ArtistsInfor(id, nickname, image, follower) from Account where nickname like %:keyword% and isArtist = true ")
	public List<ArtistsInfor> getSearchArtis(@Param("keyword") String keyword);

	@Query("from Account where username = :username")
	public Account find(@Param("username") String username);

	@Query("select count(id) from Account where isArtist = true")
	public long countArtist();
}