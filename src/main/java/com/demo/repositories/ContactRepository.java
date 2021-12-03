package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.Contact;
import com.demo.entities.ContactType;
import com.demo.entities.Playlist;
import com.demo.entities.ServicePackage;
import com.demo.entities.Track;
import com.demo.models.AlbumInfo;
import com.demo.models.TrackInfo;

@Repository("contactRepository")
public interface ContactRepository extends CrudRepository<Contact, Integer> {

//	@Query("SELECT COUNT(id) FROM Contact WHERE isRead = false")
//	public int getAmountUnreadContact();
//
//	@Query("SELECT new com.demo.entities.ContactInfo(id,) FROM Contact")
//	public List<Contact> findAllContact();
//
//	@Query("SELECT * FROM ContactType")
//	public List<ContactType> findAllContactType();
//
//	@Query("SELECT * FROM Contact WHERE contact_type_id = :type")
//	public List<Contact> findContactByType(@Param("type") int mail_type);
//
//	@Query("SELECT * FROM Contact WHERE fullname LIKE %:keyword% OR email LIKE %:keyword% OR phone_number LIKE %:keyword%")
//	public List<Contact> findContactByKeyword(@Param("keyword") String keyword);
//
//	@Query("SELECT * FROM Contact WHERE contact_type_id = :type AND fullname LIKE %:keyword% OR email LIKE %:keyword% OR phone_number LIKE %:keyword%")
//	public List<Contact> filterContact(@Param("keyword") String keyword, @Param("type") int mail_type);
}
