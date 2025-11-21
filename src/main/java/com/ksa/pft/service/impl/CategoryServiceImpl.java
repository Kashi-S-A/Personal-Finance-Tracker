package com.ksa.pft.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ksa.pft.model.Category;
import com.ksa.pft.repo.CategoryRepository;
import com.ksa.pft.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService{

    @Autowired
    private CategoryRepository categoryRepo;

    public Category save(Category category) {
        return categoryRepo.save(category);
    }

    public List<Category> getAll() {
        return categoryRepo.findAll();
    }
}
