package edu.mum.onlineshoping.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import edu.mum.onlineshoping.model.OrderDetails;

@Repository
public interface OrderDetailsRepository extends CrudRepository<OrderDetails, Long>{

//	@Query(value = "select * from order_details  where shopping_cart_id = :id" , nativeQuery = true)
//	OrderDetails findByShoppingcartId(@Param("id") long id);
	
	@Query(value = "select * from order_details where orders_id = :id" , nativeQuery=true)
	List<OrderDetails> getAllOrderDetailsByOrderId(@Param("id")long id);
}
