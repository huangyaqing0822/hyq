package com.lxit.crmsystem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/views")
public class Action {

	@RequestMapping("/{vname}")
	public String index(@PathVariable("vname") String vname) {
		return vname;
	}
	/*@RequestMapping("/role_add")
	public String role_add(){
		return "role_add";
	}*/
}
