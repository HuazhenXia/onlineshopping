package edu.mum.onlineshoping.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;


import edu.mum.onlineshoping.model.Customer;
import edu.mum.onlineshoping.model.Product;
import edu.mum.onlineshoping.model.Vendor;
import edu.mum.onlineshoping.service.SMTPService;

@Service
public class SMTPServiceImp implements SMTPService{

	@Autowired
	private JavaMailSender mailSender;
	
	@Override
	public void sendMailToVendor(Vendor vendor) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("huazhenxia@gmail.com");
		message.setTo(vendor.getEmail());
		message.setSubject("Vendor Registration confirm");
		message.setText("Dear "+ vendor.getfName() + " \nYou have successfully registered!");

		mailSender.send(message);
		
	}

	@Override
	public void sendMailToCustomer(Customer customer){
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("huazhenxia@gmail.com");
		message.setTo(customer.getEmail());
		message.setSubject("Registration confirm");
		message.setText("Dear "+ customer.getfName() + " \nYou have successfully registered!");
		
		mailSender.send(message);
		
	}

	@Override
	public void sendOrderMail(Customer customer,  Product product) {
		SimpleMailMessage messageToCustomer = new SimpleMailMessage();
		messageToCustomer.setFrom("huazhenxia@gmail.com");
		messageToCustomer.setTo(customer.getEmail());
		messageToCustomer.setSubject("bought confirmation");
		messageToCustomer.setText("Dear "+ customer.getfName() + " \nYou have successfully bought "+
				product.getName());

		mailSender.send(messageToCustomer);
		
		SimpleMailMessage messageToVendor = new SimpleMailMessage();
		messageToVendor.setFrom("huazhenxia@gmail.com");
		messageToVendor.setTo(product.getVendor().getEmail());
		messageToVendor.setSubject("sales confirmation");
		messageToVendor.setText("Dear "+ product.getVendor().getfName() + " \n" +
				customer.getfName() +"bought your" + product.getName());

		mailSender.send(messageToVendor);
		
	}

}
