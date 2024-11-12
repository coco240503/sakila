package com.example.sakila.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.sakila.service.ActorFileService;
import com.example.sakila.service.ActorService;
import com.example.sakila.service.FilmService;
import com.example.sakila.vo.Actor;
import com.example.sakila.vo.ActorFile;
import com.example.sakila.vo.ActorForm;
import com.example.sakila.vo.Film;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ActorController {
	@Autowired ActorService actorService;
	@Autowired ActorFileService actorFileService;
	@Autowired FilmService filmService;
	
	// /on/actorOne - actor 삭제
	@GetMapping("/on/removeActor")
	public String removeActor(HttpSession session, @RequestParam int actorId) {
		String path = session.getServletContext().getRealPath("/upload/");
		actorService.removeActor(actorId, path);
		return "redirect:/on/actorList";
	}
	
	@PostMapping("/on/modifyActor")
	public String modifyActor(Actor actor) {
		log.debug(actor.toString());
		
		int row = actorService.modifyActor(actor);
		
		return "redirect:/on/actorOne?actorId="+actor.getActorId();
	}
	
	// /on/actorOne - actor 수정
	@GetMapping("/on/modifyActor")
	public String modifyActor(Model model,@RequestParam int actorId) {
		Actor actor = actorService.getActorOne(actorId);
		model.addAttribute("actor",actor);
		return "on/modifyActor";
	}
	
	@GetMapping("/on/actorOne")
	public String actorOne(Model model, @RequestParam int actorId
							, @RequestParam(defaultValue = "") String searchTitle) { // searchWord가 공백이면 actorOne 요청, 공백 아니면 film검색 요청
		Actor actor = actorService.getActorOne(actorId);
		List<ActorFile> actorFileList = actorFileService.getActorFileListByActor(actorId);
		List<Film> filmList = filmService.getFilmTitleListByActor(actorId);
		log.debug(actor.toString());
		log.debug(actorFileList.toString());
		log.debug(filmList.toString());
		
		if(searchTitle.equals("") == false) { // 영화 제목 검색어가 있다면 -> film 검색 결과 리스트 추가
			log.debug("searchTitle: "+ searchTitle);
			List<Film> searchFilmList = filmService.getFilmListByTitle(searchTitle);
			model.addAttribute("searchFilmList",searchFilmList);
		}
		
		model.addAttribute("actor",actor);
		model.addAttribute("actorFileList",actorFileList);
		model.addAttribute("filmList",filmList);
		
		return "on/actorOne";
	}
	
	@GetMapping("/on/actorList")
	public String actorList(Model model
							,@RequestParam(defaultValue="1") int currentPage
							,@RequestParam(defaultValue="10") int rowPerPage
							,@RequestParam(required=false) String searchWord) { // 디폴트:required=true->400에러남-아무것도 넘어오지않음
		log.debug(searchWord);
		
		int lastPage = actorService.getLastPage(rowPerPage, searchWord);
		List<Actor> actorList = actorService.getActorList(currentPage, rowPerPage, searchWord);
		
		model.addAttribute("actorList",actorList);
		model.addAttribute("currentPage", currentPage);
	    model.addAttribute("lastPage", lastPage);
	    model.addAttribute("searchWord", searchWord);
		
		return "on/actorList";
	}
	
	
	@GetMapping("/on/addActor")
	public String addActor() {
		return "on/addActor";
	}
	
	@PostMapping("/on/addActor")
	public String addActor(HttpSession session,Model model,ActorForm actorForm) { // input type="file"
		/*
		log.debug(actorForm.getFirstName());
		log.debug(actorForm.getLastName());
		log.debug("actor file: "+actorForm.getActorFile());
		if(actorForm.getActorFile() != null) {
			log.debug("actorFile size : "+actorForm.getActorFile().size());
		} */
		List<MultipartFile> list = actorForm.getActorFile();
		if(list != null && list.size()!=0) { // 첨부된 파일이 있다면(첨부되지 않을수도 있으니..)
			for(MultipartFile f : list) { // *.jpeg, *.png만 가능
				if(!(f.getContentType().equals("image/jpeg") || f.getContentType().equals("image/png"))) {
					model.addAttribute("msg","이미지 파일만 첨부 가능합니다");
					return "on/addActor";
				}
			}
		}
		String path = session.getServletContext().getRealPath("/upload/");
		actorService.addActor(actorForm,path);
		
		return "redirect:/on/actorList";
	}
}
