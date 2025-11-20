package com.ksa.pft.util;

public class AutoCategorizer {
	public static String categorize(String description) {
		if (description == null)
			return "Other";
		String d = description.toLowerCase();
		if (d.contains("fuel") || d.contains("petrol") || d.contains("diesel"))
			return "Transport";
		if (d.contains("uber") || d.contains("ola") || d.contains("taxi"))
			return "Transport";
		if (d.contains("grocery") || d.contains("supermarket") || d.contains("market"))
			return "Groceries";
		if (d.contains("restaurant") || d.contains("cafe") || d.contains("hotel") || d.contains("dine"))
			return "Dining";
		if (d.contains("rent"))
			return "Rent";
		if (d.contains("salary") || d.contains("payroll"))
			return "Salary";
		if (d.contains("amazon") || d.contains("flipkart") || d.contains("shopping"))
			return "Shopping";
		return "Other";
	}
}