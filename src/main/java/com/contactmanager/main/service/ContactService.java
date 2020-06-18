package com.contactmanager.main.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.contactmanager.main.model.Contact;

@Service
public interface ContactService {
	public List<Contact> getAllContacts();
	
	public void addNewContact(Contact newContact);
	
	public Contact getContactDetailsById(Integer id);
	
	public void updateContact(Contact contact);
	
	public void deleteContact(Integer id);
	
	public void updateStatus(Integer id, String status);
	
}
