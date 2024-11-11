package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Film;

@Mapper
public interface FilmMapper {
	// categoryId가 null이나 0이 아닐 때 
	List<Map<String,Object>> selectFilmListByCategory(Map<String,Object> paramMap);
	
	//categoryId가 null이거나 0일 때  filmList
	List<Map<String,Object>> selectFilmList(Map<String,Object> paramMap);
	
	// /on/actorOne film 검색
	List<Film> selectFilmListByTitle(String searchTitle);
	
	// addFilm
	int insertFilm(Film film);
	
	// film X language
	Map<String,Object> selectFilmOne(int fileId);
	
	// /on/actorOne
	List<Film> selectFilmTitleListByActor(int actorId);
}
