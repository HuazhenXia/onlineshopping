package edu.mum.onlineshoping.service.impl;

import static org.mockito.Mockito.never;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.onlineshoping.model.OrderDetails;
import edu.mum.onlineshoping.model.Product;
import edu.mum.onlineshoping.model.ShoppingCart;
import edu.mum.onlineshoping.repository.OrderDetailsRepository;
import edu.mum.onlineshoping.repository.ProductRepository;
import edu.mum.onlineshoping.repository.ShoppingCartRepository;
import edu.mum.onlineshoping.service.ShoppingCartService;


@Service
@Transactional
public class ShoppingCartServiceImpl implements ShoppingCartService{

	@Autowired 
	ShoppingCartRepository shoppingCartRepository;
	@Autowired
	OrderDetailsRepository orderDetailsRepository;
	@Autowired
	ProductRepository productRepository;
	
	public void save(ShoppingCart shoppingCart) {
		shoppingCartRepository.save(shoppingCart);
	}
	
	public ShoppingCart getById(Long Id) {
		 
		return shoppingCartRepository.findOne(Id);
		 
	}


	@Override
	public List<ShoppingCart> getAllByCustomerId(long userId) {
		// TODO Auto-generated method stub
		 return (List<ShoppingCart>) shoppingCartRepository.getAllShoppingCartByCustomerId(userId);
		//return null;
	}
	@Override
	public void deletShoppingCart(ShoppingCart shoppingCart) {
		// TODO Auto-generated method stub
		shoppingCartRepository.delete(shoppingCart);
	}


	@Override
	public ShoppingCart findByTotalPrice() {
		// TODO Auto-generated method stub
		return  shoppingCartRepository.findByTotalPrice();
	}


	@Override
	public ShoppingCart findByProductId(Long id) {
		// TODO Auto-generated method stub
		return shoppingCartRepository.findByProductId(id);
	}

//
//	@Override
//	public void deletAllCartByUserId(long userId){
//		// TODO Auto-generated method stub
//		shoppingCartRepository.clearShoppingCartByUserId(userId);
//	}


	@Override
	public double findTotalCartCost(List<ShoppingCart> shoppingCarts) {
		// TODO Auto-generated method stub
		double totalPrice = 0;
		for(ShoppingCart sc : shoppingCarts){
			totalPrice += sc.getTotalPrice();
		}
		return (double)Math.round(totalPrice*100)/100;
	}
	public void saveShoppingCart(Long productId , long userId) {
		// TODO Auto-generated method stub
		 Product product = productRepository.findOne(productId);
		 
//		 ShoppingCart shoppingCart = shoppingCartRepository.findByProductId(productId);	 
		 List<ShoppingCart> shoppingCarts = shoppingCartRepository.getAllShoppingCartByCustomerId(userId);
		 if (shoppingCarts.size()!=0) {
			 int count = 0;
			 for (ShoppingCart shoppingCart : shoppingCarts) {
					if ( shoppingCart.getProduct().getId() == productId) {
						shoppingCart.setQuantity(shoppingCart.getQuantity()+1);
						shoppingCart.setDateAdded(new Date());
						shoppingCart.setTotalPrice(shoppingCart.getQuantity()*product.getUnitPrice());					
					}else {
						count++;
					}
			 }
			 if (count==shoppingCarts.size()) {
				 ShoppingCart shoppingCart = new ShoppingCart();
					shoppingCart.setQuantity(1);
					shoppingCart.setUserId(userId);
					shoppingCart.setProduct(product);
					shoppingCart.setDateAdded(new Date());
					shoppingCart.setTotalPrice(shoppingCart.getQuantity()*product.getUnitPrice());
					shoppingCartRepository.save(shoppingCart);
			}
			
		}else {
			ShoppingCart shoppingCart = new ShoppingCart();
			shoppingCart.setQuantity(1);
			shoppingCart.setUserId(userId);
			shoppingCart.setProduct(product);
			shoppingCart.setDateAdded(new Date());
			shoppingCart.setTotalPrice(shoppingCart.getQuantity()*product.getUnitPrice());
			shoppingCartRepository.save(shoppingCart);
			}
		}
		 
		 
//		 OrderDetails order =orderDetailsRepository.findByProductId(productId);
//		 if(order!=null){
//			 order.setQuantity(order.getQuantity() + 1);
//			 order.setSubTotal( order.getUnitCost() * order.getQuantity());
//			 orderDetailsRepository.save(order); 
		  
//		 ShoppingCart shoppingCart = shoppingCartRepository.findByOrderId(order.getId());
//		 if(shoppingCart!=null){
//			 shoppingCart.setQuantity(order.getQuantity());
//			 shoppingCart.setTotalPrice(order.getSubTotal());
//			 shoppingCart.setOrderDetails(order);
//			 shoppingCart.setUserId(userId);
//			 shoppingCartRepository.save(shoppingCart);
//		 	} 
//		 }
//		 else{
//			 OrderDetails orderDetails = new OrderDetails();
//			 orderDetails.setProducts(product);
//		 
//			 orderDetails.setQuantity(1);
//			 orderDetails.setUnitCost(product.getUnitPrice());
//			 orderDetails.setSubTotal( orderDetails.getQuantity() * orderDetails.getUnitCost() );
//			 
//			 ShoppingCart shoppingCart = new ShoppingCart();
//			 shoppingCart.setDateAdded( new Date());
//			 shoppingCart.setOrderDetails(orderDetails);
//			 shoppingCart.setQuantity(1);
//			 shoppingCart.setTotalPrice(orderDetails.getSubTotal());
//			 shoppingCart.setUserId(userId);
//			 shoppingCartRepository.save(shoppingCart);
//			 orderDetailsRepository.save(orderDetails);
//	     }

}
