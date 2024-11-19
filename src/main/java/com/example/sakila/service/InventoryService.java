package com.example.sakila.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.sakila.mapper.InventoryMapper;
import com.example.sakila.vo.Inventory;

@Service
public class InventoryService {
	@Autowired InventoryMapper inventoryMapper;
	
	//
	public Integer removeInventoryByKey(Integer inventoryId) {
		return inventoryMapper.deleteInventoryByKey(inventoryId);
	}
	
	// /on/addInventory
	public Integer addInventory(Inventory inventory) {
		return inventoryMapper.insertInventory(inventory);
	}
	
	// /on/inventoryList
	public List<Map<String,Object>> getInventoryListByStore(Integer storeId, Integer currentPage,Integer rowPerPage){
		Map<String,Object> paramMap = new HashMap<>();
		paramMap.put("storeId", storeId);
		paramMap.put("rowPerPage", rowPerPage);
		Integer beginRow = (currentPage-1)*rowPerPage;
		paramMap.put("beginRow", beginRow);
		
		// 첫번째 페이지 넘버
		Integer startPagingNum = (currentPage-1)/10*10+1; // '/'=몫
		// 한페이지당 페이징개수 = 10
		Integer numPerPage = 10;
		// 마지막 페이지 넘버
		Integer endPagingNum = startPagingNum+(numPerPage-1); // 1~10, 11~20
		// 마지막은 x1~마지막페이지 (98 -> 91~98)
		Integer lastPage = this.getLastPage(rowPerPage);
		if(lastPage < endPagingNum) {
			endPagingNum = lastPage;
		}
		
		List<Map<String,Object>> inventoryList = inventoryMapper.selectInventoryListByStore(paramMap);
		
		Map<String,Object> resultMap = new HashMap<>();
		resultMap.put("startPagingNum", startPagingNum);
		resultMap.put("endPagingNum", endPagingNum);
		resultMap.put("inventoryList", inventoryList);
		
		List<Map<String,Object>> resultList = new ArrayList<>();
		resultList.add(resultMap);
		
		return resultList;
	}
	
	// inventoryList 페이징
	public Integer getLastPage(Integer rowPerPage) {
		int count = inventoryMapper.selectInventoryCount();
		int lastPage = count / rowPerPage;
		if(count%rowPerPage != 0) {
			lastPage ++;
		}
		return lastPage;
	}
	
	// /on/reomoveFilm
	public Integer getCountInventoryByFilm(Integer filmId) {
		return inventoryMapper.selectCountInventoryByFilm(filmId);
	}
}
