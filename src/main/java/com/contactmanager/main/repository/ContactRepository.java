package com.contactmanager.main.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.contactmanager.main.model.Contact;

@Repository
public interface ContactRepository extends JpaRepository<Contact, Integer> {

	@Transactional
	@Modifying
	@Query("update Contact c  set c.emailId = :emailId , c.contactNo = :contactNo , c.status = :status where c.id = :id")
	void updateContactById(@Param("emailId") String emailId, @Param("contactNo") String contactNo,
			@Param("status") String status, @Param("id") Integer id);
	
	
	@Transactional
	@Modifying
	@Query("update Contact c  set c.status = :status where c.id = :id")
	void updateStatusById(@Param("status") String status, @Param("id") Integer id);
}
