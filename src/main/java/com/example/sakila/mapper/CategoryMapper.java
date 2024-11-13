package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Category;
import com.example.sakila.vo.FilmCategory;

@Mapper
public interface CategoryMapper {
	// /on/removeFilmCategory - filmOne에서 카테고리 삭제
	Integer deleteFilmCategory(FilmCategory filmCategory);
	
	// /on/addFilmCategory - filmOne에서 카테고리 추가
	Integer insertFilmCategory(FilmCategory filmCategory);
	
	// /on/ - filmOne
	List<Map<String,Object>> selectFilmCategoryListByFilm(Integer filmId);
	
	List<Category> selectCategoryList();
	
	Integer deleteFilmCategoryByFilm(int filmId);
	
	Integer deleteFilmCategoryByCategory();
}
