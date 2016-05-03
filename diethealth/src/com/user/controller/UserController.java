package com.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.common.util.FormDataCollectUtil;
import com.user.service.UserService;


	@Controller
	@RequestMapping("/user")
	public class UserController {
		@Resource
		private UserService userService;
		
		private Logger log = Logger.getLogger(UserController.class);
		
		
		/**
		 *   <p>【跳转到注册页面】</p>
		 *
		 * @author 林军雄  2014年12月2日 
		 *
		 * @param request
		 * @return
		 */
		@RequestMapping("/register")
		public  String register(HttpServletRequest request){
			
			return "user/register";
			
		}
		
		@RequestMapping("/admin_index")
		public  String toAdminIndex(HttpServletRequest request){
			return "user/admin_index";
			
		}
		@RequestMapping("/doctor_index")
		public  String toDoctorIndex(HttpServletRequest request){
			return "user/doctor_index";
			
		}
		
	@RequestMapping("/user_check")
	public void check(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> map = FormDataCollectUtil.getInstance()
				.getFormData(request);
		String type = map.get("type") == null ? null : map.get("type")
				.toString();
		try {
			Map<String, Object> result = userService.checkUser(map);
			response.setContentType("text/html;charset=utf-8");

			if (result != null) {
				request.getSession().setAttribute("name", result.get("name"));
				if ("patient".equals(type)) {
					request.getSession()
							.setAttribute("pId", result.get("p_id"));
				} else if ("doctor".equals(type)) {
					request.getSession()
							.setAttribute("dId", result.get("d_id"));
				}
				response.getWriter().print("1");

			} else {
				response.getWriter().print("0");
			}
		} catch (Exception e) {
			log.error(e);
		}

	}
		@RequestMapping("/saveUserInfo")
		public void updateUser(HttpServletRequest request,HttpServletResponse response){
			Map<String, Object> map = FormDataCollectUtil.getInstance().getFormData(request);
			try {
			String result = userService.updateUser(map);
			if("1".equals(result)){
				request.getSession().setAttribute("name", map.get("name"));
			}
			response.setContentType("text/html;charset=utf-8");
				response.getWriter().print(result);
			} catch (Exception e) {
				log.error(e);
			}
			
		}
		@RequestMapping("user_edit")
		public String patientEdit(HttpServletRequest request, Model model){
			HttpSession session = request.getSession();
			String pId = (String)session.getAttribute("pId");
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("pId", pId);
			model.addAttribute("user", userService.showUserInfo(param));
			model.addAttribute("doctorlist",userService.getDoctorList());
			return "user/user_edit";
		}
		
		@RequestMapping("user_index")
        public String toUserIndex(HttpServletRequest request){
			return "user/user_index";
		}
		
 	    @RequestMapping("/add_user")
	    public void addUser(HttpServletRequest request, HttpServletResponse response) {
			Map<String, Object> map = FormDataCollectUtil.getInstance()
					.getFormData(request);
			try {
				String result = userService.saveUser(map, request);
				if ("1".equals(result)) {
					request.getSession().setAttribute("name", map.get("name"));
				}
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().print(result);
			} catch (Exception e) {
				log.error(e);
			}
		}
		
		@RequestMapping("user_info")
		public void showUserInfo(HttpServletRequest request,Model model){
			Map<String, Object> map = FormDataCollectUtil.getInstance().getFormData(request);
			HttpSession session = request.getSession();
			String account  = (String)session.getAttribute("account");
			map.put("account", account);
			model.addAttribute("userInfo", userService.showUserInfo(map));
		}
		
		@RequestMapping("patient_list")
		public String toPatientList(HttpServletRequest request, Model model){
			Map<String, Object> map = FormDataCollectUtil.getInstance().getFormDataWithPage(request);
			List<Map<String, Object>> list = userService.getPatientList(map);
			model.addAttribute("patientList",list);
			int total = userService.countPatientTotal();
			int numPerPage = (Integer)map.get("numPerPage");
			int totalPage = (int)Math.ceil((total*1.0)/numPerPage);
			model.addAttribute("totalPage",totalPage);
			if(totalPage==0){
				model.addAttribute("curPage",0);
			}else{
				model.addAttribute("curPage",map.get("curPage"));
			}
			return "user/patient_list";
		}
		
		@RequestMapping("confirm_list")
		public String toConfirmList(HttpServletRequest request, Model model){
			Map<String, Object> map = FormDataCollectUtil.getInstance().getFormDataWithPage(request);
			map.put("state", "1");
			String doctorId = (String)request.getSession().getAttribute("dId");
			map.put("doctorId", doctorId);
			List<Map<String, Object>> list = userService.getPatientListWithState(map);
			model.addAttribute("patientList",list);
			int total = userService.countPatientTotalWithState(map);
			int numPerPage = (Integer)map.get("numPerPage");
			int totalPage = (int)Math.ceil((total*1.0)/numPerPage);
			model.addAttribute("totalPage",totalPage);
			if(totalPage==0){
				model.addAttribute("curPage",0);
			}else{
				model.addAttribute("curPage",map.get("curPage"));
			}
			return "user/confirm_list";
		}
		
		@RequestMapping("confirmed_list")
		public String toConfirmedList(HttpServletRequest request, Model model){
			Map<String, Object> map = FormDataCollectUtil.getInstance().getFormDataWithPage(request);
			map.put("state", "2");
			String doctorId = (String)request.getSession().getAttribute("dId");
			map.put("doctorId", doctorId);
			List<Map<String, Object>> list = userService.getPatientListWithState(map);
			model.addAttribute("patientList",list);
			int total = userService.countPatientTotalWithState(map);
			int numPerPage = (Integer)map.get("numPerPage");
			int totalPage = (int)Math.ceil((total*1.0)/numPerPage);
			model.addAttribute("totalPage",totalPage);
			if(totalPage==0){
				model.addAttribute("curPage",0);
			}else{
				model.addAttribute("curPage",map.get("curPage"));
			}
			return "user/confirmed_list";
		}
		
		@RequestMapping("doctor_list")
		public String toDoctorList(HttpServletRequest request, Model model){
			Map<String, Object> map = FormDataCollectUtil.getInstance().getFormDataWithPage(request);
			List<Map<String, Object>> list = userService.getDoctorList(map);
			model.addAttribute("doctorList",list);
			int total = userService.countDoctorTotal();
			int numPerPage = (Integer)map.get("numPerPage");
			int totalPage = (int)Math.ceil((total*1.0)/numPerPage);
			model.addAttribute("totalPage",totalPage);
			if(totalPage==0){
				model.addAttribute("curPage",0);
			}else{
				model.addAttribute("curPage",map.get("curPage"));
			}
			return "user/doctor_list";
		}
		@RequestMapping("doctor_edit")
		public String doctorEdit(HttpServletRequest request, Model model){
			HttpSession session = request.getSession();
			String dId = (String)session.getAttribute("dId");
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("dId", dId);
			model.addAttribute("doctor", userService.showDoctorInfo(param));
			return "user/doctor_edit";
		}
		
		@RequestMapping("doctor_add")
		public String doctorAdd(HttpServletRequest request){
			return "user/doctor_add";
		}
		
		@RequestMapping("doctor_delete")
		public String doctorDelete(HttpServletRequest request,Model model){
			Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
			model.addAttribute("doctor", userService.showDoctorInfo(param));
			return "user/doctor_delete";
		}
		
		@RequestMapping("patient_delete")
		public String patientDelete(HttpServletRequest request,Model model){
			Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
			model.addAttribute("patient", userService.showUserInfo(param));
			return "user/patient_delete";
		}
		
		@RequestMapping("updatePatientState")
		public void updatePatientState(HttpServletRequest request, HttpServletResponse response){
			Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
			try {
				String str = userService.updatePatientState(param);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().print(str);
			} catch (Exception e) {
				log.error(e);
			}
		}
		@RequestMapping("saveDoctorInfo")
		public void saveDoctorInfo(HttpServletRequest request, HttpServletResponse response){
			Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
			try {
				String str = userService.saveDoctorInfo(param);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().print(str);
			} catch (Exception e) {
				log.error(e);
			}
		}
		
		@RequestMapping("updateDoctorInfo")
		public void updateDoctorInfo(HttpServletRequest request, HttpServletResponse response){
			Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
			try {
				request.getSession().setAttribute("name", param.get("name"));
				String str = userService.saveDoctorInfo(param);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().print(str);
			} catch (Exception e) {
				log.error(e);
			}
		}
		
		@RequestMapping("deleteDoctorInfo")
		public void deleteDoctorInfo(HttpServletRequest request, HttpServletResponse response){
			Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
			try {
				String str = userService.deleteDoctorInfo(param);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().print(str);
			} catch (Exception e) {
				log.error(e);
			}
		}
		
		@RequestMapping("deletePatientInfo")
		public void deletePatientInfo(HttpServletRequest request, HttpServletResponse response){
			Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
			try {
				String str = userService.deletePatientInfo(param);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().print(str);
			} catch (Exception e) {
				log.error(e);
			}
		}
		
	}


