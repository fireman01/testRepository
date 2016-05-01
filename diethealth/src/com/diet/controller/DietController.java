package com.diet.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.common.util.CacheUtil;
import com.common.util.FormDataCollectUtil;
import com.diet.service.DietService;


@Controller
@RequestMapping("/diet")
public class DietController {
	
	@Autowired(required=true)
	private DietService dietService;
	
	private Logger log = Logger.getLogger(DietController.class);
	
	@RequestMapping("/diet_edit")
	public  String toDietForm(HttpServletRequest request, Model model){
		model.addAttribute("mainfoodList",CacheUtil.getInstance().getMainFoodList());
		model.addAttribute("meatList",CacheUtil.getInstance().getMeatList());
		model.addAttribute("vegetablesList",CacheUtil.getInstance().getVegetablesList());
		model.addAttribute("drinkList",CacheUtil.getInstance().getDrinkList());
		model.addAttribute("nutList",CacheUtil.getInstance().getNutList());
		model.addAttribute("fruitsList",CacheUtil.getInstance().getFruitsList());
		return "diet/diet_edit";
	}
	
	
	@RequestMapping("food_add")
	public String doctorAdd(HttpServletRequest request){
		return "diet/food_add";
	}
	
	@RequestMapping("/saveDiet")
	public  void addUser(HttpServletRequest request,HttpServletResponse response){
		Map<String, Object> map = FormDataCollectUtil.getInstance().getFormData(request); 
		try {
			String result = dietService.saveDiet(map);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(result);
			} catch (Exception e) {
				log.error(e);
			}
	}
	
	@RequestMapping("/food_list")
	public String getFoodListWithPage(HttpServletRequest request,Model model){
		Map<String, Object> map = FormDataCollectUtil.getInstance().getFormDataWithPage(request);
		List<Map<String, Object>> list = dietService.getFoodListWithPage(map);
		model.addAttribute("foodList",list);
		model.addAttribute("curPage",map.get("curPage"));
		int total = dietService.countFoodTotal();
		int numPerPage = (Integer)map.get("numPerPage");
		int totalPage = (int)Math.ceil((total*1.0)/numPerPage);
		model.addAttribute("totalPage",totalPage);
		return "diet/food_list";
	}
	
	@RequestMapping("/diet_list")
	public String getDietListWithPage(HttpServletRequest request,Model model){
		Map<String, Object> map = FormDataCollectUtil.getInstance().getFormDataWithPage(request);
		HttpSession session = request.getSession();
		String pId = (String)session.getAttribute("pId");
		map.put("pId", pId);
		List<Map<String, Object>> list = dietService.getDietList(map);
		model.addAttribute("dietList",list);
		model.addAttribute("curPage",map.get("curPage"));
		int total = dietService.countDietTotal(map);
		int numPerPage = (Integer)map.get("numPerPage");
		int totalPage = (int)Math.ceil((total*1.0)/numPerPage);
		model.addAttribute("totalPage",totalPage);
		return "diet/diet_list";
	}
	
	@RequestMapping("/dietary_list")
	public String getDietList(HttpServletRequest request,Model model){
		Map<String, Object> map = FormDataCollectUtil.getInstance().getFormDataWithPage(request);
		HttpSession session = request.getSession();
		List<Map<String, Object>> list = dietService.getDietList(map);
		model.addAttribute("dietList",list);
		model.addAttribute("curPage",map.get("curPage"));
		int total = dietService.countDietTotal(map);
		int numPerPage = (Integer)map.get("numPerPage");
		int totalPage = (int)Math.ceil((total*1.0)/numPerPage);
		model.addAttribute("totalPage",totalPage);
		return "diet/dietary_list";
	}
	
	
	@RequestMapping("food_edit")
	public String patientEdit(HttpServletRequest request, Model model){
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		model.addAttribute("food", dietService.showFoodInfo(param));
		return "diet/food_edit";
	}
	
	@RequestMapping("diet_info")
	public String getDietInfo(HttpServletRequest request, Model model){
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		model.addAttribute("dietList", dietService.showDietInfo(param));
		model.addAttribute("advice", dietService.showAdviceInfo(param));
		return "diet/diet_info";
	}
	
	@RequestMapping("dietary_info")
	public String getDietaryInfo(HttpServletRequest request, Model model){
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		model.addAttribute("dietList", dietService.showDietInfo(param));
		model.addAttribute("bg", dietService.showBloodGlucoseInfo(param));
		model.addAttribute("advice", dietService.showAdviceInfo(param));
		return "diet/dietary_info";
	}
	
	@RequestMapping("bg_edit")
	public String bloodGlucoseEdit(HttpServletRequest request, Model model){
		HttpSession session = request.getSession();
		String pId = (String)session.getAttribute("pId");
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("pId", pId);
		model.addAttribute("bg", dietService.showBloodGlucoseInfo(param));
		return "diet/bg_edit";
	}
	
	@RequestMapping("bg_list")
	public String bloodGlucoseList(HttpServletRequest request, Model model){
		Map<String, Object> map = FormDataCollectUtil.getInstance().getFormDataWithPage(request);
		HttpSession session = request.getSession();
		String pId = (String)session.getAttribute("pId");
		map.put("pId", pId);
		List<Map<String, Object>> list = dietService.getBloodGlucoseList(map);
		model.addAttribute("bgList",list);
		model.addAttribute("curPage",map.get("curPage"));
		int total = dietService.countBloodGlucoseTotal(map);
		int numPerPage = (Integer)map.get("numPerPage");
		int totalPage = (int)Math.ceil((total*1.0)/numPerPage);
		model.addAttribute("totalPage",totalPage);
		return "diet/bg_list";
	}
	
	@RequestMapping("saveFoodInfo")
	public void saveFoodInfo(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		try {
			String str = dietService.saveFoodInfo(param);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(str);
		} catch (Exception e) {
			log.error(e);
		}
	}
	
	@RequestMapping("saveBloodGlucose")
	public void saveBloodGlucoseInfo(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		try {
			String str = dietService.saveBloodGlucoseInfo(param);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(str);
		} catch (Exception e) {
			log.error(e);
		}
	}
	
	@RequestMapping("deleteFoodInfo")
	public void deleteDoctorInfo(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		try {
			String str = dietService.deleteFoodInfo(param);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(str);
		} catch (Exception e) {
			log.error(e);
		}
	}
	
	@RequestMapping("saveAdvice")
	public void saveAdvice(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		try {
			HttpSession session = request.getSession();
			String dId = (String)session.getAttribute("dId");
			param.put("dId", dId);
			String str = dietService.saveAdvice(param);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(str);
		} catch (Exception e) {
			log.error(e);
		}
	}
	
}


