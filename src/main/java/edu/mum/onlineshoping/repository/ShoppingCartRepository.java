package edu.mum.onlineshoping.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import edu.mum.onlineshoping.model.ShoppingCart;



@Repository
public interface ShoppingCartRepository extends CrudRepository<ShoppingCart, Long>{
	
	@Query(value="SELECT s FROM ShoppingCart s")
	public ShoppingCart findByTotalPrice();
	
	@Query(value = "select * from shopping_cart  where product_id = :id" , nativeQuery=true)
	ShoppingCart findByProductId(@Param("id") long id);
	
	@Query(value="SELECT * FROM shopping_cart where user_id = :id", nativeQuery=true)
	List<ShoppingCart> getAllShoppingCartByCustomerId(@Param("id")long id);
	
	
//	@Query(value = "delete from shopping_cart where user_id = :id"  , nativeQuery = true)
//	public void clearShoppingCartByUserId(@Param("id")long id);
}
