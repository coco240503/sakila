package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.sakila.vo.Actor;

@Mapper
public interface ActorMapper {
	// /on/filmOne : searchName 검색 결과
	List<Actor> selectActorListByActor(String searchName);
	
	// /on/actorOne
	int deleteActor(int actorId);
	
	int updateActor(Actor actor);
	
	// /on/filmOne
	List<Actor> selectActorListByFilm(int filmId);
	
	// /on/actorOne
	Actor selectActorOne(int actorId);
	
	// /on/actorList
	List<Actor> selectActorList(Map<String,Object> map);
	
	int insertActor(Actor actor);
	
	int selectActorCount(@Param("searchWord") String searchWord);
}
