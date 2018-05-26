package edu.mum.onlineshoping.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import edu.mum.onlineshoping.model.Vendor;

@Repository
public interface VendorRepository extends JpaRepository<Vendor, Long>{
	public Vendor findByUser_Username(String username);

	@Query(value="select distinct DATE_FORMAT(o.order_date,'%Y%u') weeks from orders o, order_details od, product p, vendor v, user u where od.orders_id=o.id and od.product_id=p.id and p.vendor_id=v.id and v.user_id=u.id and u.username=:username group by weeks desc", nativeQuery=true)
	public List<String> findWeeks(@Param("username")String username);
}