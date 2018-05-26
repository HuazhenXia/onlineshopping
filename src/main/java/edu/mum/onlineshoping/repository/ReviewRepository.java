package edu.mum.onlineshoping.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import edu.mum.onlineshoping.model.Review;

@Repository
public interface ReviewRepository extends CrudRepository<Review, Long>{

	/*@Query(value="UPDATE Review set ")*/
	//public void updateReview(Review review);
}
