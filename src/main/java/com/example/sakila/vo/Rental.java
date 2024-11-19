package com.example.sakila.vo;

import lombok.Data;

@Data
public class Rental {
	private Integer rentalId; // PK
	private String rentalDate; // Unique
	private Integer inventoryId; // FK,Unique
	private Integer customerId; // FK,Unique
	private String returnDate;
	private Integer staffId; // FK
	private String lastUpdate;
}
