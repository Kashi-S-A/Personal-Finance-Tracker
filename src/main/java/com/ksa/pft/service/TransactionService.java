package com.ksa.pft.service;

import java.time.LocalDate;
import java.util.List;

import com.ksa.pft.model.Transaction;
import com.ksa.pft.model.User;

public interface TransactionService {
	Transaction save(Transaction tx);

	List<Transaction> findByUser(User user);

	List<Transaction> findByUserBetween(User user, LocalDate start, LocalDate end);

	void delete(Long id);
}