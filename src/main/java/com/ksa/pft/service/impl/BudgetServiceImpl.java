package com.ksa.pft.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ksa.pft.model.Budget;
import com.ksa.pft.model.User;
import com.ksa.pft.repo.BudgetRepository;
import com.ksa.pft.service.BudgetService;

@Service
public class BudgetServiceImpl implements BudgetService {

	@Autowired
	private BudgetRepository budgetRepository;

	@Override
	public Budget save(Budget budget) {
		return budgetRepository.save(budget);
	}

	@Override
	public List<Budget> findByUser(User user) {
		return budgetRepository.findByUser(user);
	}
}