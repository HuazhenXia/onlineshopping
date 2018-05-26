package edu.mum.onlineshoping.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.onlineshoping.model.Product;
import edu.mum.onlineshoping.repository.ProductRepository;
import edu.mum.onlineshoping.service.ProductService;

@Service
@Transactional

public class ProductServiceImpl implements ProductService{
		@Autowired
		ProductRepository productRepository;
		
//    private final ProductRepository productRepository;
//
//    @Autowired
//    public ProductServiceImpl(ProductRepository productRepository) {
//        this.productRepository = productRepository;
//    }
	

	@Override
	public Product getProductById(Long key) {
		return productRepository.findOne(key);
	}


	@Override
	public List<Product> getAll() {		
		return (List<Product>) productRepository.findAll();
	}

	
	public void sayHello(){
		System.out.println("Hello Customer");
	}


	// below is Writed by YaoruiWei
	@Override
	public List<Product> findByVendorId(Long vendorId) {
		return productRepository.findByVendorId(vendorId);
	}

	@Override
	public Product addProduct(Product product) {
		return productRepository.save(product);
	}

	@Override
	public void updateProduct(Product product) {
		productRepository.save(product);		
	}

	@Override
	public void disableProduct(Long productId) {
		productRepository.disable(productId);
	}

	@Override
	public void enableProduct(Long productId) {		
		productRepository.enable(productId);
	}
	
	@Override
	public List<Product> findByProductName(String name, Long vendorId) {
		return productRepository.findByProductName(name, vendorId);
	}
	
	@Override
	public List<Product> findByProductName(String name) {
		return productRepository.findByProductName(name);
	}

	@Override
	public List<Product> findByVendorId_disable(Long vendorId) {
		return productRepository.findByVendorId_disable(vendorId);
	}


	@Override
	public List<Product> findByCategoryName(String name) {
		return productRepository.findByCategoryName(name);
	}

	@Override
	public List<Product> getAllProducts() {
		// TODO Auto-generated method stub
		return productRepository.findByIsEnable();
	}
	
}
