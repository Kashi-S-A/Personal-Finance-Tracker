package com.ksa.pft.controller;


import java.security.Principal;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ksa.pft.model.Category;
import com.ksa.pft.model.Transaction;
import com.ksa.pft.model.User;
import com.ksa.pft.repo.CategoryRepository;
import com.ksa.pft.repo.UserRepository;
import com.ksa.pft.service.TransactionService;
import com.ksa.pft.util.AutoCategorizer;

@Controller
@RequestMapping("/transactions")
public class TransactionController {

	@Autowired
	private TransactionService transactionService;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private CategoryRepository categoryRepository;

	@GetMapping("/list")
	public String list(Principal principal, Model model) {
		User user = userRepository.findByEmail(principal.getName()).orElse(null);
		List<Transaction> txs = transactionService.findByUser(user);
		model.addAttribute("txs", txs);
		return "transactions";
	}

	@GetMapping("/add")
	public String addForm(Principal principal, Model model) {
		model.addAttribute("transaction", new Transaction());
		User user = userRepository.findByEmail(principal.getName()).orElse(null);
		model.addAttribute("categories", categoryRepository.findByUser(user));
		return "add-transaction";
	}

	@PostMapping("/add")
	public String add(@ModelAttribute Transaction transaction, Principal principal) {
		User user = userRepository.findByEmail(principal.getName()).orElse(null);
		transaction.setUser(user);
		if (transaction.getDate() == null)
			transaction.setDate(LocalDate.now());

// auto-category if no category chosen
		if (transaction.getCategory() == null || transaction.getCategory().getId() == null) {
			String catName = AutoCategorizer.categorize(transaction.getDescription());
			Category cat = categoryRepository.findByUser(user).stream()
					.filter(c -> c.getName().equalsIgnoreCase(catName)).findFirst().orElseGet(() -> {
						Category c = new Category();
						c.setName(catName);
						c.setType(transaction.getType());
						c.setUser(user);
						return categoryRepository.save(c);
					});
			transaction.setCategory(cat);
		}

		transactionService.save(transaction);
		return "redirect:/transactions/list";
	}

	@GetMapping("/delete/{id}")
	public String delete(@PathVariable Long id) {
		transactionService.delete(id);
		return "redirect:/transactions/list";
	}
}