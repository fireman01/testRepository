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
import com.dictionary.service.DictionaryService;

@Controller
@RequestMapping("/dictionary")
public class DictionaryController { 

	@Autowired
	private DictionaryService service;
	
	@RequestMapping("/getDictionary")
	public void getDictionary(HttpServletRequest request,HttpServletResponse response){
		List<Map<String, Object>> paramMap  = new ArrayList<Map<String,Object>>();
		JSONObject jsonObject = JSONObject.fromObject(request.getParameter("tablelist"));
		JSONArray jsons = JSONArray.fromObject(jsonObject.get("list"));
		 for (Object o : jsons)
	        {
	            JSONObject jsonNode = JSONObject.fromObject(o);
	            JSONObject jsontemp = JSONObject.fromObject(jsonNode.get("map"));
	            Map<String, Object> param = new HashMap<String, Object>();
	            param.put("table",jsontemp.getString("table"));
	            param.put("value", jsontemp.getString("value"));
	            param.put("name", jsontemp.getString("name"));
	            param.put("order", jsontemp.getString("order"));
	            param.put("where", jsontemp.getString("where"));
	            //...
	            paramMap.add(param);
	        }
		List<Map<String, Object>> list = service.getDictionary(paramMap);
		JSONArray jsonarray = JSONArray.fromObject(list);
		response.setContentType("text/json charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(jsonarray.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("/cityList")
	public void getCity(HttpServletRequest request,HttpServletResponse response ) throws IOException{
		Map<String, Object> map = FormDataCollectUtil.getInstance().getFormData(request);
		List<Map<String,Object>> list = service.getCslist(map);
		JSONArray jsonarray = JSONArray.fromObject(list);
		response.setContentType("text/json charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonarray.toString());
	}
	
}
