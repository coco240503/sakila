package com.example.sakila.vo;

import lombok.Data;

@Data
public class Rental {
	private int rentalId; // PK
	private String rentalDate; // Unique
	private int inventoryId; // FK,Unique
	private int customerId; // FK,Unique
	private String returnDate;
	private int staffId; // FK
	private String lastUpdate;
}
