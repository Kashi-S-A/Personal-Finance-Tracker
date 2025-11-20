package com.ksa.pft.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ksa.pft.model.Budget;
import com.ksa.pft.model.User;

public interface BudgetRepository extends JpaRepository<Budget, Long> {
	List<Budget> findByUser(User user);
}
