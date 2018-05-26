package edu.mum.onlineshoping.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Transient;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;
import org.springframework.web.multipart.MultipartFile;

@Entity
public class Product {
	@javax.persistence.Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@NotEmpty(message = "Please input the product name")
	private String name;
	@Range(min = (long) 1.00, max = (long) 100000.00, message = "The price should between $1 to $100000.")
	private double unitPrice;
	@NotEmpty(message = "Please input the description for this product!")
	private String description;
	@Range(min = (long) 0, max = (long) 1000, message = "Please input the stock for this product!")
	private int unitsInStock;
	@ManyToOne
	private Category category;
	@NotEmpty
	private String brand;

	private String imageURL;
	private boolean enable;

	/*
	 * @OneToMany(fetch= FetchType.LAZY, cascade = CascadeType.ALL) private
	 * List<Review> reviews;
	 */

	@Transient
	private MultipartFile image;
	@ManyToOne
	private Vendor vendor;

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getImageURL() {
		return imageURL;
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}

	public MultipartFile getImage() {
		return image;
	}

	public void setProductImage(MultipartFile image) {
		this.image = image;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Category getCategory() {
		return category;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getUnitsInStock() {
		return unitsInStock;
	}

	public void setUnitsInStock(int unitsInStock) {
		this.unitsInStock = unitsInStock;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	/*
	 * public List<Review> getReviews() { return reviews; } public void
	 * setReviews(List<Review> reviews) { this.reviews = reviews; }
	 */
	public Vendor getVendor() {
		return vendor;
	}

	public void setVendor(Vendor vendor) {
		this.vendor = vendor;
	}

	public boolean isEnable() {
		return enable;
	}

	public void setEnable(boolean enable) {
		this.enable = enable;
	}

}
