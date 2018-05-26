package edu.mum.onlineshoping.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import edu.mum.onlineshoping.model.Product;

@Repository
public interface ProductRepository extends  CrudRepository<Product, Long>{

	//write by Yaorui Wei
	@Query("select p from Product p where p.vendor.id = :vendorId AND p.enable = 1")
    List<Product> findByVendorId(@Param("vendorId")Long vendorId);
	
	@Query("select p from Product p where p.vendor.id = :vendorId AND p.enable = 0")
    List<Product> findByVendorId_disable(@Param("vendorId")Long vendorId);
	
    @Query("select p from Product p where p.vendor.id = :vendorId "
    		+ "AND p.enable = 1 AND p.name like %:name%")
    List<Product> findByProductName(@Param("name")String name, 
    		@Param("vendorId") Long vendorId);
    
    @Query("select p from Product p where p.name like %:productName%")
    List<Product> findByProductName(@Param("productName")String productName);	
    
    @Modifying
	@Query("update Product p set p.enable=0 where p.id=:productId")
    void disable(@Param("productId")Long productId);
    
    @Modifying
	@Query("update Product p set p.enable=1 where p.id=:productId")
    void enable(@Param("productId")Long productId);
    
    @Query("select p from Product p where p.category.name = :name AND p.enable = 1")
    List<Product> findByCategoryName(@Param("name")String name);
    
    @Query(value = "select p from Product p where p.enable = 1" )
    List<Product> findByIsEnable();
    
}
