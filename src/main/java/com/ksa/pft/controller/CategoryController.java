package com.ksa.pft.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.ksa.pft.model.Category;
import com.ksa.pft.model.User;
import com.ksa.pft.repo.UserRepository;
import com.ksa.pft.service.CategoryService;

@Controller
public class CategoryController {

    @Autowired
    private CategoryService categoryService;
    
    @Autowired
    private UserRepository userRepository;

    @GetMapping("/categories")
    public String categories(Model model) {
        model.addAttribute("category", new Category());
        model.addAttribute("categories", categoryService.getAll());
        return "categories";
    }

    @PostMapping("/categories")
    public String saveCategory(Principal principal,@ModelAttribute Category category) {
    	User user = userRepository.findByEmail(principal.getName()).orElse(null);
		category.setUser(user);
    	categoryService.save(category);
        return "redirect:/categories";
    }
}
