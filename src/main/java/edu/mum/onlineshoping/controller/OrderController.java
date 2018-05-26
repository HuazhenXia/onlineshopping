package edu.mum.onlineshoping.controller;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.mum.onlineshoping.model.Customer;
import edu.mum.onlineshoping.model.OrderDetails;
import edu.mum.onlineshoping.model.Orders;
import edu.mum.onlineshoping.model.ShoppingCart;
import edu.mum.onlineshoping.service.OrderDetailsService;
import edu.mum.onlineshoping.service.OrderService;
import edu.mum.onlineshoping.service.SMTPService;
import edu.mum.onlineshoping.service.ShoppingCartService;
import edu.mum.onlineshoping.service.UserService;

@Controller
public class OrderController {

	@Autowired
	private UserService userService;
	@Autowired
	private ShoppingCartService shoppingCartService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderDetailsService orderDetailsService;
	@Autowired
	private SMTPService sMTPService;
	
	
	@RequestMapping(value = "/customer/checkout", method = RequestMethod.GET)
	public String createOrder( Model model , Principal principal) {
	     Customer customer = userService.findOneWithName(principal.getName());
		model.addAttribute("customer", customer);
		List<ShoppingCart> shoppingCarts = shoppingCartService.getAllByCustomerId(customer.getId());
		double totalPrice = shoppingCartService.findTotalCartCost(shoppingCarts)*1.07;
		Orders orders = new Orders();
		orders.setOrderDate(new Date());
		orders.setShipDate(new Date());
		orders.setCustomer(customer);
		orders.setTotalPrice(totalPrice);
         for (ShoppingCart shoppingCart : shoppingCarts) {
			orderDetailsService.addOrderDetailsByShoppingcart(shoppingCart,orders);
		}
		orderService.addToOrderList(orders);
		model.addAttribute("billingInfo", shoppingCarts);
		model.addAttribute("username", principal.getName());
		model.addAttribute("totalPrice", totalPrice);
		
		return "order/billing";
	}
	@RequestMapping(value = "/customer/createdOrderSuccess", method = RequestMethod.GET)
	public String createdOrderSuccess(Principal principal) {
		Customer customer = userService.findOneWithName(principal.getName());
		List<ShoppingCart> shoppingCarts = shoppingCartService.getAllByCustomerId(customer.getId());
		for (ShoppingCart shoppingCart : shoppingCarts) {
			sMTPService.sendOrderMail(customer, shoppingCart.getProduct());
		}
		
		for (ShoppingCart shoppingCart : shoppingCarts) {
			shoppingCart.setProduct(null);
			shoppingCartService.deletShoppingCart(shoppingCart);
		}
		
		return "redirect:/customer/listProduct";
	}
	@RequestMapping(value = "/customer/orderList", method = RequestMethod.GET)
	public String orderList(Model model , Principal principal) {
		Customer customer = userService.findOneWithName(principal.getName());
		List<Orders> orders = orderService.getAllOrdersByCustomerId(customer.getId());
		model.addAttribute("order", orders);
		model.addAttribute("username", principal.getName());
		return "order/orderList";
	}
	
	@RequestMapping(value = "/customer/orderDetail/{orderId}" , method = RequestMethod.GET)
	public String OrderDetail(@PathVariable Long orderId , Model model , Principal principal) {
		Customer customer = userService.findOneWithName(principal.getName());
		model.addAttribute("customer", customer);
		List<OrderDetails> orderDetails = orderDetailsService.getAllOrderDetailsByOrderId(orderId);
		model.addAttribute("orderDetails", orderDetails);
		Orders orders = orderService.getOrderById(orderId);
		model.addAttribute("username", principal.getName());
		model.addAttribute("totalPrice", orders.getTotalPrice());
		return "order/orderDetail";
	}
}
