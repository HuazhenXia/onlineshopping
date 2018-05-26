package edu.mum.onlineshoping.service;

import java.util.List;

import edu.mum.onlineshoping.model.Review;

public interface ReviewService {

	public void addReview(Review review);
	public List<Review> getAllReview();
	public Review getReviewById(Long id);
	public void removeReview(Long id);
	//public void updateReview(Review review);
	public List<Review> findReviewByProductId(Long productId);
}
