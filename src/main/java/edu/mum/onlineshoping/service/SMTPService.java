package edu.mum.onlineshoping.service;

import java.util.List;

import edu.mum.onlineshoping.model.Customer;
import edu.mum.onlineshoping.model.Product;
import edu.mum.onlineshoping.model.Vendor;


public interface SMTPService {
	void sendMailToVendor(Vendor vendor);
	void sendMailToCustomer(Customer customer);
	void sendOrderMail(Customer customer, Product products);
}
