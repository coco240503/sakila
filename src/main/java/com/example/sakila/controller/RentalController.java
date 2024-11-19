package com.example.sakila.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.CustomerService;
import com.example.sakila.service.RentalService;
import com.example.sakila.util.TeamColor;
import com.example.sakila.vo.Customer;
import com.example.sakila.vo.Rental;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class RentalController {
	@Autowired CustomerService customerService;
	@Autowired RentalService rentalService;
	
	@GetMapping("/on/addRental")
	public String addRental(Model model, @RequestParam Integer inventoryId,@RequestParam(required = false) String searchName) {
		model.addAttribute("inventoryId",inventoryId); 
			// request에 담겨있지만 view에서 더 짧게 표현하게 함(가독성)->${inventoryId} = request.getAttribute
			// model에 담지 않으면 ${param.inventoryId} = request.getParameter
		log.debug(TeamColor.YELLOW+"inventoryId: "+inventoryId+TeamColor.RESET);
		
		log.debug(TeamColor.RED+"searchName: "+searchName+TeamColor.RESET);
		if(searchName != null && !searchName.equals("")) {
			List<Customer> customerList = customerService.getCustomerListByName(searchName);
			log.debug(TeamColor.YELLOW+"customerList: "+customerList.toString()+TeamColor.RESET);
			model.addAttribute("customerList",customerList);
		}
		return "on/addRental";
	}
	
	@PostMapping("/on/addRental")
	public String addRental(Rental rental) {
		Integer row = rentalService.addRental(rental);
		log.debug("addRental row: "+row.toString());
		return "redirect:/on/customerOne?customerId="+rental.getCustomerId();
	}
}
