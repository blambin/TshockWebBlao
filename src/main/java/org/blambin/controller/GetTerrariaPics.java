package org.blambin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.blambin.common.FetchTerrariaPics;

@Controller
@RequestMapping("/getpics")
public class GetTerrariaPics {

	@RequestMapping("/items")
	public void getItems(HttpSession session){
		FetchTerrariaPics.getItemsPics(session);
	}
	
	@RequestMapping("/buffs")
	public void getBuffs(HttpSession session){
		FetchTerrariaPics.getBuffPics(session);
	}
}
