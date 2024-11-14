package com.example.sakila.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Store;

@Mapper
public interface StoreMapper {
	// /on/addStore
	int insertStore(Store store);
	
	// /on/addStaff
	List<Store> selectStoreList();
}
