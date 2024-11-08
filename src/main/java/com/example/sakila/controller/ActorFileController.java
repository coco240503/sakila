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
import com.example.sakila.vo.ActorForm;

import jakarta.servlet.http.HttpSession;


@Controller
public class ActorFileController {
	@Autowired ActorFileService actorFileService;
	
	@GetMapping("/on/removeActorFile")
	public String removeActorFile(HttpSession session, @RequestParam int actorFileId, @RequestParam int actorId) {
		String path = session.getServletContext().getRealPath("/upload/");
		actorFileService.removeActorFile(actorFileId, path);
		return "redirect:/on/actorOne?actorId="+actorId;
	}
	
	@GetMapping("/on/addActorFile")
	public String addActorFile(Model model,@RequestParam int actorId) {
		model.addAttribute("actorId",actorId);
		return "on/addActorFile";
	}	
	
	@PostMapping("/on/addActorFile")
	public String addActorFile(HttpSession session,Model model,ActorForm actorForm) {
		// 이미지 파일 검사 - 여러 파일 중 하나라도 이미지 파일이 아니면 return
		List<MultipartFile> list = actorForm.getActorFile();
		for(MultipartFile f : list) { // *.jpeg, *.png만 가능
			if(!(f.getContentType().equals("image/jpeg") || f.getContentType().equals("image/png"))) {
				model.addAttribute("msg","이미지 파일만 첨부 가능합니다");
				return "on/addActorFile";
			}
		}
		// upload 파일에 저장
		String path = session.getServletContext().getRealPath("/upload/");
		actorFileService.addActorFile(actorForm,path);
		return "redirect:/on/actorOne?actorId="+actorForm.getActorId(); // redirect 할 때는 넘겨줄 메개값 주의
	}
	
}
