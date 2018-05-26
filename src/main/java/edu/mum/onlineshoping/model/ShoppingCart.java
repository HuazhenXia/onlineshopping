package edu.mum.onlineshoping.model;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class ShoppingCart {
	@javax.persistence.Id
	@GeneratedValue(strategy= GenerationType.AUTO)
	private Long Id;
	private int quantity;
	private Date dateAdded;
	private double totalPrice;
	private long userId;
	@ManyToOne( cascade = CascadeType.ALL)
	private Product product;
//	@OneToOne( fetch= FetchType.EAGER, cascade = CascadeType.ALL )
//	private OrderDetails orderDetails;
	public Long getId() {
		return Id;
	}
	public void setId(Long id) {
		Id = id;
	}
//	public OrderDetails getOrderDetails() {
//		return orderDetails;
//	}
//	public void setOrderDetails(OrderDetails orderDetails) {
//		this.orderDetails = orderDetails;
//	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public Date getDateAdded() {
		return dateAdded;
	}
	public void setDateAdded(Date dateAdded) {
		this.dateAdded = dateAdded;
	}
    
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = (double)Math.round(totalPrice*100)/100;
	}
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	
	

}
