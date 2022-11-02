package com.sample.admincontroller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.sample.adminservice.FieldAdminService;
import com.sample.adminservice.RentalAdminService;

@Controller
@RequestMapping("/fieldAdmin")
public class FieldAdminController {
	
	private FieldAdminService service;

	public FieldAdminController(FieldAdminService service) {
		super();
		this.service = service;
	}
	
	@PostMapping("/fieldChange")
	public String changeField(@RequestParam("fieldChange") String fieldChange, Model model,
							@RequestParam("check_btn") String[] check_btn) {

		System.out.println(fieldChange);
		if(fieldChange.equals("delete")) {
			for(int i=0; i<check_btn.length; i++) {
			System.out.println(check_btn[i]);
			service.deleteSeleteField(check_btn[i]);
			}
			return "redirect:/admin/select?select=fieldAdmin";
		}else {
			
			return "redirect:/admin/select?select=fieldAdmin";
		}

	}

	
}
