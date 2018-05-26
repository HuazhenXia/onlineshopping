package edu.mum.onlineshoping.model;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class VendorForm {
	private Address address;
	@NotEmpty
	private String fName;
	@NotEmpty
	private String lName;
	@NotEmpty
	private String phone;
	@Email(message = "Not vaild email")
	private String email;
	@NotEmpty
	private String accountNumber;
	
	public VendorForm() {}

	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public String getlName() {
		return lName;
	}
	public void setlName(String lName) {
		this.lName = lName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	
	public void receiveVendorDetails(Vendor vendor) {
		this.address = vendor.getAddress();
		this.fName = vendor.getfName();
		this.lName = vendor.getlName();
		this.phone = vendor.getPhone();
		this.email = vendor.getEmail();
		this.accountNumber = vendor.getAccountNumber();
	}	
	
}
