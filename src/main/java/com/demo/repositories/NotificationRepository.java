package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.Notification;
import com.demo.entities.ServicePackage;
import com.demo.entities.Track;

@Repository("notificationRepository")
public interface NotificationRepository extends CrudRepository<Notification, Integer> {

	@Query(value = "select * from Notification where account_id = :accountId and is_read = false order by date desc limit 5", nativeQuery = true)
	public List<Notification> getAllNewByStatus(@Param("accountId") int accountId);

	@Query(value = "select * from Notification where account_id = :accountId and is_read = true order by date desc limit :n", nativeQuery = true)
	public List<Notification> getAllReadByStatus(@Param("accountId") int accountId, @Param("n") int n);

	@Query("from Notification where account_id = :accountId")
	public List<Notification> getAllByAccountId(@Param("accountId") int accountId);
}
