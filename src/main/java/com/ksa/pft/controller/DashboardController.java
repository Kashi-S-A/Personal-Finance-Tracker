package com.ksa.pft.controller;

import java.security.Principal;
import java.time.LocalDate;
import java.time.YearMonth;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ksa.pft.model.Transaction;
import com.ksa.pft.model.User;
import com.ksa.pft.repo.TransactionRepository;
import com.ksa.pft.repo.UserRepository;

@Controller
public class DashboardController {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private TransactionRepository transactionRepository;

	@GetMapping("/dashboard")
	public String dashboard(Principal principal, Model model) {
		User user = userRepository.findByEmail(principal.getName()).orElse(null);
		model.addAttribute("name", user.getName());
		return "dashboard";
	}

// endpoint for category-wise spending (returns JSON)
	@GetMapping("/api/chart/category-wise")
	@ResponseBody
	public Map<String, Double> categoryWise(Principal principal) {
		User user = userRepository.findByEmail(principal.getName()).orElse(null);
		LocalDate start = LocalDate.now().withDayOfMonth(1);
		LocalDate end = LocalDate.now();
		List<Transaction> txs = transactionRepository.findByUserAndDateBetween(user, start, end);
		Map<String, Double> map = new HashMap<>();
		for (Transaction t : txs) {
			String cat = t.getCategory() != null ? t.getCategory().getName() : "Other";
			map.put(cat, map.getOrDefault(cat, 0.0)
					+ (t.getType() == null || t.getType().name().equals("EXPENSE") ? t.getAmount() : 0.0));
		}
		return map;
	}

	@GetMapping("/api/chart/monthly")
	@ResponseBody
	public Map<String, Double> monthly(Principal principal) {
		User user = userRepository.findByEmail(principal.getName()).orElse(null);
		YearMonth ym = YearMonth.now();
		LocalDate start = ym.atDay(1);
		LocalDate end = ym.atEndOfMonth();
		List<Transaction> txs = transactionRepository.findByUserAndDateBetween(user, start, end);
		Map<Integer, Double> daySum = new TreeMap<>();
		for (Transaction t : txs) {
			int day = t.getDate().getDayOfMonth();
			daySum.put(day, daySum.getOrDefault(day, 0.0)
					+ (t.getType() == null || t.getType().name().equals("EXPENSE") ? t.getAmount() : 0.0));
		}
		Map<String, Double> out = new LinkedHashMap<>();
		for (Map.Entry<Integer, Double> e : daySum.entrySet()) {
			out.put(String.valueOf(e.getKey()), e.getValue());
		}
		return out;
	}

	@GetMapping("/api/chart/income-vs-expense")
	@ResponseBody
	public Map<String, Double> incomeVsExpense(Principal principal) {
		User user = userRepository.findByEmail(principal.getName()).orElse(null);
		LocalDate start = LocalDate.now().withDayOfMonth(1);
		LocalDate end = LocalDate.now();
		List<Transaction> txs = transactionRepository.findByUserAndDateBetween(user, start, end);
		double income = 0, expense = 0;
		for (Transaction t : txs) {
			if (t.getType() != null && t.getType().name().equals("INCOME"))
				income += t.getAmount();
			else
				expense += t.getAmount();
		}
		Map<String, Double> out = new LinkedHashMap<>();
		out.put("Income", income);
		out.put("Expense", expense);
		return out;
	}
}