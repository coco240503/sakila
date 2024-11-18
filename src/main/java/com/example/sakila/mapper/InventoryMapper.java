package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Inventory;

@Mapper
public interface InventoryMapper {
	// /on/removeInventoryByKey
	Integer deleteInventoryByKey(Integer inventoryId);
	
	// /on/addInventory
	Integer insertInventory(Inventory inventory);
	
	// /on/inventoryList
	List<Map<String,Object>> selectInventoryListBtStore(Map<String,Object> paramMap);
	
	// /on/reomoveFilm
	Integer selectCountInventoryByFilm(Integer filmId);
}
