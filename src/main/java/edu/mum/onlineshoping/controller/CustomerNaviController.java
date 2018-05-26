package edu.mum.onlineshoping.controller;

import java.security.Principal;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.mum.onlineshoping.model.Customer;
import edu.mum.onlineshoping.service.UserService;

@Controller
public class CustomerNaviController {
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/profile" , method = RequestMethod.GET)
	public String editProfile(Model model ,Principal principal){	
		Customer customer = new Customer();
		customer = userService.findOneWithName(principal.getName());
		model.addAttribute("customer", customer);
		model.addAttribute("username", principal.getName());
		return "profile";
	}
	@RequestMapping(value = "/profile" , method = RequestMethod.POST)
	public String aftereditProfile(@Valid Customer customer , BindingResult result ){	
	    Customer customer2  = userService.findOne(customer.getId());
	    customer2.setfName(customer.getfName());
	    customer2.setlName(customer.getlName());
	    customer2.setEmail(customer.getEmail());
	    customer2.setPhone(customer.getPhone());
	    customer2.setIdentificationNumber(customer.getIdentificationNumber());
	    customer2.getAddress().setStreet(customer.getAddress().getStreet());
	    customer2.getAddress().setCity(customer.getAddress().getCity());
	    customer2.getAddress().setState(customer.getAddress().getState());
	    customer2.getAddress().setCountry(customer.getAddress().getCountry());
	    customer2.getAddress().setZip(customer.getAddress().getZip());
	
		userService.edit(customer2);
		return "redirect:/index";
	}
	/*@RequestMapping("/viewProducts")
	public String manageCatagory(){
		return "user/viewProducts";
	}
	@RequestMapping("/cartList")
	public String manageUser(){
		return "shoppingCart/cartList";
	}*/
	@RequestMapping("/customer/viewProducts")
	public String manageCatagory(Principal principal,Model model){
		model.addAttribute("name", principal.getName());
		return "viewProducts";
	}
	@RequestMapping("/cartList")
	public String manageUser(){
		return "cartList";
	}
}
