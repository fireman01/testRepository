package com.dictionary.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.common.util.FormDataCollectUtil;
import com.common.util.FormatUtil;
import com.dictionary.service.DictionaryService;

@Controller
@RequestMapping("/dictionary")
public class DictionaryController { 

	@Autowired
	private DictionaryService service;
	
	@RequestMapping("/getFoods")
	public void getDictionary(HttpServletRequest request,HttpServletResponse response){
		JSONArray jsonarray = FormatUtil.formatList2JsonArray(service.getFoods());
		response.setContentType("text/json charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(jsonarray.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
