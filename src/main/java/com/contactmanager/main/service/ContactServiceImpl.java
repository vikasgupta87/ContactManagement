package com.contactmanager.main.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.contactmanager.main.model.Contact;
import com.contactmanager.main.repository.ContactRepository;

@Service
public class ContactServiceImpl implements ContactService {

	@Autowired
	private ContactRepository contactRepository;
	
	@Override
	public List<Contact> getAllContacts() {
		return contactRepository.findAll();
	}

	@Override
	public void addNewContact(Contact newContact) {
		contactRepository.save(newContact);
	}

	@Override
	public Contact getContactDetailsById(Integer id) {
		Optional<Contact> optional = contactRepository.findById(id);
		if (optional.isPresent()) {
			return optional.get();
		}
		return null;
	}

	@Override
	public void updateContact(Contact contact) {
		contactRepository.updateContactById(contact.getEmailId(), contact.getContactNo(), contact.getStatus(), contact.getId());
	}

	@Override
	public void deleteContact(Integer id) {
		contactRepository.deleteById(id);
	}

	@Override
	public void updateStatus(Integer id, String status) {
		contactRepository.updateStatusById(status, id);
	}
	
	

}
