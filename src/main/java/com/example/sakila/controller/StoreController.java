package com.example.sakila.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.sakila.service.StaffService;
import com.example.sakila.service.StoreService;
import com.example.sakila.vo.Staff;
import com.example.sakila.vo.Store;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StoreController {
	@Autowired StoreService storeService;
	@Autowired StaffService staffService;
	
	// store 추가
	@GetMapping("/on/addStore")
	public String addStore(Model model) {
		// managerStaffId 입력을 위한 staffList 불러오기
		Staff staff = new Staff();
		List<Staff> staffList = staffService.getStaffListByStore(staff);
		model.addAttribute("staffList",staffList);
		return "on/addStore";
	}
	
	@PostMapping("/on/addStore")
	public String addStore(Store store) {
		log.debug("addStore: "+store.toString());
		
		int row = storeService.addStore(store);
		if(row == 0) { // add 실패 시 입력페이지로 포워딩
			return "on/addStore"; 
		}
		return "redirect:/on/storeList"; // 추가 성공하면 storeList로
	}
	
	// storeList
	@GetMapping("/on/storeList")
	public String storeList(Model model) {
		List<Store> storeList = storeService.getStoreList();
		model.addAttribute("storeList", storeList);
		return "on/storeList";
	}
}
