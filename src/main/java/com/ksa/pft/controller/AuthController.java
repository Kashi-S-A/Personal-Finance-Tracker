package com.ksa.pft.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.ksa.pft.dto.RegistrationDto;
import com.ksa.pft.model.User;
import com.ksa.pft.service.UserService;

@Controller
public class AuthController {

	@Autowired
	private UserService userService;

	@GetMapping("/login")
	public String loginPage() {
		return "login";
	}

	@GetMapping("/register")
	public String registerPage(Model model) {
		model.addAttribute("user", new RegistrationDto());
		return "register";
	}

	@PostMapping("/register")
	public String register(@ModelAttribute("user") RegistrationDto dto, Model model) {
		if (userService.findByEmail(dto.getEmail()) != null) {
			model.addAttribute("error", "Email already in use");
			return "register";
		}
		User u = userService.register(dto);
		return "redirect:/login";
	}
}