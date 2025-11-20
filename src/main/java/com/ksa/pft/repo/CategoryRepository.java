package com.ksa.pft.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ksa.pft.model.Category;
import com.ksa.pft.model.User;

public interface CategoryRepository extends JpaRepository<Category, Long> {
	List<Category> findByUser(User user);
}