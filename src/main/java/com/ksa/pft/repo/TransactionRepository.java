package com.ksa.pft.repo;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ksa.pft.model.Transaction;
import com.ksa.pft.model.User;

public interface TransactionRepository extends JpaRepository<Transaction, Long> {
	List<Transaction> findByUser(User user);

	List<Transaction> findByUserAndDateBetween(User user, LocalDate start, LocalDate end);
}