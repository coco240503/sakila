package com.example.sakila.vo;

import lombok.Data;

@Data
public class Film {
	private int filmId; // PK
	private String title;
	private String description; // 기본값 NULL
	private Integer releaseYear; // 기본값 NULL
	private int languageId; // FK
	private Integer originalLanguageId; // FK // NULL
	private int rentalDuration;
	private double rentalRate;
	private Integer length; // 기본값 NULL(int 대신 Integer)
	private double replacementCost;
	private String rating;
	private String specialFeatures; // 기본값 NULL
	private String lastUpdate;
}
