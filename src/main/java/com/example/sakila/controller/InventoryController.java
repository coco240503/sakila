package com.example.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.FilmService;
import com.example.sakila.service.InventoryService;
import com.example.sakila.vo.Film;
import com.example.sakila.vo.Inventory;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class InventoryController {
	@Autowired InventoryService inventoryService;
	@Autowired FilmService filmService;
	
	@GetMapping("/on/removeInventoryByKey")
	public String removeInventoryByKey(Inventory inventory) {
		inventoryService.removeInventoryByKey(inventory.getInventoryId());
		return "redirect:/on/inventoryList?storeId="+inventory.getStoreId();
	}
	
	// addInventory 폼 제출
	@PostMapping("/on/addInventory")
	public String addInventory(Inventory inventory) {
		inventoryService.addInventory(inventory);
		return "redirect:/on/inventoryList?storeId="+inventory.getStoreId();
	}
	
	@GetMapping("/on/addInventory")
	public String addInventory(Model model,@RequestParam Integer storeId,@RequestParam(required=false) String searchTitle) {
		model.addAttribute("storeId",storeId); // 모델이 안 담아도 되지만 형식 통일을 위한 것
		
		// btnSearchTitle
		if(searchTitle != null && !searchTitle.equals("")) {
			log.debug("searchTitle: "+searchTitle);
			List<Film> filmList = filmService.getFilmListByTitle(searchTitle);
			model.addAttribute("filmList",filmList);
			model.addAttribute("searchTitle", searchTitle);
		}
		return "on/addInventory";
	}
	
	@GetMapping("/on/inventoryList")
	public String inventoryList(Model model
								,@RequestParam Integer storeId
								,@RequestParam(defaultValue="1") Integer currentPage
								,@RequestParam(defaultValue="10") Integer rowPerPage) {
		List<Map<String,Object>> result = inventoryService.getInventoryListByStore(storeId, currentPage, rowPerPage);
		Map<String,Object> resultMap = result.get(0); // List의 첫 번째 Map을 가져옴
		
		model.addAttribute("inventoryList", resultMap.get("inventoryList"));
		model.addAttribute("storeId",storeId);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startPagingNum", resultMap.get("startPagingNum"));
		model.addAttribute("endPagingNum", resultMap.get("endPagingNum"));
		
		return "on/inventoryList";
	}
	
}
