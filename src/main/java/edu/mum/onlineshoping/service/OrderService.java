package edu.mum.onlineshoping.service;

import java.util.List;

import edu.mum.onlineshoping.model.Orders;

public interface OrderService {

	public void addToOrderList(Orders orders);
	public List<Orders> getAllOrdersByCustomerId(long id);
	public Orders getOrderById(long id);
}
