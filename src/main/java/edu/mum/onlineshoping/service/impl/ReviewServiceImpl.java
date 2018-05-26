package edu.mum.onlineshoping.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.onlineshoping.model.Review;
import edu.mum.onlineshoping.repository.ReviewRepository;
import edu.mum.onlineshoping.service.ReviewService;

@Service
@Transactional
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewRepository reviewRepository;
	public void addReview(Review review) {
		
		reviewRepository.save(review);
	}

	public List<Review> getAllReview() {
		 
		return (List<Review>) reviewRepository.findAll();
	}

 

	public void removeReview(Long id) {
		reviewRepository.delete(id);
		
	}

	/*public void updateReview(Review review) {
		 
		reviewRepository.updateReview(review);
	}*/

	public Review getReviewById(Long id) {
	 
		return reviewRepository.findOne(id);
	}

	@Override
	public List<Review> findReviewByProductId(Long productId) {
		 
		List<Review> review =new ArrayList<Review>();
		List<Review> reviews =(List<Review>) reviewRepository.findAll();
		for(Review r : reviews ){
			if(r.getProduct().getId() == productId ){
				review.add(r);
			}
		}
		return review;
	}
	
	 
	 

}
