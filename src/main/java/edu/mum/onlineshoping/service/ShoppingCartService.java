package edu.mum.onlineshoping.service;

import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;

import edu.mum.onlineshoping.model.ShoppingCart;


public interface ShoppingCartService {
	public ShoppingCart getById(Long Id);
	public List<ShoppingCart> getAllByCustomerId(long userId);
	@PreAuthorize("hasAnyRole('ROLE_USER','ROLE_CUSTOMER')")
	public void saveShoppingCart(Long productId , long userId);
	public void deletShoppingCart(ShoppingCart shoppingCart);
	public ShoppingCart findByTotalPrice();
	public ShoppingCart findByProductId(Long id);
	public void save(ShoppingCart shoppingCart);
//	public void deletAllCartByUserId(long userId);
	public double findTotalCartCost(List<ShoppingCart> shoppingCarts);
}
