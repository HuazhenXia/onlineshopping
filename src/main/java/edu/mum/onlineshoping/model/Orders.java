package edu.mum.onlineshoping.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Orders {
	@javax.persistence.Id
	@GeneratedValue(strategy= GenerationType.AUTO)
	private Long id;
	
	private Date orderDate;
	private Date shipDate;
	@ManyToOne(cascade= CascadeType.ALL)
	private Customer customer;
//	@OneToOne(cascade= CascadeType.ALL)
//	private ShippingInfo info;
//	@OneToMany(cascade = CascadeType.ALL)
//	private List<OrderDetails> orderDetails ; 
	private double totalPrice; 
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public Date getShipDate() {
		return shipDate;
	}
	public void setShipDate(Date shipDate) {
		this.shipDate = shipDate;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = (double)Math.round(totalPrice*100)/100;
	}
    
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return customer+" "+getId()+getOrderDate()+getShipDate();
	}
	
}
