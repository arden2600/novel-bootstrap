package api.novel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("demo")
public class Demozz {

	@RequestMapping("/toDemo")
	public String toDemoPage(){
		return "demo";
	}
}
