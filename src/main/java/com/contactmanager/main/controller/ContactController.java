package com.contactmanager.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.contactmanager.main.model.Contact;
import com.contactmanager.main.service.ContactService;

@Controller

public class ContactController {
	
	private Logger logger = LoggerFactory.getLogger(ContactController.class);
	
	@Autowired
	private ContactService contactService;
	
	@RequestMapping("/")
	public String getIndex() {
		logger.info("Inside controller");
		return "index";
	}
	
	@RequestMapping("/contact")
	public String getContactMainPage(Model model) {
		System.out.println("Inside getContactMainPage");
		model.addAttribute("contactlist", contactService.getAllContacts());
		return "contactmain";
	}
	
	@GetMapping("/addContact")
	public String addContact() {
		System.out.println("Inside add contact");
		return "addContact";
	}
	
	@PostMapping("/addNewContact")
	public String submitContact(@RequestParam("firstName") String firstName,
								@RequestParam("lastName") String lastName,
								@RequestParam("emailId") String emailId,
								@RequestParam("contactNo") String contactNo,
								Model model) {
		Contact newContact = new Contact();
		newContact.setFirstName(firstName);
		newContact.setLastName(lastName);
		newContact.setEmailId(emailId);
		newContact.setContactNo(contactNo);
		newContact.setStatus("A");
		contactService.addNewContact(newContact);
		model.addAttribute("name", firstName + " " + lastName);
		model.addAttribute("msg", "added");
		return "success";
	}

	
	@GetMapping("/editContact")
	public String editContact(@RequestParam("id") Integer id , Model model) {
		Contact contact = contactService.getContactDetailsById(id); 
		model.addAttribute("contact", contact);
		System.out.println("Inside edit contact :-" + id);
		return "editContact";
	}
	
	@PostMapping("/updateContactDetail")
	public String updateContactDetail(@ModelAttribute("contact") Contact contact, Model model) {
		System.out.println("Emal Id :- " + contact.getEmailId());
		model.addAttribute("msg", "Update");
		model.addAttribute("name", contact.getFirstName() + " " + contact.getLastName());
		contactService.updateContact(contact);
		return "success";
	}
	
	@GetMapping("/deleteContact")
	public String deleteContact(@RequestParam("id") Integer id, Model model) {
		System.out.println("Delete Contact Details");
		contactService.deleteContact(id);
		model.addAttribute("msg", "Delete");
		return "success";
	}
	
	@GetMapping("/updateStatus")
	public String updateStatus(@RequestParam("id") Integer id, @RequestParam("status") String status, Model  model) {
		String msg = "Deactivated";
		String tmpStatus = "I";
		if(status.equalsIgnoreCase("I")) {
			System.out.println("Inside Activated");
			tmpStatus = "A";
			msg = "Activated";
		}
		contactService.updateStatus(id, tmpStatus);
		model.addAttribute("msg", msg);
		return "redirect:/contact";
	}
	
	
	

	
}
