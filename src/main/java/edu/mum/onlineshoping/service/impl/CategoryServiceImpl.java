package edu.mum.onlineshoping.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.onlineshoping.model.Category;
import edu.mum.onlineshoping.repository.CategoryRepository;
import edu.mum.onlineshoping.service.CategoryService;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {
	
	//Write by Yaorui Wei
	@Autowired
	private CategoryRepository categoryRepository;
	
	@Override
	public List<Category> getAllCategory() {
		return categoryRepository.findAll();
	}

	@Override
	public Category addCategory(Category category) {
		return categoryRepository.save(category);
	}

	@Override
	public void removeCategory(Long Categoryid) {
		categoryRepository.delete(Categoryid);		
	}
	
	@Override
	public List<Category> findByCategoryName(String name) {
		
		return (List<Category>) categoryRepository.findByCategoryName(name);
	}

	@Override
	public Category getCategoryById(Long id) {
		return categoryRepository.findOne(id);
	}
	
}
