package com.example.sakila.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.FilmMapper;
import com.example.sakila.vo.Film;
import com.example.sakila.vo.FilmForm;

@Service
@Transactional
public class FilmService {
	@Autowired FilmMapper filmMapper;
	
	// /on/addFilm
	public int addFilm(FilmForm filmForm) {
		Film film = new Film();
		// FilmForm -> Film
		film.setTitle(filmForm.getTitle()); // film의 title을 filmForm의 title로
		if(filmForm.getDescription().equals("")) {
			film.setDescription(null);
		} else {
			film.setDescription(filmForm.getDescription());
		} // film.setDescription(filmForm.getDescription().equals("")? null : filmForm.getDescription());
		film.setReleaseYear(filmForm.getReleaseYear());
		film.setLanguageId(filmForm.getLanguageId());
		film.setOriginalLanguageId(filmForm.getOriginalLanguageId());
		film.setRentalDuration(filmForm.getRentalDuration());
		film.setRentalRate(filmForm.getRentalRate());
		film.setLength(filmForm.getLength());
		film.setReplacementCost(filmForm.getReplacementCost());
		film.setRating(filmForm.getRating());
		
		if(filmForm.getSpecialFeatures()==null) {
			film.setSpecialFeatures(null);
		} else {
			// sepecialFeatures 배열 -> ,문자열
			String sepecialFeatures = filmForm.getSpecialFeatures().get(0);
			for(int i=1; i < filmForm.getSpecialFeatures().size(); i++) {
				sepecialFeatures += "," + filmForm.getSpecialFeatures().get(i);
			}
			film.setSpecialFeatures(sepecialFeatures);
		}
		return filmMapper.insertFilm(film);
	}
	
	// /on/filmOne
	public Map<String,Object> getFilmOne(int filmId){
		return filmMapper.selectFilmOne(filmId);
	}
	
	// /on/actorOne
	public List<Film> getFilmTitleListByActor(int actorId){
		return filmMapper.selectFilmTitleListByActor(actorId);
	}
}
