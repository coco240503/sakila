package com.example.sakila.vo;

import lombok.Data;

@Data
public class Address {
	private int addressId; // PK
	private String address;
	private String address2;
	private String distrint;
	private int cityId; // FK
	private String postalCode;
	private String phone;
	private String lastUpdate;
}
