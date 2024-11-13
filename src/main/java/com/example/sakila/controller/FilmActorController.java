package com.example.sakila.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.sakila.service.FilmActorService;
import com.example.sakila.vo.FilmActor;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FilmActorController {
	@Autowired FilmActorService filmActorService;
	
	@GetMapping("/on/removeFilmActor")
	public String removeFilmActor(FilmActor filmActor) {
		log.debug("removeFilmActor filmId: "+filmActor.getFilmId());
		log.debug("actorId: "+filmActor.getActorId());
		
		filmActorService.removeFilmActor(filmActor);
		return "redirect:/on/actorOne?actorId="+filmActor.getActorId();
	}
	
	// /on/filmOne 배우 추가
	@PostMapping("/on/addFilmActorByFilm")
	public String addFilmActorByFilm(FilmActor filmActor) {
		log.debug("addFilmActorByFilm filmId: "+filmActor.getFilmId());
		log.debug("actorId: "+filmActor.getActorId());
		
		filmActorService.addFilmActor(filmActor);
		
		return "redirect:/on/actorOne?filmId="+filmActor.getFilmId();
	}
	
	// /on/actorOne 출연 영화 추가
	@PostMapping("/on/addFilmActorByActor")
	public String addFilmActorByActor(FilmActor filmActor) {
		log.debug("addFilmByActor filmId: "+filmActor.getFilmId());
		log.debug("actorId: "+filmActor.getActorId());
		
		filmActorService.addFilmActor(filmActor);
		
		return "redirect:/on/actorOne?actorId="+filmActor.getActorId();
	}
}
