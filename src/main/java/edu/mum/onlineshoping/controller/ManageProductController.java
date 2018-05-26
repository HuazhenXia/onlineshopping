package edu.mum.onlineshoping.controller;


import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.mum.onlineshoping.model.Category;
import edu.mum.onlineshoping.model.Product;
import edu.mum.onlineshoping.service.ProductService;

@Controller("/admin/manageProduct")
public class ManageProductController {
	@Autowired
	private ProductService productService;
	

	
}
