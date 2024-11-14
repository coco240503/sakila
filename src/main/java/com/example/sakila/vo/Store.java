package com.example.sakila.vo;

import lombok.Data;

@Data
public class Store {
	private Integer storeId; // PK
	private Integer managerStaffId; // FK,Unique
	private Integer addressId; // FK
	private String lastUpdate;
}
