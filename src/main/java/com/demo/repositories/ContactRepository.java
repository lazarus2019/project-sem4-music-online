package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.Contact;
import com.demo.models.ContactInfo;

@Repository("contactRepository")
public interface ContactRepository extends CrudRepository<Contact, Integer> {

	@Query("SELECT COUNT(id) FROM Contact WHERE is_read = false")
	public int getAmountUnreadContact();

	@Query(value = "FROM Contact WHERE is_read = false LIMIT 5", nativeQuery = true)
	public List<Contact> getTopUnreadContact();
	
	@Query("SELECT new com.demo.models.ContactInfo(id, fullname, email, phoneNumber, content) FROM Contact WHERE id = :id")
	public ContactInfo findContactInfoById(@Param("id") int contactId);
}
