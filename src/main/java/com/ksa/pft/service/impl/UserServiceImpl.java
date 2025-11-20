package com.ksa.pft.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.ksa.pft.dto.RegistrationDto;
import com.ksa.pft.model.User;
import com.ksa.pft.repo.UserRepository;
import com.ksa.pft.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Override
	public User register(RegistrationDto dto) {
		User u = new User();
		u.setName(dto.getName());
		u.setEmail(dto.getEmail());
		u.setPassword(passwordEncoder.encode(dto.getPassword()));
		return userRepository.save(u);
	}

	@Override
	public User findByEmail(String email) {
		return userRepository.findByEmail(email).orElse(null);
	}
}