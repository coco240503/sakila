package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Film;

@Mapper
public interface FilmMapper {
	Map<String,Object> selectFilmOne(int fileId);
	
	// /on/actorOne
	List<Film> selectFilmTitleListByActor(int actorId);
}
