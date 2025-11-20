package com.ksa.pft.service;

import com.ksa.pft.dto.RegistrationDto;
import com.ksa.pft.model.User;

public interface UserService {
	User register(RegistrationDto dto);

	User findByEmail(String email);
}