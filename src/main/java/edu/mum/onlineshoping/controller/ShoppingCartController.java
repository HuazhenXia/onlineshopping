package edu.mum.onlineshoping.controller;


import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.mum.onlineshoping.model.Customer;
import edu.mum.onlineshoping.model.ShoppingCart;

import edu.mum.onlineshoping.service.ShoppingCartService;
import edu.mum.onlineshoping.service.UserService;


@Controller
public class ShoppingCartController {
	static int i=0;
	@Autowired
	private ShoppingCartService shoppingCartService;

	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/customer/cartList", method = RequestMethod.GET)
	public String getCartList(Model model , Principal principal) {
		Customer customer = userService.findOneWithName(principal.getName());
		List<ShoppingCart> shoppingCart = shoppingCartService.getAllByCustomerId(customer.getId());
		String alert = "";
		boolean isSoldout = true;
		int len=shoppingCart.size();
		for (int i=0 ; i<len;i++) {
			if (shoppingCart.get(i).getQuantity()>shoppingCart.get(i).getProduct().getUnitsInStock() && (shoppingCart.get(i).getProduct().getUnitsInStock()==0)) {
				alert = alert + shoppingCart.get(i).getProduct().getName();
				shoppingCart.get(i).setProduct(null);
				shoppingCartService.deletShoppingCart(shoppingCart.get(i));
				shoppingCart.remove(i);
				isSoldout = true;
				}
			else if (shoppingCart.get(i).getQuantity()>shoppingCart.get(i).getProduct().getUnitsInStock() && (shoppingCart.get(i).getProduct().getUnitsInStock()>0)) {
				alert = alert + shoppingCart.get(i).getProduct().getName();
				shoppingCart.get(i).setQuantity(shoppingCart.get(i).getProduct().getUnitsInStock());
				shoppingCart.get(i).setTotalPrice(shoppingCart.get(i).getQuantity()*shoppingCart.get(i).getProduct().getUnitPrice());
				shoppingCartService.save(shoppingCart.get(i));
		        isSoldout = false;
			}
			if (alert!=""&&(i<shoppingCart.size()-1)) {
				alert = alert+" and ";
			}
		}
		if (alert!="") {
			if (isSoldout) {
				alert = alert+" "+"already sold out";
			}else {
				alert = alert+"'s"+" "+"stock is not enough, you can't add it more";
			}
		}
		model.addAttribute("alertMessage", alert);
		model.addAttribute("shoppingCart", shoppingCart);
		double totalPrice = shoppingCartService.findTotalCartCost(shoppingCart);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("username", principal.getName());
		model.addAttribute("numberofproduct", shoppingCart.size());
		return "cartList";
	}
	@RequestMapping(value = "/addShoppingCart/{productId}", method = RequestMethod.GET)
	public String addCart(@PathVariable Long productId, Model model ,Principal principal) {
		Customer customer = userService.findOneWithName(principal.getName());
		shoppingCartService.saveShoppingCart(productId,customer.getId());
		model.addAttribute("username", principal.getName());
		return "redirect:/customer/cartList";
	}
	@RequestMapping(value = "/removeShoppingCart/{shoppingCartId}", method = RequestMethod.GET)
	public String removeCart(@PathVariable Long shoppingCartId, Model model, Principal principal) {
		ShoppingCart shoppingCart = shoppingCartService.getById(shoppingCartId);
		shoppingCart.setProduct(null);
		shoppingCartService.deletShoppingCart(shoppingCart);
		model.addAttribute("username", principal.getName());
		return "redirect:/customer/cartList";
	}
	@RequestMapping(value = "/removeAllShoppingCart", method = RequestMethod.GET)
	public String removeAllCart(Principal principal) {
		Customer customer = userService.findOneWithName(principal.getName());
		List<ShoppingCart> shoppingCart = shoppingCartService.getAllByCustomerId(customer.getId());
		for (ShoppingCart shoppingCart2 : shoppingCart) {
			shoppingCart2.setProduct(null);
			shoppingCartService.deletShoppingCart(shoppingCart2);
		}
		return "redirect:/customer/cartList";
	}
	
	@RequestMapping(value = "/customer/cartList/test", method = RequestMethod.POST)
	@ResponseBody 
	public void getCartListTest(Model model , Principal principal,
			@RequestBody ShoppingCart shoppingCart, HttpServletRequest request) {
		ShoppingCart shoppingCart1 = shoppingCartService.getById(shoppingCart.getId());
		shoppingCart1.setQuantity(shoppingCart.getQuantity());
		shoppingCart1.setTotalPrice(shoppingCart.getQuantity()*shoppingCart1.getProduct().getUnitPrice());
		shoppingCartService.save(shoppingCart1);
	}
}
