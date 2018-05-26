package edu.mum.onlineshoping.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import edu.mum.onlineshoping.model.Role;
import edu.mum.onlineshoping.model.User;
import edu.mum.onlineshoping.model.Vendor;
import edu.mum.onlineshoping.model.VendorForm;
import edu.mum.onlineshoping.service.SMTPService;
import edu.mum.onlineshoping.service.UserService;
import edu.mum.onlineshoping.service.VendorService;


@Controller
public class VendorController {
	
	@Autowired
	private VendorService vendorService;
	@Autowired
	private SMTPService smtpService;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/vendorRegister")
	public String register(@ModelAttribute("vendor") Vendor vendor){	
		//Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		return "vendor/createVendor";
	}
	
	@PostMapping("/vendorRegister")
	public String createVendor(@Valid Vendor vendor, BindingResult result) {
		if(result.hasErrors()) {
			return "vendor/createVendor";
		}		
		vendor.setIncome(0.00);
		vendor.getUser().setEnabled(true);
		vendor.getUser().setHasRole(Role.ROLE_VENDOR);
		vendorService.save(vendor);
		smtpService.sendMailToVendor(vendor);
		
		return "redirect:/login";
	}
	
	@GetMapping("/vendor/profile")
	public String editVendorProfile(Model model, @ModelAttribute("vendorForm") VendorForm vendorForm) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Vendor vendor = vendorService.findByUser_Username(auth.getName());
		vendorForm.receiveVendorDetails(vendor);
		//System.out.println(vendorService.findByUser_Username(auth.getName()).getUser().getUsername());
		return "vendor/profile";

	}
	
	@PostMapping("/vendor/profile")
	public String saveVendorProfile(@Valid VendorForm vendorForm, BindingResult result) {
		if(result.hasErrors()) {
			return "vendor/profile";
		}
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Vendor vendor = vendorService.findByUser_Username(auth.getName());
		vendor.transferVendorForm(vendorForm);
		vendorService.update(vendor);
		return "redirect:/vendor";
	}
	
	
/*	@GetMapping("vendor/apple")
	public String lala(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		model.addAttribute("vendor", vendorService.findByUser_Username(auth.getName()));
		System.out.println(vendorService.findByUser_Username(auth.getName()).getUser().getUsername());
		return "vendor/profile";
	}*/
	
}
