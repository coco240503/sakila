package com.example.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.FilmActor;

@Mapper
public interface FilmActorMapper {
	// film 삭제 시 film_actor 삭제
	Integer deleteFilmActorByFilm(int filmId);
	
	// actor 삭제 시 film_actor들 삭제
	int deleteFileByActor(int actorId);
	
	int deleteFileActor(FilmActor filmActor);
	
	int insertFileActor(FilmActor filmActor);
}
