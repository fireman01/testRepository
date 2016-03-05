package com.common.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONException;

public class JsonTypeConversion {

	public JsonTypeConversion() {
		
	}
	
	/**
	 * <p>[将json数据转换为listList<Map<String,Object>>类型数据]</p>
	 *
	 * @comment	[注释说明]
	 * @author	王宝顺, 2015年4月26日
	 *
	 * @param jsonData
	 * @return
	 */
	public static List<Map<String,Object>> jsonTypetransformList(String jsonData) throws JSONException{
		
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		try{
			JSONArray jsonArray = JSONArray.fromObject(jsonData);
			list = (List)jsonArray; 
		}catch(JSONException e){
			System.out.println("数据："+jsonData+"不能转换成为list类型，请检查被转换数据是否为json格式！！！");
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		  
		return list;
	}
	/**
	 * <p>[将json数据转换为Map<String,Object>类型数据]</p>
	 *
	 * @comment	[注释说明]
	 * @author	王宝顺, 2015年4月26日
	 *
	 * @param jsonData
	 * @return
	 */
	public static Map<String,Object> jsonTypetransformMap(String jsonData) throws JSONException{
		
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> map = new HashMap<String, Object>();
		try{
			JSONArray jsonArray = JSONArray.fromObject(jsonData);  
			list = (List)jsonArray; 
		    map = list.get(0);
		}catch(JSONException e){
			System.out.println("数据："+jsonData+"不能转换成为list类型，请检查被转换数据是否为json格式！！！");
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return map;
	}
	/**
	 * <p>[将List数据转换为json类型数据]</p>
	 *
	 * @comment	[注释说明]
	 * @author	王宝顺, 2015年4月26日
	 *
	 * @param jsonData
	 * @return
	 */
	public static String listTypetransformjson(List<Map<String,Object>> param) throws JSONException{
		String json = "";
		try{
			json = JSONArray.fromObject(param).toString();
		}catch(JSONException e){
			System.out.println("数据："+param+"不能转换成为json类型！！！");
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return json;
	}
	/**
	 * <p>[将Map数据转换为json类型数据]</p>
	 *
	 * @comment	[注释说明]
	 * @author	王宝顺, 2015年4月26日
	 *
	 * @param jsonData
	 * @return
	 */
	public static String mapTypetransformjson(Map<String,Object> param) throws JSONException{
		String json = "";
		try{
			json = JSONArray.fromObject(param).toString();
		}catch(JSONException e){
			System.out.println("数据："+param+"不能转换成为json类型！！！");
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return json;
	}

}
