package com.ksa.pft.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.ksa.pft.model.Budget;
import com.ksa.pft.model.User;
import com.ksa.pft.repo.CategoryRepository;
import com.ksa.pft.repo.UserRepository;
import com.ksa.pft.service.BudgetService;

@Controller
public class BudgetController {

	@Autowired
	private BudgetService budgetService;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private CategoryRepository categoryRepository;

	@GetMapping("/budgets")
	public String budgets(Principal principal, Model model) {
		User user = userRepository.findByEmail(principal.getName()).orElse(null);
		List<Budget> budgets = budgetService.findByUser(user);
		model.addAttribute("budgets", budgets);
		model.addAttribute("budget", new Budget());
		model.addAttribute("categories", categoryRepository.findByUser(user));
		return "budgets";
	}

	@PostMapping("/budgets")
	public String saveBudget(@ModelAttribute Budget budget, Principal principal) {
		User user = userRepository.findByEmail(principal.getName()).orElse(null);
		budget.setUser(user);
		budgetService.save(budget);
		return "redirect:/budgets";
	}
}