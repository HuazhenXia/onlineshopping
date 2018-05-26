package edu.mum.onlineshoping.service;

import java.util.List;

import edu.mum.onlineshoping.model.OrderDetails;
import edu.mum.onlineshoping.model.Orders;
import edu.mum.onlineshoping.model.ShoppingCart;

public interface OrderDetailsService {

	public void addOrderDetailsByShoppingcart(ShoppingCart shoppingCart , Orders orders);
	public List<OrderDetails> getAllOrderDetailsByOrderId(long orderId);
	public OrderDetails getOrderDetailsById(Long id);
	public void removeOrderDetails(Long id);
	
	public OrderDetails findByShoppingcartId(long id);
}
