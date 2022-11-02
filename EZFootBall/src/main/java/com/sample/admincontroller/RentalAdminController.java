package com.sample.admincontroller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sample.adminservice.RentalAdminService;

@Controller
@RequestMapping("/rentalAdmin")
public class RentalAdminController {
	
	private RentalAdminService service;

	public RentalAdminController(RentalAdminService service) {
		super();
		this.service = service;
	}
	
//	@GetMapping("/rentalList")
//	public String showRentalList(Model model) {
//		return "adminPage/fieldInfo/fieldList";
//	}
	
}
