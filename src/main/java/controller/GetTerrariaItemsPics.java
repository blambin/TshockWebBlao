package controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import common.FetchTerrariaPics;

@Controller
@RequestMapping("/getpics")
public class GetTerrariaItemsPics {

	@RequestMapping("/items")
	public void getItems(HttpSession session){
		FetchTerrariaPics.getItemsPics(session);
	}
}
