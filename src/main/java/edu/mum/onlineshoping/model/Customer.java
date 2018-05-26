package edu.mum.onlineshoping.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Customer {
	@javax.persistence.Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long Id;
	@NotEmpty
	private String fName;
	private String lName;
	@NotEmpty
	private String phone;
	@Email
	private String email;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@NotNull
	@Temporal(TemporalType.DATE)
	@Past
	private Date dob;
	@NotNull
	private String identificationNumber="N/A";
	@OneToOne(cascade=CascadeType.ALL)
	@Valid
	private Address address;
	@OneToOne(cascade = CascadeType.ALL)
	@Valid
	private User user;
	
	public Long getId() {
		return Id;
	}
	public void setId(Long id) {
		Id = id;
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
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getIdentificationNumber() {
		return identificationNumber;
	}
	public void setIdentificationNumber(String identificationNumber) {
		this.identificationNumber = identificationNumber;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	/*public List<Order> getOrders() {
		return orders;
	}
	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}
	@Override
	public String toString() {
		return "Customer [Id=" + Id + ", fName=" + fName + ", lName=" + lName + ", phone=" + phone + ", email=" + email
				+ ", dob=" + dob + ", identificationNumber=" + identificationNumber + ", address=" + address + ", user="
				+ user + ", orders=" + orders + "]";
	}*/
	
}
