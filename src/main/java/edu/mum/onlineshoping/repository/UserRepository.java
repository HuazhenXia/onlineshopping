package edu.mum.onlineshoping.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import edu.mum.onlineshoping.model.Customer;
import edu.mum.onlineshoping.model.User;
@Repository
public interface UserRepository extends CrudRepository<Customer, Long>{
	@Query("select c from Customer c where c.user.username=:username")
	public Customer findOneWithName(@Param("username")String username);
	
	@Query(value="select count(1) from user where username=:username", nativeQuery=true)
	public int findUserWithName(@Param("username")String username);	
}
