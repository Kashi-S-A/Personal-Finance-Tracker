package com.ksa.pft.service.impl;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ksa.pft.model.Transaction;
import com.ksa.pft.model.User;
import com.ksa.pft.repo.TransactionRepository;
import com.ksa.pft.service.TransactionService;

@Service
public class TransactionServiceImpl implements TransactionService {

	@Autowired
	private TransactionRepository transactionRepository;

	@Override
	public Transaction save(Transaction tx) {
		return transactionRepository.save(tx);
	}

	@Override
	public List<Transaction> findByUser(User user) {
		return transactionRepository.findByUser(user);
	}

	@Override
	public List<Transaction> findByUserBetween(User user, LocalDate start, LocalDate end) {
		return transactionRepository.findByUserAndDateBetween(user, start, end);
	}

	@Override
	public void delete(Long id) {
		transactionRepository.deleteById(id);
	}
}