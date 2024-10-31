package com.example.sakila.vo;

import lombok.Data;

@Data
public class FilmCategory {
	private int filmId; // PK,FK
	private int categoryId; // PK,FK
	private String lastUpdate;
}
