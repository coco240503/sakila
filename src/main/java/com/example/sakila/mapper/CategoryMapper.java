package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Category;

@Mapper
public interface CategoryMapper {
	List<Map<String,Object>> selectFilmCategoryListByFilm(Integer filmId);
	
	List<Category> selectCategoryList();
	
	Integer deleteFilmCategoryByFilm(int filmId);
	
	Integer deleteFilmCategoryByCategory();
}
