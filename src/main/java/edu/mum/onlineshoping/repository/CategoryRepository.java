package edu.mum.onlineshoping.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import edu.mum.onlineshoping.model.Category;


@Repository
public interface CategoryRepository extends JpaRepository<Category, Long>{
	@Query("select c from Category c where c.name=:name" )
	public Category findByCategoryName(@Param("name")String name);
}
