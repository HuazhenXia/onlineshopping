package edu.mum.onlineshoping.repository;


import java.util.List;


import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


import edu.mum.onlineshoping.model.Orders;

@Repository
public interface OrderRepository extends CrudRepository<Orders, Long>{

	@Query(value = "SELECT * FROM orders  where customer_id = :id",nativeQuery=true)
	List<Orders> getAllOrdersByCustomerId(@Param("id")long id);
}
