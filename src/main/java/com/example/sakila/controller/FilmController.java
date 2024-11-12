package com.example.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.ActorService;
import com.example.sakila.service.CategoryService;
import com.example.sakila.service.FilmService;
import com.example.sakila.service.InventoryService;
import com.example.sakila.service.LanguageService;
import com.example.sakila.vo.Actor;
import com.example.sakila.vo.Category;
import com.example.sakila.vo.Film;
import com.example.sakila.vo.FilmForm;
import com.example.sakila.vo.Language;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FilmController {
	@Autowired FilmService filmService;
	@Autowired ActorService actorService;
	@Autowired LanguageService languageService;
	@Autowired CategoryService categoryService;
	@Autowired InventoryService inventoryService;
	
	@PostMapping("/on/modifyFilm")
	public String modifyFilm(Film film) {
		log.debug(film.toString());
		
		filmService.modifyFilm(film);
		return "redirect:/on/filmOne?filmId="+film.getFilmId();
	}
	@GetMapping("/on/modifyFilm")
	public String modifyFilm(Model model, @RequestParam int filmId) {
		Map<String,Object> filmMap = filmService.getFilmOne(filmId);
		model.addAttribute("film",filmMap);
		return "on/modifyFilm";
	}
	
	
	@GetMapping("/on/removeFilm")
	public String removeFilm(Model model, @RequestParam Integer filmId) {
		Integer count = inventoryService.getCountInventoryByFilm(filmId);
		if(count != 0) {
			// msg 보내기 위해 filmOne 코드와 중복시킴
			Map<String,Object> film = filmService.getFilmOne(filmId);
			log.debug(film.toString());
			
			List<Actor> actorList = actorService.getActorListByFilm(filmId);
			
			model.addAttribute("film",film);
			model.addAttribute("actorList",actorList);
			model.addAttribute("removeFilmMsg", "film이 inventory에 존재합니다");
			return "on/filmOne"; // filmOne 포워딩
			// return "redirect:/on/filmOne"; 만 하면 msg 추가는 힘듦
			
		}
		filmService.removeFilmByKey(filmId);
		
		return "redirect:/on/filmList";
	}
	
	@GetMapping("/on/filmList")
	public String filmList(Model model
							, @RequestParam(required=false) Integer categoryId
							, @RequestParam(defaultValue="1") int currentPage
							, @RequestParam(defaultValue="10") int rowPerPage) {
		log.debug("categoryId: "+categoryId);
		log.debug("currentPage: "+currentPage);
		log.debug("rowPerPage: "+rowPerPage);
		
		List<Map<String,Object>> filmList = filmService.getFilmList(categoryId, currentPage, rowPerPage);
		log.debug("filmList: ",filmList);
		model.addAttribute("filmList",filmList);
		
		// Model에 categoryList 추가
		List<Category> categoryList = categoryService.getCategoryList();
		log.debug("categoryList: "+categoryList);
		model.addAttribute("categoryList",categoryList);
		
		// 같이 넘겨야 할 모델값 : 현재 페이지, 현재 카테고리Id
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("currentCategoryId",categoryId);
		log.debug("currentCategoryId: "+categoryId);
		
		return "on/filmList";
	}
	
	@PostMapping("/on/addFilm")
	public String addFilm(FilmForm filmForm) { 
		log.debug(filmForm.toString());
		// Film타입으로 받으면 specialFeatures를 List로 받을수X
		// filmService: FilmForm -> Film
		filmService.addFilm(filmForm);
		
		return "redirect:/on/filmList";
	}
	
	// 영화 추가
	@GetMapping("/on/addFilm")
	public String addFilm(Model model) {
		// languageList
		List<Language> languageList = languageService.getLanguageList();
		log.debug(languageList.toString());
		model.addAttribute("languageList", languageList);
		return "on/addFilm";
	}
	
	@GetMapping("/on/filmOne")
	public String filmOne(Model model,@RequestParam int filmId) {
		
		// 영화 정보
		Map<String,Object> film = filmService.getFilmOne(filmId);
		log.debug(film.toString());
		
		// 전체 카테고리 리스트
		List<Category> allCategoryList = categoryService.getCategoryList();
		
		// 현재 영화의 카테고리 리스트
		List<Map<String,Object>> filmCategoryList = categoryService.selectFilmCategoryListByFilm(filmId);
		
		// 출연 배우 리스트
		List<Actor> actorList = actorService.getActorListByFilm(filmId);
		
		model.addAttribute("film",film);
		model.addAttribute("actorList",actorList);
		model.addAttribute("allCategoryList",allCategoryList);
		model.addAttribute("filmCategoryList",filmCategoryList);
		
		return "on/filmOne";
	}
	
}
