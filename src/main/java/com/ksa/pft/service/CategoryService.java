package com.ksa.pft.service;

import java.util.List;

import com.ksa.pft.model.Category;

public interface CategoryService {

	public Category save(Category category);
	
	public List<Category> getAll();
}
