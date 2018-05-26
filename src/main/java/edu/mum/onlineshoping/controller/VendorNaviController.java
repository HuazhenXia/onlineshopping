package edu.mum.onlineshoping.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.tomcat.util.codec.binary.Base64;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import edu.mum.onlineshoping.model.Product;
import edu.mum.onlineshoping.model.Vendor;
import edu.mum.onlineshoping.service.CategoryService;
import edu.mum.onlineshoping.service.ProductService;
import edu.mum.onlineshoping.service.VendorService;

@Controller
@RequestMapping("/vendor")
public class VendorNaviController {
	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private VendorService vendorService;	
	@Autowired
	ServletContext context;
	
	@GetMapping
	public String vendorPage(Model model, Principal principal) {		
		//Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = principal.getName();
		Vendor vendor = vendorService.findByUser_Username(username);
		model.addAttribute("username", username);
		model.addAttribute("vendor", vendor);
		return "vendor/vendorPage";
	}
	
	// get the product list for the specified vendor(search from database using vendorid)
	@GetMapping("/products")
	public String showProducts(Model model, Principal principal) {
		String username = principal.getName();
		Vendor vendor = vendorService.findByUser_Username(username);
		model.addAttribute("username", username);
		model.addAttribute("products", productService.findByVendorId(vendor.getId()));
		model.addAttribute("products_disabled", productService.findByVendorId_disable(vendor.getId()));
		return "vendor/productList";
	}

	@GetMapping("/product/add")
	public String addProduct(@ModelAttribute("product") Product product, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		model.addAttribute("username", auth.getName());
		model.addAttribute("categories", categoryService.getAllCategory());
		return "vendor/addProduct";
	}

	@GetMapping("/pictures/{pictureName}")
	public void getImage(@PathVariable("pictureName") String pictureName, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		File f1 = new File(request.getServletContext().getRealPath("views/pictures") + "/" + pictureName + ".jpg");
		File f2 = new File(request.getServletContext().getRealPath("views/pictures") + "/" + pictureName + ".png");
		File f3 = new File(request.getServletContext().getRealPath("views/pictures") + "/" + pictureName + ".gif");
		InputStream in;
		if (f1.exists() && f1.isFile()) {
			in = context.getResourceAsStream("/views/pictures/" + pictureName + ".jpg");
			response.setContentType(MediaType.IMAGE_JPEG_VALUE);
		} else if (f2.exists() && f2.isFile()) {
			in = context.getResourceAsStream("/views/pictures/" + pictureName + ".png");
			response.setContentType(MediaType.IMAGE_PNG_VALUE);
		} else if (f3.exists() && f3.isFile()) {
			in = context.getResourceAsStream("/views/pictures/" + pictureName + ".gif");
			response.setContentType(MediaType.IMAGE_GIF_VALUE);
		} else {
			in = context.getResourceAsStream("/views/pictures/noimage.jpg");
			response.setContentType(MediaType.IMAGE_JPEG_VALUE);
		}
		IOUtils.copy(in, response.getOutputStream());
	}

	@PostMapping("/product/add")
	public String addProduct(@Valid Product product, BindingResult result, @RequestParam("image") MultipartFile image,
			HttpServletRequest request, Principal principal) throws IOException {

		if (result.hasErrors()) {
			return "vendor/addProduct";
		}
		
		String username = principal.getName();
		Vendor vendor = vendorService.findByUser_Username(username);
		
		product.setEnable(true);
		product.setVendor(vendor);
		product = productService.addProduct(product);

		//System.out.println(image.getOriginalFilename());

		String fileName = image.getOriginalFilename();
		fileName = "p-" + product.getId().toString() + fileName.substring(fileName.lastIndexOf("."));
		String uploadPath = request.getServletContext().getRealPath("views/pictures");
		
		// upload file to project path
		Files.copy(image.getInputStream(), Paths.get(uploadPath, fileName));
		
		product.setImageURL("/pictures/"+ fileName);
		productService.addProduct(product);
		
		return "redirect:/vendor/products";
	}

	@GetMapping("/product/update")
	public String getUpdateProduct(@RequestParam("productId") Long productId, Model model, Principal principal) {
		model.addAttribute("username", principal.getName());
		model.addAttribute("product", productService.getProductById(productId));
		model.addAttribute("categories", categoryService.getAllCategory());
		return "vendor/updateProduct";
	}

	@PostMapping("/product/update")
	public String updateProduct(Model model, @Valid Product product, BindingResult result, @RequestParam("image") MultipartFile image,
			HttpServletRequest request, Principal principal) throws IOException {
		
		if (result.hasErrors()) {
			model.addAttribute("categories", categoryService.getAllCategory());
			return "vendor/updateProduct";
		}			

		String fileName = image.getOriginalFilename();
		if(!fileName.isEmpty()) {
			fileName = "p-" + product.getId().toString() + fileName.substring(fileName.lastIndexOf("."));
			String uploadPath = request.getServletContext().getRealPath("views/pictures");
		
		//System.out.println(uploadPath);
		//System.out.println(product.getImageURL().substring(16));
		//delete the old one if exist
			File file = new File(request.getServletContext().getRealPath("views/pictures") + "/" + product.getImageURL().substring(10));
			if(file.exists()) {
				Files.delete(Paths.get(uploadPath, product.getImageURL().substring(10)));
			}			
		
		// upload file to project path
		//Files.delete(Paths.get(uploadPath,fileName));		
			Files.copy(image.getInputStream(), Paths.get(uploadPath, fileName));		
			product.setImageURL("/views/pictures/"+ fileName);
		}
		Vendor vendor = vendorService.findByUser_Username(principal.getName());
		product.setVendor(vendor);
		productService.updateProduct(product);
		return "redirect:/vendor/products";
	}

	@PostMapping("/product/remove")
	public String removeProduct(@RequestParam("productId") Long productId) {
		productService.disableProduct(productId);
		return "redirect:/vendor/products";
	}

	@PostMapping("/product/active")
	public String activeProduct(@RequestParam("productId") Long productId) {
		productService.enableProduct(productId);
		return "redirect:/vendor/products";
	}

	@GetMapping("/product/search")
	public String searchProduct(@RequestParam("name") String name, Model model, Principal principal) {
		Vendor vendor = vendorService.findByUser_Username(principal.getName());
		model.addAttribute("products", productService.findByProductName(name, vendor.getId()));
		return "vendor/productList";
	}
}
