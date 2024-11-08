package com.example.sakila.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.ActorFile;

@Mapper
public interface ActorFileMapper {
	// /on/removeActor
	int deleteActorFileByActor(int actorId);
	
	// /on/removeActorFile:Service - 파일이름
	ActorFile selectActorFileOne(int actorFileId);
	
	// /on/removeActorFile - actor 이미지 파일 삭제
	int deleteActorFile(int actorFileId);
	
	// /on/actorOne
	List<ActorFile> selectActorFileListByActor(int actorId);
	
	int insertActorFile(ActorFile actorFile);
}
