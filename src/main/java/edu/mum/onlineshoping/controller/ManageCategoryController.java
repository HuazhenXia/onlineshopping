package edu.mum.onlineshoping.controller;

import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.mum.onlineshoping.model.Category;
import edu.mum.onlineshoping.service.CategoryService;

@Controller
public class ManageCategoryController {
	@Autowired
	private CategoryService categoryService;

	@RequestMapping(value="/admin/manageCategory/addCategory", method = RequestMethod.GET)
	public String addCategory(@ModelAttribute("category") Category category, Model model) {
		return "/admin/addCategory";
	}

	@RequestMapping(value = "/admin/manageCategory/addCategory", method = RequestMethod.POST)
	public String addCategory(@ModelAttribute("category") @Valid Category category, BindingResult result,Model model) {
		 List<Category> findByCategoryName = categoryService.findByCategoryName(category.getName());
		if(findByCategoryName!=null && findByCategoryName.size()>0){
			model.addAttribute("msg","CategoryName already exiest !!!");
			return "admin/addCategory";
		}
		model.addAttribute("category",category);
		System.out.println("/ccc");
		
		if (result.hasErrors()) {
//			List<ObjectError> list = result.getAllErrors();
//			for (ObjectError error : list) {
//				System.out.println(error.getCode() + "---" + error.getArguments() + "---" + error.getDefaultMessage());
//			}
			return "admin/addCategory";
		}
		categoryService.addCategory(category);
		return "redirect:listCategory";
	}

	@RequestMapping("/admin/manageCategory/listCategory")
	public String listCategory(Model model) {
		List<Category> categorys = categoryService.getAllCategory();
		model.addAttribute("categorys",categorys);
		System.out.println("/listCategory");
		return "/admin/listCategory";
	}
	@RequestMapping("/admin/manageCategory/deleteCategory/{id}")
	public String deleteCategoryPage(@PathVariable Long id) {
		System.out.println("deleteCategoryPage");
		categoryService.removeCategory(id);
		return "redirect:/admin/manageCategory/listCategory";
	}

	@RequestMapping("/admin/manageCategory/updateCategory/{id}")
	public String updateCategorysPage(@PathVariable("id") Long id, Map<String, Object> map) {
		Category category = categoryService.getCategoryById(id);
		map.put("category", category);
		return "/admin/updateCategory";
	}



	@RequestMapping(value="/admin/manageCategory/updateCategory/{id}",method=RequestMethod.POST)
	public String updateCategorysPage(@PathVariable("id") Long id,Category category) {
		categoryService.addCategory(category);
		System.out.println(category);
		return "redirect:/admin/manageCategory/listCategory";
	}
	
	
}
