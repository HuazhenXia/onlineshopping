package edu.mum.onlineshoping.model;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.hibernate.annotations.Cascade;
import org.hibernate.criterion.Order;
@Entity
public class OrderDetails {
	@javax.persistence.Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long Id;
	
	private int quantity;
	private double unitCost;
	private double subTotal;
	/*@OneToOne(fetch= FetchType.EAGER, cascade = CascadeType.PERSIST)
	 @OneToOne( cascade = {CascadeType.PERSIST, CascadeType.MERGE} ) 
	 @Cascade(org.hibernate.annotations.CascadeType.SAVE_UPDATE)
	private Product product;*/
//	@OneToOne(cascade = CascadeType.ALL)
//	private ShoppingCart shoppingCart;
	@ManyToOne(cascade = CascadeType.ALL)
	private Orders orders;
	@ManyToOne( cascade = CascadeType.ALL)
	private Product product;
	
//	@ManyToOne( )
//	private Product product; 
//	public  Product getProduct() {
//		return product;
//	}
//	public void setProducts(Product product) {
//		this.product = product;
//	}
	public Long getId() {
		return Id;
	}
	public void setId(Long id) {
		Id = id;
	}
	
	public Orders getOrders() {
		return orders;
	}
	public void setOrders(Orders orders) {
		this.orders = orders;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getUnitCost() {
		return unitCost;
	}
	public void setUnitCost(double unitCost) {
		this.unitCost = unitCost;
	}
	public double getSubTotal() {
		return subTotal;
	}
	public void setSubTotal(double subTotal) {
		this.subTotal = (double)Math.round(subTotal*100)/100;
	}
	
	
//	public ShoppingCart getShoppingCart() {
//		return shoppingCart;
//	}
//	public void setShoppingCart(ShoppingCart shoppingCart) {
//		this.shoppingCart = shoppingCart;
//	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return quantity+", "+unitCost+", "+subTotal+", "+orders;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
}
