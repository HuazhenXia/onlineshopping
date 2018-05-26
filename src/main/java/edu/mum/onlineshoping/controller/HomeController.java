package edu.mum.onlineshoping.controller;



import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.security.Principal;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.http.MediaType;
import org.springframework.jms.annotation.JmsListener;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.mum.onlineshoping.model.Customer;
import edu.mum.onlineshoping.model.Product;
import edu.mum.onlineshoping.service.CategoryService;
import edu.mum.onlineshoping.service.ProductService;
import edu.mum.onlineshoping.service.UserService;



@Controller
public class HomeController  {
	@Autowired
	JmsTemplate jmsTemplate;
	
	@Autowired
	UserService userService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	ServletContext context;

	@Autowired
	CategoryService categoryService;
	@GetMapping({ "/", "/home" })
	public String homePage() {
		return "home";
	}

	@GetMapping({ "/index" })
	public String indexPage(Principal principal , Model model) {
//		/*Customer customer=userService.findOneWithName(principal.getName());*/
		if(principal != null) {
			model.addAttribute("username", principal.getName());
		}
		
		
		List<Product> products = productService.getAllProducts();
		model.addAttribute("products",products);
		return "index";
	}
	
	
	@RequestMapping(value = "/index/clothing")
	public String indexCloth(Model model, Principal principal) {
		List<Product> products = productService.findByCategoryName("Clothing");
		model.addAttribute("products",products);
		model.addAttribute("username", principal.getName());
		return "index";
	}
	@RequestMapping(value = "/index/shoes")
	public String indexShoes(Model model, Principal principal) {
		List<Product> products = productService.findByCategoryName("Shoes");
		model.addAttribute("products",products);
		model.addAttribute("username", principal.getName());
		return "index";
	}
	@RequestMapping(value = "/index/watches")
	public String indexWatch(Model model, Principal principal) {
		List<Product> products = productService.findByCategoryName("Watches");
		model.addAttribute("username", principal.getName());
		model.addAttribute("products",products);
		return "index";
	}
	@RequestMapping(value = "/index/handbag")
	public String indexHandbag(Model model, Principal principal) {
		List<Product> products = productService.findByCategoryName("Bags");
		model.addAttribute("products",products);
		model.addAttribute("username", principal.getName());
		return "index";
	}
	

	@GetMapping({ "/secure" })
	public String securePage() {
		return "secure";
	}

	@RequestMapping("/user")
	public String toUserPage(HttpServletRequest httpSession) throws Exception {
//	System.out.println(httpSession.getSession().getAttribute("customer"));
//		userService.edit(customer);
		
		return "userPage";
	}

	@RequestMapping("/admin")
	public String toAdminPage() throws Exception {
		return "adminPage";
	}

	@RequestMapping("/login")
	public String toLoginPage() {
		return "login";
	}


	// @Autowired
	// public PersonService personService;
	// @GetMapping({ "/regist" })
	// public ModelAndView toRegistPage() {
	// ModelAndView modelAndView = new ModelAndView("regist");
	// Person person = new Person();
	// modelAndView.addObject(person);
	// return modelAndView;
	// }
	//
	// @RequestMapping("/savePerson")
	// public String saveProductPage(@ModelAttribute(value = "person") Person
	// person) {
	// System.out.println(person);
	// personService.savePerson(person);
	// return "redirect:/login";
	// }
	
	@RequestMapping("/customer/listProduct")
	public String showProductList(Model model, Principal principal) {
		List<Product> products = productService.getAllProducts();
		model.addAttribute("products",products);
		model.addAttribute("username", principal.getName());
		return "listProduct";
	}
	@RequestMapping("/customer/listProduct/search")
	public String searchProductList(String pname, Model model, Principal principal) {
		List<Product> products = productService.findByProductName(pname);
		model.addAttribute("products",products);
		model.addAttribute("pname", pname);
		model.addAttribute("username", principal.getName());
		return "listProduct";
	}
	@RequestMapping(value = "/customer/productDetail/clothing")
	public String Cloth(Model model, Principal principal) {
		List<Product> products = productService.findByCategoryName("Clothing");
		model.addAttribute("products",products);
		model.addAttribute("username", principal.getName());
		return "listProduct";
	}
	@RequestMapping(value = "/customer/productDetail/shoes")
	public String Shoes(Model model, Principal principal) {
		List<Product> products = productService.findByCategoryName("Shoes");
		model.addAttribute("products",products);
		model.addAttribute("username", principal.getName());
		return "listProduct";
	}
	@RequestMapping(value = "/customer/productDetail/watches")
	public String Watch(Model model, Principal principal) {
		List<Product> products = productService.findByCategoryName("Watches");
		model.addAttribute("products",products);
		model.addAttribute("username", principal.getName());
		return "listProduct";
	}
	@RequestMapping(value = "/customer/productDetail/handbag")
	public String Handbag(Model model, Principal principal) {
		List<Product> products = productService.findByCategoryName("Bags");
		model.addAttribute("products",products);
		model.addAttribute("username", principal.getName());
		return "listProduct";
	}
	@RequestMapping(value = "/customer/productDetail/{productId}" , method =  RequestMethod.GET)
	public String viewProductDetail(@PathVariable Long productId , Model model, Principal principal) {
		Product product = productService.getProductById(productId);
		model.addAttribute("product", product);
//		System.out.println(product.getImage());
		model.addAttribute("username", principal.getName());
		return "productDetail";
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
			response.setContentType(MediaType.IMAGE_GIF_VALUE);
		}
		IOUtils.copy(in, response.getOutputStream());
	}
}
