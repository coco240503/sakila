package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface InventoryMapper {
	// /on/inventoryList
	List<Map<String,Object>> selectInventoryListBtStore(Map<String,Object> paramMap);
	
	// /on/reomoveFilm
	Integer selectCountInventoryByFilm(Integer filmId);
}
