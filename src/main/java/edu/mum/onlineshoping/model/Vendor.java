package edu.mum.onlineshoping.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Id;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;


@Entity
public class Vendor {
	@javax.persistence.Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	@NotEmpty
	private String fName;
	@NotEmpty
	private String lName;
	@NotEmpty
	@Pattern(regexp="\\d{10}", message="Not vaild phone number")
	private String phone;
	@Email(message = "Not vaild email")
	private String email;
	
/*	@DateTimeFormat(pattern="MM/dd/yyyy")
	@NotNull
	@Temporal(TemporalType.DATE)
	@Past
	private Date dob;
*/
	@OneToOne(cascade=CascadeType.ALL)
	@Valid
	private Address address;
	@OneToOne(cascade = CascadeType.ALL)
	@Valid
	private User user;
	@NotEmpty
	@Pattern(regexp="^[0-9]{6,17}$", message = "Not vaild account number")
	private String accountNumber;
	
	private double income;
	
	@OneToMany(mappedBy="vendor")
	private List<Product> products;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public String getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}

	public double getIncome() {
		return income;
	}

	public void setIncome(double income) {
		this.income = income;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}
	
	public void transferVendorForm(VendorForm vendorForm) {
		this.address = vendorForm.getAddress();
		this.fName = vendorForm.getfName();
		this.lName = vendorForm.getlName();
		this.phone = vendorForm.getPhone();
		this.email = vendorForm.getEmail();
		this.accountNumber = vendorForm.getAccountNumber();
	}
		
}
