package edu.mum.onlineshoping.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.onlineshoping.model.OrderDetails;
import edu.mum.onlineshoping.model.Orders;
import edu.mum.onlineshoping.model.Product;
import edu.mum.onlineshoping.model.ShoppingCart;
import edu.mum.onlineshoping.model.Vendor;
import edu.mum.onlineshoping.repository.OrderDetailsRepository;
import edu.mum.onlineshoping.repository.ProductRepository;
import edu.mum.onlineshoping.service.OrderDetailsService;
import edu.mum.onlineshoping.service.ProductService;
import edu.mum.onlineshoping.service.VendorService;

@Service
@Transactional
public class OrderDetailsServiceImpl implements OrderDetailsService{

	@Autowired
	OrderDetailsRepository orderDetailsRepository;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	VendorService vendorService;
	
	public void addOrderDetailsByShoppingcart(ShoppingCart shoppingCart , Orders orders) {
		OrderDetails orderDetails = new OrderDetails();
		orderDetails.setQuantity(shoppingCart.getQuantity());
//		orderDetails.setShoppingCart(shoppingCart);
		orderDetails.setSubTotal(shoppingCart.getTotalPrice());
		orderDetails.setUnitCost(shoppingCart.getProduct().getUnitPrice());
		orderDetails.setOrders(orders);
		orderDetails.setProduct(shoppingCart.getProduct());
		Product product = orderDetails.getProduct();
		product.setUnitsInStock(product.getUnitsInStock()-orderDetails.getQuantity());
		if (product.getUnitsInStock()==0) {
			product.setEnable(false);
		}
	    productService.updateProduct(product);
	    Vendor vendor = product.getVendor();
	    vendor.setIncome(orderDetails.getSubTotal()*0.8);
	    vendorService.update(vendor);
		orderDetailsRepository.save(orderDetails);
	}

	@Override
	public List<OrderDetails> getAllOrderDetailsByOrderId(long orderId) {
		// TODO Auto-generated method stub
		return (List<OrderDetails>)orderDetailsRepository.getAllOrderDetailsByOrderId(orderId);
	}

	@Override
	public OrderDetails getOrderDetailsById(Long id) {
		// TODO Auto-generated method stub
		return orderDetailsRepository.findOne(id);
	}

	@Override
	public void removeOrderDetails(Long id) {
		// TODO Auto-generated method stub
		orderDetailsRepository.delete(id);
	}

	@Override
	public OrderDetails findByShoppingcartId(long id) {
		// TODO Auto-generated method stub
//		return orderDetailsRepository.findByShoppingcartId(id);
		return null;
	}

	

}
