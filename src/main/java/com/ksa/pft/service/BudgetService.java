package com.ksa.pft.service;

import java.util.List;

import com.ksa.pft.model.Budget;
import com.ksa.pft.model.User;

public interface BudgetService {
	Budget save(Budget budget);

	List<Budget> findByUser(User user);
}