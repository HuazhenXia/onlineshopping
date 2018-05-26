package edu.mum.onlineshoping.service;

import java.util.List;

import edu.mum.onlineshoping.model.Product;

public interface ProductService {
	public List <Product> getAll();
	public Product getProductById(Long key);
	//public void delete(Long id);
	//public void addProduct(Product product);	
	//public void updateProduct(Long key);
	public void sayHello();
		
	//below is writed by YaoruiWei
    // get all the enabled products belong to the specified vendor
    public List<Product> findByVendorId(Long vendorId);
    
    // get all the disabled products belong to this vendor
    public Object findByVendorId_disable(Long vendorId);
    
    // vendor add new product operation
    public Product addProduct(Product product);
    
    //vendor search product operation
    public List<Product> findByProductName(String name, Long vendorId);
    
    public List<Product> findByProductName(String name);
    
    // vendor update product operation
    public void updateProduct(Product product);
    
    // vendor delete product operation(not really delete, just disable the product)
    public void disableProduct(Long productId);
    
    // vendor active product from the warehouse to the saling product list
	public void enableProduct(Long productId);
	
	// get all the products belong to the specified category
	public List<Product> findByCategoryName(String name);
	
	public List<Product> getAllProducts();
}
