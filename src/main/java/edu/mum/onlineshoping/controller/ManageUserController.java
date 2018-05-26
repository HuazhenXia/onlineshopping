package edu.mum.onlineshoping.controller;

import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.mum.onlineshoping.model.Customer;
import edu.mum.onlineshoping.model.Role;
import edu.mum.onlineshoping.model.Vendor;
import edu.mum.onlineshoping.service.UserService;
import edu.mum.onlineshoping.service.VendorService;

@Controller("/admin/manageUser")
public class ManageUserController {
	@Autowired
	private UserService userService;
	
	@Autowired
	private VendorService vendorService;

	@RequestMapping("/addUser")
	public String addUser(Model model) {
		Vendor vendor = new Vendor();
		model.addAttribute("vendor", vendor);
		model.addAttribute("role", Role.values());
		System.out.println("/addUser");
		return "/admin/addUser";
	}

	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public String addUser(@Valid Vendor vendor, BindingResult result,Model model) {
		model.addAttribute("vendor",vendor);
		System.out.println("/addUser1111");
		
		if (result.hasErrors()) {
//			List<ObjectError> list = result.getAllErrors();
//			for (ObjectError error : list) {
//				System.out.println(error.getCode() + "---" + error.getArguments() + "---" + error.getDefaultMessage());
//			}
			model.addAttribute("role", Role.values());
			return "admin/addUser";
		}
		vendorService.save(vendor);
		return "redirect:list/vendor";
	}

	
	@RequestMapping("/list/vendor")
	public String listAllVendor(Model model) {
		List<Vendor> vendors = vendorService.findAll();
		model.addAttribute("vendors",vendors);
		//System.out.println("/listUser");
		return "/admin/listVendor";
	}
	@RequestMapping("/listUser")
	public String listUser(Model model) {
		List<Customer> customers = userService.findAll();
		model.addAttribute("customers",customers);
		//System.out.println("/listUser");
		return "/admin/listUser";
	}
	@RequestMapping("/deleteUser/{id}")
	public String deleteUserPage(@PathVariable Long id) {
		userService.delete(id);
		return "redirect:/listUser";
	}
	
	@RequestMapping("/delete/vendor/{id}")
	public String deleteVendor(@PathVariable Long id) {
		vendorService.delete(id);
		return "redirect:/list/vendor";
	}

	@RequestMapping("/updateUser/byAdmin/forcustomer/{id}")
	public String updateUsersPage(@PathVariable("id") Long id, Map<String, Object> map) {
		
		Customer customer = userService.findOne(id);
		map.put("customer", customer);
		map.put("role", Role.values());
		return "/admin/updateUser";
	}


	@RequestMapping(value="/updateUser/byAdmin/forcustomer/{id}",method=RequestMethod.POST)
	public String updateUsersPage(@PathVariable("id") Long id,@Valid Customer customer, BindingResult result,Model model) {
		model.addAttribute("customer",customer);
		if (result.hasErrors()) {
			model.addAttribute("role", Role.values());
			return "admin/updateUser";
		}
		userService.save(customer);
		System.out.println(customer);
		return "redirect:/listUser";
	}
	
	@RequestMapping("/updateVendor/ByAdmin/{id}")
	public String updateVendorsPage(@PathVariable("id") Long id, Map<String, Object> map) {
		System.out.println("/updateUsersPage");
		Vendor vendor = vendorService.findOne(id);
		map.put("vendor", vendor);
		map.put("role", Role.values());
		return "/admin/updateVendor";
	}
	
	@RequestMapping(value="/updateVendor/ByAdmin/{id}",method=RequestMethod.POST)
	public String updateVendorsPage(@PathVariable("id") Long id,@Valid Vendor vendor, BindingResult result,Model model) {
		model.addAttribute("vendor",vendor);
		if (result.hasErrors()) {
//			List<ObjectError> list = result.getAllErrors();
//			for (ObjectError error : list) {
//				System.out.println(error.getCode() + "---" + error.getArguments() + "---" + error.getDefaultMessage());
//			}
			model.addAttribute("role", Role.values());
			return "admin/updateVendor";
		}
		vendorService.save(vendor);
		System.out.println(vendor);
		return "redirect:/list/vendor";
	}
}
