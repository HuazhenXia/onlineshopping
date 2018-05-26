package edu.mum.onlineshoping.service;

import java.util.List;

import edu.mum.onlineshoping.model.Category;

public interface CategoryService {
	//Write by Yaorui Wei
	List<Category> getAllCategory();
	Category addCategory(Category category);
	void removeCategory(Long Categoryid);
	List<Category> findByCategoryName(String name);
	Category getCategoryById(Long id);
}
