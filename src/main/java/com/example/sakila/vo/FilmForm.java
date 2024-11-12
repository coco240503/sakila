package com.example.sakila.vo;

import java.util.List;

import lombok.Data;

@Data
public class FilmForm {
	private String title;
	private String description;
	private Integer releaseYear;
	private int languageId; 
	private Integer originalLanguageId; 
	private int rentalDuration;
	private Double rentalRate;
	private Integer length;
	private Double replacementCost;
	private String rating;
	private List<String> specialFeatures; // private String[] specialFeatures;
}
