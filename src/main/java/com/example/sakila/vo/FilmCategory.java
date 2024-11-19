package com.example.sakila.vo;

import lombok.Data;

@Data
public class FilmCategory {
	private Integer filmId; // PK,FK
	private Integer categoryId; // PK,FK
	private String lastUpdate;
}
