package edu.mum.onlineshoping.model;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

@Entity
public class ShippingInfo {

	@javax.persistence.Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long id;
	@Enumerated(EnumType.ORDINAL)
	private ShippingType shippingType;
	private double shippingCost;
	
	public double getShippingCost() {
		return shippingCost;
	}
	public void setShippingCost(double shippingCost) {
		this.shippingCost = shippingCost;
	}
}
