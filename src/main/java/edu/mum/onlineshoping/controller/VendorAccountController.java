package edu.mum.onlineshoping.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.mum.onlineshoping.model.Role;
import edu.mum.onlineshoping.model.Vendor;
import edu.mum.onlineshoping.service.VendorService;

@Controller
public class VendorAccountController {
	@Autowired
	private VendorService vendorService;


	@RequestMapping(value = "/register/vendor", method = RequestMethod.GET)
	public String signUp(Model model) {
		model.addAttribute("role", Role.values());
		model.addAttribute("vendor", new Vendor());
		return "registerVendor";
	}

	@RequestMapping(value = "/register/vendor", method = RequestMethod.POST)
	public String register(@Valid Vendor vendor, BindingResult result, RedirectAttributes redirectAttributes,
			Model model) {
		
		model.addAttribute("vendor", vendor);
		if (result.hasErrors()) {
			model.addAttribute("role", Role.values());
			return "registerVendor";
		}
		vendor.getUser().setHasRole(Role.ROLE_VENDOR);
		vendorService.save(vendor);
		redirectAttributes.addFlashAttribute("vendor", vendor);
		return "redirect:/login";
		
	}
}
